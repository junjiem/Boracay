package com.hex.bigdata.udsp.im.provider.impl.wrapper;

import com.hex.bigdata.udsp.im.provider.BatchSourceProvider;
import com.hex.bigdata.udsp.im.provider.BatchTargetProvider;
import com.hex.bigdata.udsp.im.provider.RealtimeTargetProvider;
import com.hex.bigdata.udsp.im.provider.impl.model.datasource.HiveDatasource;
import com.hex.bigdata.udsp.im.provider.impl.model.datasource.SolrDatasource;
import com.hex.bigdata.udsp.im.provider.impl.model.modeling.SolrModel;
import com.hex.bigdata.udsp.im.provider.impl.util.HiveSqlUtil;
import com.hex.bigdata.udsp.im.provider.impl.util.JdbcUtil;
import com.hex.bigdata.udsp.im.provider.impl.util.SolrUtil;
import com.hex.bigdata.udsp.im.provider.impl.util.model.TableColumn;
import com.hex.bigdata.udsp.im.provider.impl.util.model.TblProperty;
import com.hex.bigdata.udsp.im.provider.impl.util.model.ValueColumn;
import com.hex.bigdata.udsp.im.provider.impl.util.model.WhereProperty;
import com.hex.bigdata.udsp.im.provider.model.Metadata;
import com.hex.bigdata.udsp.im.provider.model.MetadataCol;
import com.hex.bigdata.udsp.im.provider.model.Model;
import com.hex.bigdata.udsp.im.provider.model.ModelMapping;
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
public abstract class SolrWrapper extends Wrapper implements BatchSourceProvider, BatchTargetProvider, RealtimeTargetProvider {
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
        List<TblProperty> tblProperties = new ArrayList<>();
        tblProperties.add(new TblProperty("solr.url", datasource.getSolrUrl())); // zookeeper地址、端口和目录
        if (StringUtils.isBlank(solrQuery)) solrQuery = "*:*";
        tblProperties.add(new TblProperty("solr.query", solrQuery)); // Solr查询语句
        tblProperties.add(new TblProperty("solr.cursor.batch.size", "1000")); // 批量大小
        if (StringUtils.isBlank(pkName)) {
            throw new IllegalArgumentException("主键字段不能为空");
        }
        tblProperties.add(new TblProperty("solr.primary.key", pkName)); // Solr Collection 主键字段名
        tblProperties.add(new TblProperty("is.solrcloud", "1")); // 0：单机模式，1：集群模式，Default：0
        tblProperties.add(new TblProperty("collection.name", collectionName)); // Solr Collection Name
        // Hive字段和Solr字段对应
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
        List<TblProperty> tblProperties = new ArrayList<>();
        tblProperties.add(new TblProperty("solr.url", datasource.getSolrUrl())); // zookeeper地址、端口和目录
        tblProperties.add(new TblProperty("solr.query", "*:*")); // Solr查询语句
        tblProperties.add(new TblProperty("solr.cursor.batch.size", "1000")); // 批量大小
        if (StringUtils.isBlank(pkName)) {
            throw new IllegalArgumentException("主键字段不能为空");
        }
        tblProperties.add(new TblProperty("solr.primary.key", pkName)); // Solr Collection 主键字段名
        tblProperties.add(new TblProperty("is.solrcloud", "1")); // 0：单机模式，1：集群模式，Default：0
        tblProperties.add(new TblProperty("collection.name", collectionName)); // Solr Collection Name
        // Hive字段和Solr字段对应
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
            if (!idName.equals(column.getColName()))
                map.put(column.getColName(), column.getValue());
        }
        // 更新满足条件数据信息
        SolrUtil.updateDocument(solrDatasource, tableName, idName, ids, map);
    }

    protected String getIdName(List<ModelMapping> modelMappings) {
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
        if (modelMappings == null || modelMappings.size() == 0)
            return null;
        List<String> selectColumns = new ArrayList<>();
        for (ModelMapping mapping : modelMappings)
            selectColumns.add(mapping.getName());
        return selectColumns;
    }

    @Override
    protected void emptyDatas(Metadata metadata) throws Exception {
        SolrDatasource solrDatasource = new SolrDatasource(metadata.getDatasource());
        String collectionName = metadata.getTbName();
        SolrUtil.deleteAll(solrDatasource, collectionName);
    }

    @Override
    public void createSourceEngineSchema(Model model) throws Exception {
        HiveDatasource eHiveDs = new HiveDatasource(model.getEngineDatasource());
        String id = model.getId();
        SolrModel solrModel = new SolrModel(model);
        String collectionName = solrModel.getCollectionName();
        String engineSchemaName = getSourceTableName(id);
        SolrDatasource solrDs = new SolrDatasource(model.getSourceDatasource());
        List<ModelMapping> modelMappings = model.getModelMappings();
        String pkName = getSourcePrimaryKey(modelMappings);
        List<TblProperty> tblProperties = getSourceTblProperties(solrDs, pkName, collectionName, modelMappings, "*:*");
        String sql = HiveSqlUtil.createStorageHandlerTable(true, true, engineSchemaName,
                getSourceColumns(modelMappings), "源的Hive引擎表", null,
                HIVE_ENGINE_STORAGE_HANDLER_CLASS, null, tblProperties);
        JdbcUtil.createEngineSchema(eHiveDs, HIVE_ENGINE_DATABASE_NAME, sql);
    }

}
