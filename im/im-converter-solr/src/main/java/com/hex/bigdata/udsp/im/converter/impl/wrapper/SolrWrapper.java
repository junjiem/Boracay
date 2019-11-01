package com.hex.bigdata.udsp.im.converter.impl.wrapper;

import com.hex.bigdata.udsp.im.converter.BatchSourceConverter;
import com.hex.bigdata.udsp.im.converter.BatchTargetConverter;
import com.hex.bigdata.udsp.im.converter.RealtimeTargetConverter;
import com.hex.bigdata.udsp.im.converter.impl.model.SolrDatasource;
import com.hex.bigdata.udsp.im.converter.impl.util.SolrUtil;
import com.hex.bigdata.udsp.im.converter.model.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by JunjieM on 2017-9-7.
 */
public abstract class SolrWrapper extends Wrapper implements BatchSourceConverter, BatchTargetConverter, RealtimeTargetConverter {
    private static Logger logger = LogManager.getLogger(SolrWrapper.class);
    protected static final String HIVE_ENGINE_STORAGE_HANDLER_CLASS = "com.hex.hive.solr.SolrStorageHandler";

    protected String getSourcePrimaryKey(List<ModelMapping> modelMappings) {
        for (ModelMapping mapping : modelMappings) {
            if (mapping.isPrimary()) {
                return mapping.getName();
            }
        }
        return null;
    }

    protected String getTargetPrimaryKey(List<ModelMapping> modelMappings) {
        for (ModelMapping mapping : modelMappings) {
            MetadataCol metadataCol = mapping.getMetadataCol();
            if (metadataCol.isPrimary()) {
                return metadataCol.getName();
            }
        }
        return null;
    }

    protected List<TblProperty> getSourceTblProperties(SolrDatasource datasource, String pkName, String collectionName,
                                                       List<ModelMapping> modelMappings, String solrQuery) {
        if (StringUtils.isBlank(pkName)) {
            throw new IllegalArgumentException("主键字段不能为空");
        }

        List<TblProperty> tblProperties = new ArrayList<>();
        tblProperties.add(new TblProperty("is.solrcloud", "1")); // 0：单机模式，1：集群模式
        // 单机模式时solr.url为solrUrl，集群模式时solr.url为zkHost
        tblProperties.add(new TblProperty("solr.url", datasource.gainSolrZkHost()));
        if (StringUtils.isBlank(solrQuery)) {solrQuery = "*:*";}
        tblProperties.add(new TblProperty("solr.query", solrQuery)); // Solr查询语句
        tblProperties.add(new TblProperty("solr.cursor.batch.size", "1024")); // 批量大小
        tblProperties.add(new TblProperty("solr.primary.key", pkName)); // Solr Collection 主键字段名
        tblProperties.add(new TblProperty("collection.name", collectionName)); // Solr Collection Name

        if("kerberos".equals (datasource.gainSolrSecurityAuthentication ())){
            tblProperties.add(new TblProperty("solr.security.authentication", "kerberos"));
            tblProperties.add(new TblProperty("java.security.krb5.conf", datasource.gainSolrJavaSecurityKrb5Conf ()));
            tblProperties.add(new TblProperty("java.security.auth.login.config", datasource.gainSolrJavaSecurityAuthLoginConfig ()));
            tblProperties.add(new TblProperty("javax.security.auth.useSubjectCredsOnly", "false"));
            tblProperties.add(new TblProperty("sun.security.krb5.debug", "false"));
        }

        if (modelMappings == null || modelMappings.size() == 0) {
            throw new IllegalArgumentException("映射字段不能为空");
        }

        List<String> list = new ArrayList<>();
        for (ModelMapping modelMapping : modelMappings) {
            list.add(modelMapping.getName());
        }
        tblProperties.add(new TblProperty("columns", StringUtils.join(list, ",")));
        return tblProperties;
    }

    protected List<TblProperty> getTargetTblProperties(SolrDatasource datasource, String pkName, String collectionName,
                                                       List<ModelMapping> modelMappings) {
        if (StringUtils.isBlank(pkName)) {
            throw new IllegalArgumentException("主键字段不能为空");
        }

        List<TblProperty> tblProperties = new ArrayList<>();
        tblProperties.add(new TblProperty("is.solrcloud", "1")); // 0：单机模式，1：集群模式
        // 单机模式时solr.url为solrUrl，集群模式时solr.url为zkHost
        tblProperties.add(new TblProperty("solr.url", datasource.gainSolrZkHost())); // zookeeper地址、端口和目录
        tblProperties.add(new TblProperty("solr.query", "*:*")); // Solr查询语句
        tblProperties.add(new TblProperty("solr.cursor.batch.size", "1024")); // 批量大小
        tblProperties.add(new TblProperty("solr.primary.key", pkName)); // Solr Collection 主键字段名
        tblProperties.add(new TblProperty("collection.name", collectionName)); // Solr Collection Name

        if("kerberos".equals (datasource.gainSolrSecurityAuthentication ())){
            tblProperties.add(new TblProperty("solr.security.authentication", "kerberos"));
            tblProperties.add(new TblProperty("java.security.krb5.conf", datasource.gainSolrJavaSecurityKrb5Conf ()));
            tblProperties.add(new TblProperty("java.security.auth.login.config", datasource.gainSolrJavaSecurityAuthLoginConfig ()));
            tblProperties.add(new TblProperty("javax.security.auth.useSubjectCredsOnly", "false"));
            tblProperties.add(new TblProperty("sun.security.krb5.debug", "false"));
        }

        if (modelMappings == null || modelMappings.size() == 0) {
            throw new IllegalArgumentException("映射字段不能为空");
        }

        List<String> list = new ArrayList<>();
        for (ModelMapping modelMapping : modelMappings) {
            list.add(modelMapping.getMetadataCol().getName());
        }
        tblProperties.add(new TblProperty("columns", StringUtils.join(list, ",")));
        return tblProperties;
    }

    protected List<TableColumn> getTargetColumns(List<ModelMapping> modelMappings) {
        List<TableColumn> columns = new ArrayList<>();
        for (ModelMapping mapping : modelMappings) {
            MetadataCol metadataCol = mapping.getMetadataCol();
            String dataType = getDataType(metadataCol.getType(), metadataCol.getLength());
            columns.add(new TableColumn(metadataCol.getName(), dataType, metadataCol.getDescribe()));
        }
        return columns;
    }

    protected List<TableColumn> getSourceColumns(List<ModelMapping> modelMappings) {
        List<TableColumn> columns = new ArrayList<>();
        for (ModelMapping mapping : modelMappings) {
            String dataType = getDataType(mapping.getType(), mapping.getLength());
            columns.add(new TableColumn(mapping.getName(), dataType, mapping.getDescribe()));
        }
        return columns;
    }

    protected void update(SolrDatasource solrDatasource, String tableName, String idName, List<Map<String, String>> list, List<ValueColumn> valueColumns) {
        // 获得满足条件主键值集合
        List<String> ids = new ArrayList<>();
        for (Map<String, String> m : list) {
            ids.add(m.get(idName));
        }
        // 获得更新字段信息
        Map<String, String> map = new HashMap<>();
        for (ValueColumn column : valueColumns) {
            if (!idName.equals(column.getColName())) {
                map.put (column.getColName (), column.getValue ());
            }
        }
        // 更新满足条件数据信息
        SolrUtil.updateDocument(solrDatasource, tableName, idName, ids, map);
    }

    private String getIdName(List<ModelMapping> modelMappings) {
        String idName = "";
        for (ModelMapping mapping : modelMappings) {
            MetadataCol col = mapping.getMetadataCol();
            if (col.isPrimary()) {
                idName = col.getName();
                break;
            }
        }
        return idName;
    }

    /**
     * 增量插入
     * <p>
     * 注：没有相同主键时数据插入，有相同主键时数据不更新
     *
     * @param metadata
     * @param modelMappings
     * @param valueColumns
     * @throws Exception
     */
    @Override
    protected void insertInto(Metadata metadata, List<ModelMapping> modelMappings, List<ValueColumn> valueColumns) throws Exception {
        checkModelMappings(modelMappings);
        SolrDatasource solrDatasource = new SolrDatasource(metadata.getDatasource());
        Map<String, String> map = new HashMap<>();
        for (ValueColumn column : valueColumns) {
            map.put(column.getColName(), column.getValue());
        }
        SolrUtil.addDocument(solrDatasource, metadata.getTbName(), map);
    }

    /**
     * 更新、插入
     * <p>
     * 注：没有相同主键时数据插入，有相同主键时数据更新
     *
     * @param metadata
     * @param modelMappings
     * @param valueColumns
     * @param whereProperties
     * @throws Exception
     */
    @Override
    protected void updateInsert(Metadata metadata, List<ModelMapping> modelMappings, List<ValueColumn> valueColumns, List<WhereProperty> whereProperties) throws Exception {
        checkModelMappings(modelMappings);
        SolrDatasource solrDatasource = new SolrDatasource(metadata.getDatasource());
        String tableName = metadata.getTbName();
        String idName = getIdName(modelMappings);
        List<Map<String, String>> list = SolrUtil.search(solrDatasource, tableName, whereProperties);
        // 查询到条件数据，则进行更新，否则增量插入
        if (list != null && list.size() != 0) {
            update(solrDatasource, tableName, idName, list, valueColumns);
        } else {
            Map<String, String> map = new HashMap<>();
            for (ValueColumn column : valueColumns) {
                map.put(column.getColName(), column.getValue());
            }
            SolrUtil.addDocument(solrDatasource, metadata.getTbName(), map);
        }
    }

    /**
     * 匹配更新
     * <p>
     * 注：没有相同主键时数据不插入，有相同主键时数据更新
     *
     * @param metadata
     * @param modelMappings
     * @param valueColumns
     * @param whereProperties
     * @throws Exception
     */
    @Override
    protected void matchingUpdate(Metadata metadata, List<ModelMapping> modelMappings, List<ValueColumn> valueColumns, List<WhereProperty> whereProperties) throws Exception {
        checkModelMappings(modelMappings);
        SolrDatasource solrDatasource = new SolrDatasource(metadata.getDatasource());
        String tableName = metadata.getTbName();
        String idName = getIdName(modelMappings);
        List<Map<String, String>> list = SolrUtil.search(solrDatasource, tableName, whereProperties);
        if (list != null && list.size() != 0) {
            update(solrDatasource, tableName, idName, list, valueColumns);
        }
    }

    private void checkModelMappings(List<ModelMapping> modelMappings) {
        boolean flg = false;
        for (ModelMapping modelMapping : modelMappings) {
            if (modelMapping.getMetadataCol().isPrimary()) {
                flg = true;
                break;
            }
        }
        if (!flg) {
            throw new IllegalArgumentException("【映射字段】的目标字段必须要有一个是主键字段！");
        }
    }

    @Override
    protected List<String> getSelectColumns(List<ModelMapping> modelMappings, Metadata metadata) {
        if (modelMappings == null || modelMappings.size() == 0) {
            return null;
        }
        List<String> selectColumns = new ArrayList<>();
        for (ModelMapping mapping : modelMappings) {
            selectColumns.add (mapping.getName ());
        }
        return selectColumns;
    }

    @Override
    public void emptyDatas(Metadata metadata) throws Exception {
        SolrDatasource solrDatasource = new SolrDatasource(metadata.getDatasource());
        String collectionName = metadata.getTbName();
        SolrUtil.deleteAll(solrDatasource, collectionName);
    }
}
