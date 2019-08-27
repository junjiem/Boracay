package com.hex.bigdata.udsp.iq.service;

import com.hex.bigdata.udsp.common.aggregator.H2Aggregator;
import com.hex.bigdata.udsp.common.aggregator.constant.H2DataType;
import com.hex.bigdata.udsp.common.aggregator.model.H2DataColumn;
import com.hex.bigdata.udsp.common.aggregator.model.H2Response;
import com.hex.bigdata.udsp.common.api.model.Datasource;
import com.hex.bigdata.udsp.common.api.model.Page;
import com.hex.bigdata.udsp.common.api.model.Property;
import com.hex.bigdata.udsp.common.constant.*;
import com.hex.bigdata.udsp.common.model.ComDatasource;
import com.hex.bigdata.udsp.common.model.ComProperties;
import com.hex.bigdata.udsp.common.service.ComDatasourceService;
import com.hex.bigdata.udsp.common.service.ComPropertiesService;
import com.hex.bigdata.udsp.common.util.DatasourceUtil;
import com.hex.bigdata.udsp.common.util.JSONUtil;
import com.hex.bigdata.udsp.common.util.ObjectUtil;
import com.hex.bigdata.udsp.dsl.DslSqlAdaptor;
import com.hex.bigdata.udsp.dsl.model.*;
import com.hex.bigdata.udsp.iq.model.*;
import com.hex.bigdata.udsp.iq.provider.Provider;
import com.hex.bigdata.udsp.iq.provider.model.*;
import com.hex.bigdata.udsp.iq.provider.model.dsl.IqDslRequest;
import com.hex.bigdata.udsp.iq.provider.model.dsl.IqDslResponse;
import com.hex.goframe.dao.GFDictMapper;
import com.hex.goframe.model.GFDict;
import com.hex.goframe.service.BaseService;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.FastDateFormat;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.*;

/**
 * Created by junjiem on 2017-3-2.
 */
@Service
public class IqProviderService extends BaseService {
    private static Logger logger = LogManager.getLogger (IqProviderService.class);
    private static final String IQ_IMPL_CLASS = "IQ_IMPL_CLASS";
    private static final String MAX_VALUE_EXPRESSION = "${maxValue}";

    private static final FastDateFormat format8 = FastDateFormat.getInstance ("yyyyMMdd");
    private static final FastDateFormat format10 = FastDateFormat.getInstance ("yyyy-MM-dd");
    private static final FastDateFormat format17 = FastDateFormat.getInstance ("yyyyMMdd HH:mm:ss");
    private static final FastDateFormat format19 = FastDateFormat.getInstance ("yyyy-MM-dd HH:mm:ss");

    @Autowired
    private IqApplicationService iqApplicationService;
    @Autowired
    private IqMetadataService iqMetadataService;
    @Autowired
    private IqMetadataColService iqMetadataColService;
    @Autowired
    private ComDatasourceService comDatasourceService;
    @Autowired
    private ComPropertiesService comPropertiesService;
    @Autowired
    private IqAppQueryColService iqAppQueryColService;
    @Autowired
    private IqAppReturnColService iqAppReturnColService;
    @Autowired
    private IqAppOrderColService iqAppOrderColService;
    @Autowired
    private GFDictMapper gfDictMapper;
    @Autowired
    private H2Aggregator h2Aggregator;

    /**
     * 获取字段信息
     *
     * @param dsId
     * @param schemaName
     * @return
     */
    public List<MetadataCol> getColumnInfo(String dsId, String schemaName) {
        ComDatasource comDatasource = comDatasourceService.select (dsId);
        List<ComProperties> comPropertiesList = comPropertiesService.selectList (dsId);
        Datasource datasource = DatasourceUtil.getDatasource (comDatasource, comPropertiesList);
        return getProviderImpl (datasource).columnInfo (datasource, schemaName);
    }

    /**
     * 查询
     *
     * @param appId
     * @param paraMap
     * @return
     */
    public IqResponse select(String appId, Map<String, String> paraMap) {
        paraMap = getMaxValuesParaMap (appId, paraMap);
        Application application = getApplication (appId, paraMap);
        IqRequest request = new IqRequest (application);
        Datasource datasource = application.getMetadata ().getDatasource ();
        IqResponse response = getProviderImpl (datasource).query (request);
        response.setColumns (returnColumns (application.getReturnColumns ())); // 设置返回字段信息
        return response;
    }

    /**
     * 分页查询
     *
     * @param appId
     * @param paraMap
     * @param page
     * @return
     */
    public IqResponse select(String appId, Map<String, String> paraMap, Page page) {
        Application application = getApplication (appId, paraMap);
        Datasource datasource = application.getMetadata ().getDatasource ();
        page = getPage (page, datasource);
        IqRequest request = new IqRequest (application);
        IqResponse response = getProviderImpl (datasource).query (request, page);
        response.setColumns (returnColumns (application.getReturnColumns ())); // 设置返回字段信息
        return response;
    }

    private Map<String, String> getMaxValuesParaMap(String appId, Map<String, String> paraMap) {
        Map<String, String> maxValues = getMaxValues (appId);
        if (maxValues != null && maxValues.size () != 0) {
            for (Map.Entry<String, String> entry : maxValues.entrySet ()) {
                paraMap.put (entry.getKey (), entry.getValue ());
            }
        }
        logger.info ("paraMap: " + JSONUtil.parseMap2JSON (paraMap));
        return paraMap;
    }

    private Map<String, String> getMaxValues(String appId) {
        Map<String, String> maxValues = new HashMap<> ();
        Application application = getApplication (appId);
        // 重新组织查询字段
        Map<String, QueryColumn> maxValueQueryColumns = new HashMap<> ();
        List<QueryColumn> queryColumns = new ArrayList<> ();
        for (QueryColumn queryColumn : application.getQueryColumns ()) {
            // 值为${maxValue}时，即最大值表达式
            if (MAX_VALUE_EXPRESSION.equalsIgnoreCase (queryColumn.getValue ())) {
                maxValueQueryColumns.put (queryColumn.getName (), queryColumn);
            } else {
                queryColumns.add (queryColumn);
            }
        }
        application.setQueryColumns (queryColumns);
        // 查询参数的值中有${maxValue}
        if (maxValueQueryColumns.size () != 0) {
            // 重新组织排序字段
            List<OrderColumn> orderColumns = new ArrayList<> ();
            short seq = 0;
            for (Map.Entry<String, QueryColumn> entry : maxValueQueryColumns.entrySet ()) {
                QueryColumn queryColumn = entry.getValue ();
                OrderColumn orderColumn = new OrderColumn ();
                orderColumn.setSeq (seq);
                orderColumn.setOrder (com.hex.bigdata.udsp.common.constant.Order.DESC);
                orderColumn.setName (queryColumn.getName ());
                orderColumn.setType (queryColumn.getType ());
                orderColumn.setDescribe (queryColumn.getDescribe ());
                orderColumns.add (orderColumn);
                seq++;
            }
            application.setOrderColumns (orderColumns);
            // 重新组织返回字段
            List<ReturnColumn> returnColumns = new ArrayList<> ();
            for (DataColumn dataColumn : application.getMetadata ().getReturnColumns ()) {
                ReturnColumn returnColumn = new ReturnColumn ();
                returnColumn.setSeq (dataColumn.getSeq ());
                returnColumn.setName (dataColumn.getName ());
                returnColumn.setType (dataColumn.getType ());
                returnColumn.setDescribe (dataColumn.getDescribe ());
                returnColumn.setLength (dataColumn.getLength ());
                returnColumn.setLabel (dataColumn.getName ()); // 别名和字段名一致
                returnColumn.setStats (Stats.NONE);
                returnColumns.add (returnColumn);
            }
            application.setReturnColumns (returnColumns);
            IqRequest request = new IqRequest (application);
            Datasource datasource = application.getMetadata ().getDatasource ();
            IqResponse response = getProviderImpl (datasource).query (request);
            if (Status.SUCCESS == response.getStatus ()) {
                // key值是别名，这里由于returnColumns中别名和字段名一致，所以不需要转换
                List<Map<String, String>> records = response.getRecords ();
                logger.debug ("records: " + JSONUtil.parseList2JSON (records));
                if (records != null && records.size () != 0) {
                    Map<String, String> record = records.get (0);
                    logger.debug ("record: " + JSONUtil.parseMap2JSON (record));
                    for (Map.Entry<String, QueryColumn> entry : maxValueQueryColumns.entrySet ()) {
                        maxValues.put (entry.getValue ().getLabel (), record.get (entry.getValue ().getName ()));
                    }
                }
            }
        }
        logger.info ("maxValues: " + JSONUtil.parseMap2JSON (maxValues));
        return maxValues;
    }

    /**
     * 自定义DSL查询（支持多服务关联查询）
     *
     * @param mdIds
     * @param dslSelectSql
     * @return
     */
    public IqDslResponse select(Map<String, String> mdIds, DslSelectSql dslSelectSql) {
        IqDslResponse response = new IqDslResponse ();
        // 查询IQ
        long consumeTime = 0;
        List<DslSql> dslSqls = dslSelectSql.getDslSqls ();
        if (dslSqls != null && dslSqls.size () != 0) {
            for (DslSql dslSql : dslSqls) {
                String serviceName = dslSql.getName ();
                String mdId = mdIds.get (serviceName);
                response = selectAndLoad (mdId, dslSql);
                if (StatusCode.SUCCESS != response.getStatusCode ()) {
                    response.setMessage (serviceName + "服务错误信息：" + response.getMessage ());
                    return response;
                }
                response.setConsumeTime (consumeTime + response.getConsumeTime ());
                consumeTime = response.getConsumeTime ();
            }
        }
        // 查询H2
        H2Response h2Response = h2Aggregator.query (getH2Sql (dslSelectSql));
        response.setStatus (Status.SUCCESS);
        response.setStatusCode (StatusCode.SUCCESS);
        response.setColumns (h2Response.getColumns ());
        response.setRecords (h2Response.getRecords ());
        return response;
    }

    // 查询并加载到H2
    private IqDslResponse selectAndLoad(String mdId, DslSql dslSql) {
        IqDslResponse response = new IqDslResponse ();
        response.setStatus (Status.SUCCESS);
        response.setStatusCode (StatusCode.SUCCESS);
        Metadata metadata = getMetadata (mdId);
        checkDslSql (dslSql, metadata); // 检查和重构DslSql
        Component where = dslSql.getWhere ();
        String h2TableName = h2Aggregator.getH2TableName (dslSql.getName (), where);
        logger.info ("h2TableName: " + h2TableName);
        synchronized (h2TableName.intern ()) {
            if (h2Aggregator.isReload (h2TableName)) {
                // query from iq datasource
                IqDslRequest request = new IqDslRequest (metadata, where);
                Datasource datasource = metadata.getDatasource ();
                response = getProviderImpl (datasource).select (request);
                if (StatusCode.SUCCESS != response.getStatusCode ()
                        || response.getRecords () == null || response.getRecords ().size () == 0) {
                    return response;
                }
                // load to h2 database
                h2Aggregator.load (h2TableName, getH2DataColumns (metadata.getReturnColumns ()), response.getRecords ());
            }
        }
        return response;
    }

    private String getH2Sql(DslSelectSql dslSelectSql) {
        List<DslSql> dslSqls = dslSelectSql.getDslSqls ();
        if (dslSqls != null && dslSqls.size () != 0) {
            for (DslSql dslSql : dslSqls) {
                dslSql.setName (h2Aggregator.getH2TableName (dslSql.getName (), dslSql.getWhere ()));
                dslSql.setWhere (null);
            }
            dslSelectSql.setDslSqls (dslSqls);
        }
        return DslSqlAdaptor.objectToSql (dslSelectSql);
    }

    private List<H2DataColumn> getH2DataColumns(List<DataColumn> columns) {
        List<H2DataColumn> h2Columns = new ArrayList<> ();
        for (DataColumn column : columns) {
            h2Columns.add (getH2DataColumn (column));
        }
        return h2Columns;
    }

    private H2DataColumn getH2DataColumn(DataColumn column) {
        switch (column.getType ()) {
            case VARCHAR:
                return new H2DataColumn (column.getName (), H2DataType.VARCHAR, column.getLength ());
            case CHAR:
                return new H2DataColumn (column.getName (), H2DataType.CHAR, column.getLength ());
            case DECIMAL:
                return new H2DataColumn (column.getName (), H2DataType.DECIMAL, column.getLength ());
            case BIGINT:
                return new H2DataColumn (column.getName (), H2DataType.BIGINT);
            case DOUBLE:
                return new H2DataColumn (column.getName (), H2DataType.DOUBLE);
            case INT:
                return new H2DataColumn (column.getName (), H2DataType.INT);
            case SMALLINT:
                return new H2DataColumn (column.getName (), H2DataType.SMALLINT);
            case TIMESTAMP:
                return new H2DataColumn (column.getName (), H2DataType.TIMESTAMP);
            case BOOLEAN:
                return new H2DataColumn (column.getName (), H2DataType.BOOLEAN);
            case TINYINT:
                return new H2DataColumn (column.getName (), H2DataType.TINYINT);
            case STRING:
            default:
                return new H2DataColumn (column.getName (), H2DataType.VARCHAR, "" + Integer.MAX_VALUE);
        }
    }

    private void checkDslSql(DslSql dslSql, Metadata metadata) {
        List<DataColumn> queryColumns = metadata.getQueryColumns ();
        Map<String, DataType> queryMap = new HashMap<> ();
        for (DataColumn col : queryColumns) {
            queryMap.put (col.getName (), col.getType ());
        }
        // 查询字段
        Component where = dslSql.getWhere ();
        if (where != null) {
            checkWhere (where, queryMap);
        }
    }

    private void checkWhere(Component where, Map<String, DataType> queryMap) {
        // 严格模式：判断是否有不存在的字段并抛异常
        String message = "";
        message = checkWhereIsQueryFields (where, queryMap, "");
        if (StringUtils.isNotBlank (message)) {
            throw new IllegalArgumentException ("Invalid where fields " + message + ".");
        }
        // 严格模式：判断是否有值是空的字段并抛异常
        message = checkWhereIsNullValue (where, "");
        if (StringUtils.isNotBlank (message)) {
            throw new IllegalArgumentException ("Null value where fields " + message + ".");
        }
    }

    private String checkWhereIsQueryFields(Component component, Map<String, DataType> queryMap, String message) {
        if (component instanceof Composite) {
            Composite composite = (Composite) component;
            List<Component> components = composite.getComponents ();
            for (Component c : components) {
                message = checkWhereIsQueryFields (c, queryMap, message);
            }
        } else if (component instanceof Dimension) {
            Dimension dimension = (Dimension) component;
            String name = dimension.getColumnName ();
            if (queryMap.get (name) == null) {
                message += (StringUtils.isBlank (message) ? "" : ", ") + "`" + name + "`";
            }
        }
        return message;
    }

    private String checkWhereIsNullValue(Component component, String message) {
        if (component instanceof Composite) {
            Composite composite = (Composite) component;
            List<Component> components = composite.getComponents ();
            for (Component c : components) {
                message = checkWhereIsNullValue (c, message);
            }
        } else if (component instanceof Dimension) {
            Dimension dimension = (Dimension) component;
            String name = dimension.getColumnName ();
            List<String> values = dimension.getValues ();
            if (values == null || values.size () == 0) {
                message += (StringUtils.isBlank (message) ? "" : ", ") + "`" + name + "`";
            } else {
                for (String value : values) {
                    if (StringUtils.isBlank (value)) {
                        message += (StringUtils.isBlank (message) ? "" : ", ") + "`" + name + "`";
                        break;
                    }
                }
            }
        }
        return message;
    }

    private Page getPage(Page page, Datasource datasource) {
        IqDatasource iqDatasource = new IqDatasource (datasource);
        int maxSize = iqDatasource.gainMaxSize ();
        boolean maxSizeAlarm = iqDatasource.gainMaxSizeAlarm ();
        int pageSize = page.getPageSize ();
        if (pageSize > maxSize) {
            if (maxSizeAlarm) {
                throw new IllegalArgumentException ("每页返回数据大小超过了最大返回数据条数的限制");
            }
            pageSize = maxSize;
        }
        page.setPageSize (pageSize);
        return page;
    }

    private LinkedHashMap<String, String> returnColumns(List<ReturnColumn> returnColumns) {
        LinkedHashMap<String, String> columnMap = new LinkedHashMap<> ();
        for (ReturnColumn returnColumn : returnColumns) {
            columnMap.put (returnColumn.getLabel (), returnColumn.getType ().getValue ());
        }
        return columnMap;
    }

    private Application getApplication(String appId, Map<String, String> paraMap) {
        Application application = getApplication (appId);
        // 宽松模式：只保留存在字段的值，不判断是否有不存在的字段并抛异常
        String message = "";
        for (QueryColumn queryColumn : application.getQueryColumns ()) {
            boolean isNeed = queryColumn.isNeed ();
            DataType type = queryColumn.getType ();
            int length = getLen (queryColumn.getLength ());
            String label = queryColumn.getLabel ();
            String value = (paraMap != null ? paraMap.get (label) : null);
            if (StringUtils.isBlank (value)) {
                value = queryColumn.getDefaultVal (); // 默认值
            }
            if (StringUtils.isNotBlank (value)) {
                if (DataType.TIMESTAMP.equals (type)) { // 字段类型是TIMESTAMP
                    value = tarnDateStr (length, value); // 日期格式转换
                }
            }
            queryColumn.setValue (value);
            if (isNeed && StringUtils.isBlank (value)) {
                message += (StringUtils.isBlank (message) ? "" : ", ") + label;
            }
        }
        if (StringUtils.isNotBlank (message)) {
            throw new IllegalArgumentException (message + "参数不能为空!");
        }
        return application;
    }

    public Application getApplication(String appId) {
        IqApplication iqApplication = iqApplicationService.select (appId);
        List<IqAppQueryCol> iqAppQueryColList = iqAppQueryColService.selectByAppId (appId);
        List<IqAppReturnCol> iqAppReturnColList = iqAppReturnColService.selectByAppId (appId);
        List<IqAppOrderCol> iqAppOrderColList = iqAppOrderColService.selectByAppId (appId);
        String mdId = iqApplication.getMdId ();

        List<ComProperties> appProperties = comPropertiesService.selectList (appId);
        List<Property> appPropertyList = new ArrayList<> (appProperties.size ());
        for (ComProperties properties : appProperties) {
            Property property = new Property ();
            property.setName (properties.getName ());
            property.setValue (properties.getValue ());
            property.setDescribe (properties.getDescribe ());
            appPropertyList.add (property);
        }

        // ----------------数据封装-----------------------
        Application application = new Application (appPropertyList);
        application.setName (iqApplication.getName ());
        application.setDescribe (iqApplication.getDescribe ());
        application.setNote (iqApplication.getNote ());
        List<QueryColumn> queryColumnList = new ArrayList<> ();
        for (IqAppQueryCol iqAppQueryCol : iqAppQueryColList) {
            QueryColumn queryColumn = new QueryColumn ();
            queryColumn.setSeq (iqAppQueryCol.getSeq ());
            queryColumn.setDescribe (iqAppQueryCol.getDescribe ());
            queryColumn.setName (iqAppQueryCol.getName ());
            queryColumn.setDefaultVal (iqAppQueryCol.getDefaultVal ());
            queryColumn.setLabel (iqAppQueryCol.getLabel ());
            queryColumn.setLength (iqAppQueryCol.getLength ());
            queryColumn.setNeed (EnumTrans.transTrue (iqAppQueryCol.getIsNeed ()));
            queryColumn.setOfferOut (EnumTrans.transTrue (iqAppQueryCol.getIsOfferOut ()));
            queryColumn.setOperator (EnumTrans.transOperator (iqAppQueryCol.getOperator ()));
            queryColumn.setType (EnumTrans.transDataType (iqAppQueryCol.getType ()));
            //queryColumn.setValue(paraMap.get(iqAppQueryCol.getName()));
            queryColumnList.add (queryColumn);
        }
        application.setQueryColumns (queryColumnList);
        List<ReturnColumn> returnColumnList = new ArrayList<> ();
        for (IqAppReturnCol iqAppReturnCol : iqAppReturnColList) {
            ReturnColumn returnColumn = new ReturnColumn ();
            returnColumn.setSeq (iqAppReturnCol.getSeq ());
            returnColumn.setDescribe (iqAppReturnCol.getDescribe ());
            returnColumn.setName (iqAppReturnCol.getName ());
            returnColumn.setLabel (iqAppReturnCol.getLabel ());
            returnColumn.setLength (iqAppReturnCol.getLength ());
            returnColumn.setStats (EnumTrans.transStats (iqAppReturnCol.getStats ()));
            returnColumn.setType (EnumTrans.transDataType (iqAppReturnCol.getType ()));
            returnColumnList.add (returnColumn);
        }
        application.setReturnColumns (returnColumnList);
        List<OrderColumn> orderColumnList = new ArrayList<> ();
        for (IqAppOrderCol iqAppOrderCol : iqAppOrderColList) {
            OrderColumn orderColumn = new OrderColumn ();
            orderColumn.setSeq (iqAppOrderCol.getSeq ());
            orderColumn.setDescribe (iqAppOrderCol.getDescribe ());
            orderColumn.setName (iqAppOrderCol.getName ());
            orderColumn.setType (EnumTrans.transDataType (iqAppOrderCol.getType ()));
            orderColumn.setOrder (EnumTrans.transOrder (iqAppOrderCol.getOrderType ()));
            orderColumnList.add (orderColumn);
        }
        application.setOrderColumns (orderColumnList);
        application.setMetadata (getMetadata (mdId));
        return application;
    }

    public Metadata getMetadata(String mdId) {
        IqMetadata iqMetadata = iqMetadataService.select (mdId);
        List<IqMetadataCol> iqMetadataQueryColList = iqMetadataColService.selectQueryColList (mdId);
        List<IqMetadataCol> iqMetadataReturnColList = iqMetadataColService.selectReturnColList (mdId);
        String dsId = iqMetadata.getDsId ();

        List<ComProperties> mdProperties = comPropertiesService.selectList (mdId);
        List<Property> mdPropertyList = new ArrayList<> (mdProperties.size ());
        for (ComProperties properties : mdProperties) {
            Property property = new Property ();
            property.setName (properties.getName ());
            property.setValue (properties.getValue ());
            property.setDescribe (properties.getDescribe ());
            mdPropertyList.add (property);
        }

        // ----------------数据封装-----------------------
        Metadata metadata = new Metadata (mdPropertyList);
        metadata.setName (iqMetadata.getName ());
        metadata.setDescribe (iqMetadata.getDescribe ());
        metadata.setNote (iqMetadata.getNote ());
        metadata.setTbName (iqMetadata.getTbName ());
        List<DataColumn> queryColumns = new ArrayList<> ();
        for (IqMetadataCol iqMetadataCol : iqMetadataQueryColList) {
            DataColumn dataColumn = new DataColumn ();
            dataColumn.setSeq (iqMetadataCol.getSeq ());
            dataColumn.setName (iqMetadataCol.getName ());
            dataColumn.setDescribe (iqMetadataCol.getDescribe ());
            dataColumn.setNote (iqMetadataCol.getNote ());
            dataColumn.setLength (iqMetadataCol.getLength ());
            dataColumn.setType (EnumTrans.transDataType (iqMetadataCol.getColType ()));
            queryColumns.add (dataColumn);
        }
        metadata.setQueryColumns (queryColumns);
        List<DataColumn> returnColumns = new ArrayList<> ();
        for (IqMetadataCol iqMetadataCol : iqMetadataReturnColList) {
            DataColumn dataColumn = new DataColumn ();
            dataColumn.setSeq (iqMetadataCol.getSeq ());
            dataColumn.setName (iqMetadataCol.getName ());
            dataColumn.setDescribe (iqMetadataCol.getDescribe ());
            dataColumn.setNote (iqMetadataCol.getNote ());
            dataColumn.setLength (iqMetadataCol.getLength ());
            dataColumn.setType (EnumTrans.transDataType (iqMetadataCol.getColType ()));
            returnColumns.add (dataColumn);
        }
        metadata.setReturnColumns (returnColumns);
        metadata.setDatasource (getDatasource (dsId));
        return metadata;
    }

    private Datasource getDatasource(String dsId) {
        ComDatasource comDatasource = comDatasourceService.select (dsId);
        List<ComProperties> comPropertiesList = comPropertiesService.selectList (dsId);
        return DatasourceUtil.getDatasource (comDatasource, comPropertiesList);
    }

    public boolean testDatasource(Datasource datasource) {
        Provider provider = getProviderImpl (datasource);
        return provider.testDatasource (datasource);
    }

    private Provider getProviderImpl(Datasource datasource) {
        return (Provider) ObjectUtil.newInstance (getImplClass (datasource));
    }

    private String getImplClass(Datasource datasource) {
        String implClass = datasource.getImplClass ();
        if (StringUtils.isBlank (implClass)) {
            GFDict gfDict = gfDictMapper.selectByPrimaryKey (IQ_IMPL_CLASS, datasource.getType ());
            implClass = gfDict.getDictName ();
        }
        return implClass;
    }

    private String tarnDateStr(int length, String value) {
        if (length == 8 || length == 10 || length == 17 || length == 19) {
            Date date = strToDate (value);
            if (date != null) {
                if (length == 8) {
                    value = format8.format (date);
                } else if (length == 10) {
                    value = format10.format (date);
                } else if (length == 17) {
                    value = format17.format (date);
                } else if (length == 19) {
                    value = format19.format (date);
                }
            }
        }
        return value;
    }

    private Date strToDate(String dataStr) {
        Date date = null;
        try {
            if (dataStr.length () == 8) {
                date = format8.parse (dataStr);
            } else if (dataStr.length () == 10) {
                date = format10.parse (dataStr.replaceAll ("/", "-"));
            } else if (dataStr.length () == 17) {
                date = format17.parse (dataStr);
            } else if (dataStr.length () == 19) {
                date = format19.parse (dataStr.replaceAll ("/", "-"));
            }
        } catch (ParseException e) {
            throw new IllegalArgumentException ("日期字段传入的不是日期格式字符串参数");
        }
        return date;
    }

    private int getLen(String length) {
        int len = 0;
        if (StringUtils.isNotBlank (length) && StringUtils.isNumeric (length)) {
            len = Integer.valueOf (length);
        }
        return len;
    }
}
