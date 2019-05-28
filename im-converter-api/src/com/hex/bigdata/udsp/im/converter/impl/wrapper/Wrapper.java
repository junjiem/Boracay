package com.hex.bigdata.udsp.im.converter.impl.wrapper;

import com.hex.bigdata.udsp.common.api.model.Datasource;
import com.hex.bigdata.udsp.common.constant.DataType;
import com.hex.bigdata.udsp.common.constant.Operator;
import com.hex.bigdata.udsp.common.util.JSONUtil;
import com.hex.bigdata.udsp.common.util.ObjectUtil;
import com.hex.bigdata.udsp.common.util.WebApplicationContextUtil;
import com.hex.bigdata.udsp.im.constant.BuildMode;
import com.hex.bigdata.udsp.im.constant.DatasourceType;
import com.hex.bigdata.udsp.im.constant.MetadataType;
import com.hex.bigdata.udsp.im.constant.UpdateMode;
import com.hex.bigdata.udsp.im.converter.BatchSourceConverter;
import com.hex.bigdata.udsp.im.converter.impl.model.HiveDatasource;
import com.hex.bigdata.udsp.im.converter.impl.model.HiveModel;
import com.hex.bigdata.udsp.im.converter.impl.model.Kafka1Model;
import com.hex.bigdata.udsp.im.converter.impl.model.KafkaModel;
import com.hex.bigdata.udsp.im.converter.impl.util.*;
import com.hex.bigdata.udsp.im.converter.model.*;
import com.hex.goframe.dao.GFDictMapper;
import com.hex.goframe.model.GFDict;
import com.hex.goframe.util.Util;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.FastDateFormat;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;

/**
 * Created by JunjieM on 2018-9-12.
 */
public abstract class Wrapper {

    private static Logger logger = LogManager.getLogger (Wrapper.class);
    private static final FastDateFormat format = FastDateFormat.getInstance ("yyyy-MM-dd HH:mm:ss.SSS");

    private static final String IM_IMPL_CLASS = "IM_IMPL_CLASS";
    protected static final String DATABASE_AND_TABLE_SEP = ".";
    protected static final String DATABASE_AND_TABLE_SEP_TRANS = "\\.";
    protected static final String HIVE_ENGINE_DATABASE_NAME = "UDSP";
    protected static final String HIVE_ENGINE_TABLE_SEP = "_";
    protected static final String HIVE_ENGINE_SOURCE_TABLE_PREFIX = HIVE_ENGINE_DATABASE_NAME
            + DATABASE_AND_TABLE_SEP + "E" + HIVE_ENGINE_TABLE_SEP + "S" + HIVE_ENGINE_TABLE_SEP;
    protected static final String HIVE_ENGINE_TARGET_TABLE_PREFIX = HIVE_ENGINE_DATABASE_NAME
            + DATABASE_AND_TABLE_SEP + "E" + HIVE_ENGINE_TABLE_SEP + "T" + HIVE_ENGINE_TABLE_SEP;
    protected static final String HIVE_DYNAMIC_ENGINE_SOURCE_TABLE_PREFIX = HIVE_ENGINE_DATABASE_NAME
            + DATABASE_AND_TABLE_SEP + "E" + HIVE_ENGINE_TABLE_SEP + "S" + HIVE_ENGINE_TABLE_SEP + "D" + HIVE_ENGINE_TABLE_SEP;

    private GFDictMapper gfDictMapper = (GFDictMapper) WebApplicationContextUtil.getBean (GFDictMapper.class);

    protected String getSourceTableName(String id) {
        id = id.replace ("HBASE" + HIVE_ENGINE_TABLE_SEP, "").replace ("SOLR" + HIVE_ENGINE_TABLE_SEP, "");
        return HIVE_ENGINE_SOURCE_TABLE_PREFIX + id;
    }

    protected String getTargetTableName(String id) {
        return HIVE_ENGINE_TARGET_TABLE_PREFIX + id;
    }

    private String getDynamicSourceTableName() {
        return HIVE_DYNAMIC_ENGINE_SOURCE_TABLE_PREFIX + Util.uuid ();
    }

    protected String getDataType(DataType type, String length) {
        String dataType = DataType.STRING.getValue ();
        if (DataType.STRING == type || DataType.INT == type || DataType.SMALLINT == type
                || DataType.BIGINT == type || DataType.BOOLEAN == type || DataType.DOUBLE == type
                || DataType.FLOAT == type || DataType.TINYINT == type) {
            dataType = type.getValue ();
        } else if (DataType.CHAR == type || DataType.VARCHAR == type || DataType.DECIMAL == type) {
            dataType = type.getValue () + (StringUtils.isBlank (length) ? "" : "(" + length + ")");
        } else if (DataType.TIMESTAMP == type) { // TIMESTAMP类型对于SOLR、Kudu、JDBC等会转换失败
            dataType = DataType.STRING.getValue ();
        }
        return dataType;
    }

    /**
     * 删除源引擎Schema
     *
     * @param model
     * @return
     * @throws SQLException
     */
    public void dropSourceEngineSchema(Model model) throws SQLException {
        HiveDatasource eHiveDs = new HiveDatasource (model.getEngineDatasource ());
        String id = model.getId ();
        String tableName = getSourceTableName (id);
        String sql = HiveSqlUtil.dropTable (true, tableName);
        JdbcUtil.executeUpdate (eHiveDs, sql);
    }

    /**
     * 批量构建
     *
     * @param key
     * @param model
     * @throws SQLException
     */
    public void buildBatch(String key, Model model) throws Exception {
        String id = model.getId ();
        String name = model.getName ();
        String describe = model.getDescribe ();
        Metadata metadata = model.getTargetMetadata ();
        List<ModelMapping> modelMappings = model.getModelMappings ();
        List<ModelFilterCol> modelFilterCols = model.getModelFilterCols ();
        Datasource sDs = model.getSourceDatasource ();
        String sDsId = sDs.getId ();
        Datasource eDs = model.getEngineDatasource ();
        HiveDatasource eHiveDs = new HiveDatasource (eDs);
        String eDsId = eDs.getId ();
        Datasource tDs = metadata.getDatasource ();
        String tDsId = tDs.getId ();
        String tDsType = tDs.getType ();
        /*
        引擎是基于Hive的接口实现的，当引擎表创建好后就指定了查询的SQL，
        所以对于已经的引擎表来说每次都是暴力扫描获取大批量结果数据，然后在Hive中再进行过滤，
        这种方式对于源来说会有很大的资源消耗、大量的网络IO和很长的响应时间。
        所以这里在非暴力查询模式下，我们会每次都新建一个Hive的引擎表，表中指定过滤的查询语句，
        这样就可以达到不同的过滤条件时不会每次都暴力扫描，可以在源就做好过滤获取少量的结果数据，然后给到Hive。
         */
        boolean violenceQuery = model.gainViolenceQuery ();

        // 判断是否要覆盖数据，则先清空数据
        if (BuildMode.INSERT_OVERWRITE == model.getBuildMode ()) {
            if(MetadataType.EXTERNAL == metadata.getType ()){ // 外表
                throw new IllegalArgumentException("目标元数据中的表是外表，不支持全量构建策略！");
            }
            logger.debug ("清空Schema数据【START】");
            emptyDatas (metadata); // 清空数据
            logger.debug ("清空Schema数据【END】");
        }

        // 增量插入数据
        logger.debug ("增量插入数据【START】");
        String selectSql = null;
        String selectTableName = null;
        String insertTableName = null;
        String insertSql = null;
        try {
            List<WhereProperty> whereProperties = getWhereProperties (modelFilterCols);

            if (sDsId.equals (eDsId)) { // 源、引擎的数据源相同
                HiveModel hiveModel = new HiveModel (model);
                selectSql = hiveModel.gainSelectSql ();
                selectTableName = hiveModel.gainDatabaseName () + DATABASE_AND_TABLE_SEP + hiveModel.gainTableName ();
            } else { // 源、引擎的数据源不同
                if (violenceQuery) { // 暴力查询
                    selectTableName = getSourceTableName (id);
                } else { // 非暴力查询
                    selectTableName = getDynamicSourceTableName ();
                    // 创建动态的源引擎Schema
                    getBatchSourceConverterImpl (model.getSourceDatasource ()).createSourceEngineSchema (model, selectTableName);
                    // 过滤条件清空
                    whereProperties = null;
                }
            }

            if (tDsId.equals (eDsId)) {// 目标、引擎的数据源相同
                insertTableName = metadata.getTbName ();
                modelMappings = getHiveModelMappings (metadata, modelMappings); // 查询的字段需要与Insert表的字段一致且对应
            } else { // 目标、引擎的数据源不同
                insertTableName = getTargetTableName (id);
            }

            List<String> selectColumns = getSelectColumns (modelMappings, metadata);

            // 目标表是HBase类型
            if (DatasourceType.HBASE.getValue ().equals (tDsType)) {
                // 新的select sql
                if (StringUtils.isNotBlank (selectSql)) {
                    selectSql = HiveSqlUtil.selectByHBase (selectColumns, selectSql, whereProperties);
                } else {
                    selectSql = HiveSqlUtil.select (selectColumns, selectTableName, whereProperties);
                }
                // 生成新的集合，必须在下面
                selectColumns = new ArrayList<> ();
                selectColumns.add ("KEY");
                selectColumns.add ("VAL");
                // 过滤条件清空，必须在下面
                whereProperties = null;
            }

            // 生成插入目标表SQL
            if (StringUtils.isNotBlank (selectSql)) {
                insertSql = HiveSqlUtil.insert2 (false, insertTableName, null,
                        selectColumns, selectSql, whereProperties);
            } else {
                insertSql = HiveSqlUtil.insert (false, insertTableName, null,
                        selectColumns, selectTableName, whereProperties);
            }

            // 使用set语法在Hive中设置参数，如：set mapred.map.tasks=50;
            String hiveSetSql = model.gainHiveSetSql ();

            // 设置MapReduce的job名称
            hiveSetSql += "set mapred.job.name=" + name + "(" + describe + ");";

            // 执行SQL
            HiveJdbcUtil.executeUpdate (key, eHiveDs, hiveSetSql + "\n" + insertSql);

        } finally {
            // 源、引擎的数据源不同且非暴力查询
            if (!sDsId.equals (eDsId) && !violenceQuery) {
                dropSourceEngineSchema (model, selectTableName); // 删除动态源引擎Schema
            }
        }
        logger.debug ("增量插入数据【END】");
    }

    // 获取实现类对象
    private BatchSourceConverter getBatchSourceConverterImpl(Datasource datasource) {
        return (BatchSourceConverter) ObjectUtil.newInstance (getImplClass (datasource));
    }

    // 获取实现类名称
    private String getImplClass(Datasource datasource) {
        String implClass = datasource.getImplClass ();
        if (StringUtils.isBlank (implClass)) {
            GFDict gfDict = gfDictMapper.selectByPrimaryKey (IM_IMPL_CLASS, datasource.getType ());
            implClass = gfDict.getDictName ();
        }
        return implClass;
    }

    // 删除动态源引擎Schema
    private void dropSourceEngineSchema(Model model, String engineSchemaName) throws SQLException {
        HiveDatasource eHiveDs = new HiveDatasource (model.getEngineDatasource ());
        String sql = HiveSqlUtil.dropTable (true, engineSchemaName);
        JdbcUtil.executeUpdate (eHiveDs, sql);
    }

    // 查询的字段需要与Insert表的字段一致且对应
    private List<ModelMapping> getHiveModelMappings(Metadata metadata, List<ModelMapping> modelMappings) {
        logger.debug ("目标与引擎数据源相同，查询的字段需要与Insert表的字段一致且对应！");
        Map<String, ModelMapping> map = new HashMap<> ();
        for (ModelMapping modelMapping : modelMappings) {
            map.put (modelMapping.getMetadataCol ().getName (), modelMapping);
        }
        List<ModelMapping> list = new ArrayList<> ();
        ModelMapping modelMapping = null;
        MetadataCol metadataCol = null;
        List<MetadataCol> metadataCols = metadata.getMetadataCols ();
        for (int i = 0; i < metadataCols.size (); i++) {
            metadataCol = metadataCols.get (i);
            String name = metadataCol.getName ();
            modelMapping = map.get (name);
            if (modelMapping == null) {
                modelMapping = new ModelMapping ();
                modelMapping.setMetadataCol (metadataCol);
                modelMapping.setName ("NULL");
            }
            modelMapping.setSeq ((short) (i + 1));
            list.add (modelMapping);
        }
        return list;
    }

    /**
     * 删除目标引擎Schema
     *
     * @param model
     * @return
     * @throws SQLException
     */
    public void dropTargetEngineSchema(Model model) throws SQLException {
        HiveDatasource eHiveDs = new HiveDatasource (model.getEngineDatasource ());
        String id = model.getId ();
        String tableName = getTargetTableName (id);
        String sql = HiveSqlUtil.dropTable (true, tableName);
        JdbcUtil.executeUpdate (eHiveDs, sql);
    }

    protected List<WhereProperty> getWhereProperties(List<ModelFilterCol> modelFilterCols) {
        if (modelFilterCols == null || modelFilterCols.size () == 0) {
            return null;
        }
        List<WhereProperty> whereProperties = new ArrayList<> ();
        for (ModelFilterCol filterCol : modelFilterCols) {
            WhereProperty whereProperty = new WhereProperty ();
            whereProperty.setName (filterCol.getName ());
            whereProperty.setValue (filterCol.getValue ());
            whereProperty.setType (filterCol.getType ());
            whereProperty.setOperator (filterCol.getOperator ());
            whereProperties.add (whereProperty);
        }
        return whereProperties;
    }

    protected DataType javaTransDBType(Object value) {
        DataType type = DataType.STRING;
        if (value instanceof Integer) {
            type = DataType.INT;
        } else if (value instanceof BigDecimal) {
            type = DataType.DECIMAL;
        } else if (value instanceof Long) {
            type = DataType.BIGINT;
        } else if (value instanceof BigInteger) {
            type = DataType.BIGINT;
        } else if (value instanceof Double) {
            type = DataType.DOUBLE;
        } else if (value instanceof Float) {
            type = DataType.FLOAT;
        } else if (value instanceof Short) {
            type = DataType.SMALLINT;
        } else if (value instanceof Boolean) {
            type = DataType.BOOLEAN;
        } else if (value instanceof Timestamp) {
            type = DataType.TIMESTAMP;
        }
        return type;
    }

    private List<WhereProperty> getWhereProperties(List<MetadataCol> updateKeys, List<ValueColumn> valueColumns) {
        Map<String, ValueColumn> map = new HashMap<> ();
        for (ValueColumn valueColumn : valueColumns) {
            map.put (valueColumn.getColName (), valueColumn);
        }
        List<WhereProperty> whereProperties = null;
        if (updateKeys != null && updateKeys.size () != 0) {
            whereProperties = new ArrayList<> ();
            for (MetadataCol metadataCol : updateKeys) {
                WhereProperty property = new WhereProperty ();
                String name = metadataCol.getName ();
                property.setName (name);
                property.setOperator (Operator.EQ);
                property.setType (metadataCol.getType ());
                ValueColumn valueColumn = map.get (name);
                if (valueColumn != null) {
                    property.setValue (valueColumn.getValue ());
                } else {
                    throw new IllegalArgumentException ("【更新主键】字段：" + name + "不在【映射字段】中！");
                }
                whereProperties.add (property);
            }
        }
        return whereProperties;
    }

    /**
     * 实时构建
     *
     * @param key
     * @param model
     * @return
     */
    public RealtimeResponse buildRealtime(String key, Model model) {
        String sDsType = model.getSourceDatasource ().getType ();
        UpdateMode updateMode = model.getUpdateMode ();
        List<ModelMapping> modelMappings = model.getModelMappings ();
        List<ModelFilterCol> modelFilterCols = model.getModelFilterCols ();
        List<MetadataCol> updateKeys = model.getUpdateKeys ();
        Metadata metadata = model.getTargetMetadata ();
        RealtimeResponse response = new RealtimeResponse ();
        StringBuilder sb = new StringBuilder (); // 异常信息
        long countNum = 0; // 消费总条数
        long parseFailedNum = 0; // 解析失败数
        long filterNum = 0; // 被过滤数
        long storeSucceedNum = 0; // 存储成功数
        long storeFailedNum = 0; // 存储失败数
        List<String> list = null;
        try {
            if (DatasourceType.KAFKA.getValue ().equals (sDsType)) { // 源是Kafka
                list = KafkaUtil.buildRealtime (new KafkaModel (model));
            } else if (DatasourceType.KAFKA1.getValue ().equals (sDsType)) { // 源是Kafka1
                list = Kafka1Util.buildRealtime (new Kafka1Model (model));
            }
            if (list != null && list.size () != 0) {
                countNum = list.size ();
                for (String message : list) {
                    logger.debug ("接收的信息为：" + message);
                    Map<String, String> map = null;
                    try {
                        map = JSONUtil.parseJSON2Map (message, String.class);
                    } catch (Exception e) {
                        parseFailedNum++;
                        e.printStackTrace ();
                        logger.warn ("接收到的一条数据解析失败，跳过进行下一条数据的处理！" + e.toString ());
                        sb.append (e.toString ());
                        continue;
                    }
                    // 实时数据过滤
                    List<ValueColumn> valueColumns = getValueColumns (modelMappings, modelFilterCols, map);
                    if (valueColumns == null || valueColumns.size () == 0) {
                        filterNum++;
                        logger.debug ("过滤后的信息为：NULL，跳过进行下一条数据的处理！");
                        continue;
                    }
                    logger.debug ("过滤后的信息为：" + JSONUtil.parseList2JSON (valueColumns));
                    // 实时数据处理
                    try {
                        if (UpdateMode.MATCHING_UPDATE == updateMode || UpdateMode.UPDATE_INSERT == updateMode) {
                            List<WhereProperty> whereProperties = getWhereProperties (updateKeys, valueColumns);
                            if (UpdateMode.MATCHING_UPDATE == updateMode) { // 匹配更新
                                matchingUpdate (metadata, modelMappings, valueColumns, whereProperties);
                            } else { // 更新插入
                                updateInsert (metadata, modelMappings, valueColumns, whereProperties);
                            }
                        } else {// 增量插入
                            insertInto (metadata, modelMappings, valueColumns);
                        }
                        storeSucceedNum++;
                    } catch (Exception e) {
                        storeFailedNum++;
                        e.printStackTrace ();
                        logger.warn ("接收到的一条数据序列化磁盘出错，跳过进行下一条数据的处理！" + e.toString ());
                        sb.append (e.toString ());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace ();
            sb.append (e.toString ());
        }
        response.setCountNum (countNum);
        response.setMessage (sb.toString ());
        response.setFilterNum (filterNum);
        response.setParseFailedNum (parseFailedNum);
        response.setStoreSucceedNum (storeSucceedNum);
        response.setStoreFailedNum (storeFailedNum);
        return response;
    }

    // 实时数据过滤
    private List<ValueColumn> getValueColumns(List<ModelMapping> modelMappings, List<ModelFilterCol> modelFilterCols, Map<String, String> map) {
        List<ValueColumn> valueColumns = new ArrayList<> ();
        for (ModelMapping mapping : modelMappings) {
            // 过滤值
            String name = mapping.getName ();
            String value = map.get (name);
            // 过滤行
            for (ModelFilterCol filterCol : modelFilterCols) {
                if (filterCol.getName ().equals (name)) {
                    Operator operator = filterCol.getOperator ();
                    String filterValue = filterCol.getValue ();
                    if (StringUtils.isNotBlank (filterValue)) {
                        if (Operator.EQ.equals (operator) && !filterValue.equals (value)) {
                            return null;
                        } else if (Operator.NE.equals (operator) && filterValue.equals (value)) {
                            return null;
                        } else if (Operator.GT.equals (operator) && filterValue.compareTo (value) >= 0) {
                            return null;
                        } else if (Operator.GE.equals (operator) && filterValue.compareTo (value) > 0) {
                            return null;
                        } else if (Operator.LT.equals (operator) && filterValue.compareTo (value) <= 0) {
                            return null;
                        } else if (Operator.LE.equals (operator) && filterValue.compareTo (value) < 0) {
                            return null;
                        } else if (Operator.LK.equals (operator) && !value.contains (filterValue)) {
                            return null;
                        } else if (Operator.RLIKE.equals (operator) && !value.startsWith (filterValue)) {
                            return null;
                        } else if (Operator.IN.equals (operator)) {
                            String[] vs = filterValue.split (",");
                            if (!Arrays.asList (vs).contains (value)) {
                                return null;
                            }
                        }
                    }
                }
            }
            // 封装
            ValueColumn column = new ValueColumn ();
            MetadataCol metadataCol = mapping.getMetadataCol ();
            column.setColName (metadataCol.getName ());
            column.setDataType (metadataCol.getType ());
            column.setLength (metadataCol.getLength ());
            column.setValue (value);
            valueColumns.add (column);
        }
        return valueColumns;
    }

    /**
     * 增量插入
     *
     * @param metadata
     * @param modelMappings
     * @param valueColumns
     * @throws Exception
     */

    protected abstract void insertInto(Metadata metadata, List<ModelMapping> modelMappings, List<ValueColumn> valueColumns) throws Exception;

    /**
     * 更新、插入
     *
     * @param metadata
     * @param modelMappings
     * @param valueColumns
     * @param whereProperties
     * @throws Exception
     */
    protected abstract void updateInsert(Metadata metadata, List<ModelMapping> modelMappings, List<ValueColumn> valueColumns, List<WhereProperty> whereProperties) throws Exception;

    /**
     * 匹配更新
     *
     * @param metadata
     * @param modelMappings
     * @param valueColumns
     * @param whereProperties
     * @throws Exception
     */
    protected abstract void matchingUpdate(Metadata metadata, List<ModelMapping> modelMappings, List<ValueColumn> valueColumns, List<WhereProperty> whereProperties) throws Exception;

    /**
     * 获取查询字段集合
     *
     * @param modelMappings
     * @param metadata
     * @return
     */
    protected abstract List<String> getSelectColumns(List<ModelMapping> modelMappings, Metadata metadata);

    /**
     * 清空表数据
     *
     * @param metadata
     */
    public abstract void emptyDatas(Metadata metadata) throws Exception;
}
