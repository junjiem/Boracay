package com.hex.bigdata.udsp.im.converter.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hex.bigdata.udsp.common.api.model.Datasource;
import com.hex.bigdata.udsp.im.converter.impl.model.HiveDatasource;
import com.hex.bigdata.udsp.im.converter.impl.model.SolrDatasource;
import com.hex.bigdata.udsp.im.converter.impl.model.SolrMetadata;
import com.hex.bigdata.udsp.im.converter.impl.model.SolrModel;
import com.hex.bigdata.udsp.im.converter.impl.util.HiveSqlUtil;
import com.hex.bigdata.udsp.im.converter.impl.util.JdbcUtil;
import com.hex.bigdata.udsp.im.converter.impl.util.SolrUtil;
import com.hex.bigdata.udsp.im.converter.impl.wrapper.SolrWrapper;
import com.hex.bigdata.udsp.im.converter.model.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by JunjieM on 2017-9-5.
 */
//@Component("com.hex.bigdata.udsp.im.converter.impl.SolrConverter")
public class SolrConverter extends SolrWrapper {
    private static Logger logger = LogManager.getLogger (SolrConverter.class);

    public List<MetadataCol> getColumns(String collectionName, String solrServers) {
        if (StringUtils.isEmpty (collectionName) || StringUtils.isEmpty (solrServers)) {
            return null;
        }
        String response = "";
        String[] addresses = solrServers.split (",");
        for (String solrServer : addresses) {
            String url = "http://" + solrServer + "/solr/" + collectionName + "/schema/fields";
            response = SolrUtil.sendGet (url, "");
            if (StringUtils.isEmpty (response)) {
                continue;
            } else {
                break;
            }
        }
        JSONObject rs = JSONObject.parseObject (response);
        JSONArray fields = (JSONArray) rs.get ("fields");
        List<MetadataCol> metadataCols = new ArrayList<> ();
        MetadataCol mdCol = null;
        for (int i = 0; i < fields.size (); i++) {
            mdCol = new MetadataCol ();
            mdCol.setSeq ((short) i);
            mdCol.setName ((String) fields.getJSONObject (i).get ("name"));
            mdCol.setDescribe ((String) fields.getJSONObject (i).get ("name"));
            mdCol.setType (SolrUtil.getColType ((String) fields.getJSONObject (i).get ("type")));
            mdCol.setIndexed ((boolean) fields.getJSONObject (i).get ("indexed"));
            mdCol.setStored ((boolean) fields.getJSONObject (i).get ("stored"));
            mdCol.setPrimary (fields.getJSONObject (i).get ("uniqueKey") == null ? false : true);
            metadataCols.add (mdCol);
        }
        return metadataCols;
    }

    @Override
    public List<MetadataCol> columnInfo(Metadata metadata) {
        String collectionName = metadata.getTbName ();
        SolrDatasource solrDatasource = new SolrDatasource (metadata.getDatasource ());
        String solrServers = solrDatasource.gainSolrServers ();
        return getColumns (collectionName, solrServers);
    }

    @Override
    public void createSchema(Metadata metadata) throws Exception {
        SolrMetadata solrMetadata = new SolrMetadata (metadata);
        SolrUtil.createCollection (solrMetadata, true);
    }

    @Override
    public void dropSchema(Metadata metadata) throws Exception {
        SolrMetadata solrMetadata = new SolrMetadata (metadata);
        SolrUtil.dropCollection (solrMetadata, true);
    }

    @Override
    public boolean checkSchema(Metadata metadata) throws Exception {
        String collectionName = metadata.getTbName ();
        SolrDatasource solrDatasource = new SolrDatasource (metadata.getDatasource ());
        String solrServers = solrDatasource.gainSolrServers ();
        return SolrUtil.checkCollection (solrServers, collectionName);
    }

    @Override
    public void addColumns(Metadata metadata, List<MetadataCol> addMetadataCols) throws Exception {
        if (addMetadataCols != null && addMetadataCols.size () != 0) {
            SolrMetadata solrMetadata = new SolrMetadata (metadata);
            SolrUtil.updateCollection (solrMetadata, addMetadataCols);
        }
    }

    @Override
    public List<MetadataCol> columnInfo(Model model) {
        SolrDatasource solrDatasource = new SolrDatasource (model.getSourceDatasource ());
        String solrServers = solrDatasource.gainSolrServers ();
        SolrModel solrModel = new SolrModel (model);
        String collectionName = solrModel.gainCollectionName ();
        return getColumns (collectionName, solrServers);
    }

    /**
     * 创建源引擎Schema
     *
     * @param model
     * @throws Exception
     */
    @Override
    public void createSourceEngineSchema(Model model) throws Exception {
        HiveDatasource eHiveDs = new HiveDatasource (model.getEngineDatasource ());
        String id = model.getId ();
        SolrModel solrModel = new SolrModel (model);
        String collectionName = solrModel.gainCollectionName ();
        String engineSchemaName = getSourceTableName (id);
        SolrDatasource solrDs = new SolrDatasource (model.getSourceDatasource ());
        List<ModelMapping> modelMappings = model.getModelMappings ();
        String pkName = getSourcePrimaryKey (modelMappings);
        List<TableColumn> tableColumns = getSourceColumns (modelMappings);
        List<TblProperty> tblProperties = getSourceTblProperties (solrDs, pkName, collectionName, modelMappings, "*:*");
        String sql = HiveSqlUtil.createStorageHandlerTable (true, true, engineSchemaName,
                tableColumns, "源的Hive引擎表", null,
                HIVE_ENGINE_STORAGE_HANDLER_CLASS, null, tblProperties);
        JdbcUtil.createEngineSchema (eHiveDs, HIVE_ENGINE_DATABASE_NAME, sql);
    }

    /**
     * 创建源引擎Schema（只针对非暴力查询模式时使用）
     *
     * @param model
     * @param engineSchemaName
     * @throws Exception
     */
    @Override
    public void createSourceEngineSchema(Model model, String engineSchemaName) throws Exception {
        HiveDatasource eHiveDs = new HiveDatasource (model.getEngineDatasource ());
        SolrModel solrModel = new SolrModel (model);
        String collectionName = solrModel.gainCollectionName ();
        SolrDatasource solrDs = new SolrDatasource (model.getSourceDatasource ());
        List<ModelMapping> modelMappings = model.getModelMappings ();
        String pkName = getSourcePrimaryKey (modelMappings);
        List<WhereProperty> whereProperties = getWhereProperties (model.getModelFilterCols ());
        String solrQuery = SolrUtil.getQuery (whereProperties);
        List<TableColumn> tableColumns = getSourceColumns (modelMappings);
        List<TblProperty> tblProperties = getSourceTblProperties (solrDs, pkName, collectionName, modelMappings, solrQuery);
        String sql = HiveSqlUtil.createStorageHandlerTable (true, true, engineSchemaName,
                tableColumns, "源的Hive引擎表", null,
                HIVE_ENGINE_STORAGE_HANDLER_CLASS, null, tblProperties);
        JdbcUtil.createEngineSchema (eHiveDs, HIVE_ENGINE_DATABASE_NAME, sql);
    }

    @Override
    public void createTargetEngineSchema(Model model) throws Exception {
        Metadata metadata = model.getTargetMetadata ();
        HiveDatasource eHiveDs = new HiveDatasource (model.getEngineDatasource ());
        SolrMetadata solrMetadata = new SolrMetadata (metadata);
        SolrDatasource solrDs = new SolrDatasource (metadata.getDatasource ());
        List<ModelMapping> modelMappings = model.getModelMappings ();
        String pkName = getTargetPrimaryKey (modelMappings);
        String tableName = getTargetTableName (model.getId ());
        String collectionName = solrMetadata.getTbName ();
        List<TableColumn> tableColumns = getTargetColumns (modelMappings);
        List<TblProperty> tblProperties = getTargetTblProperties (solrDs, pkName, collectionName, modelMappings);
        String sql = HiveSqlUtil.createStorageHandlerTable (true, true, tableName,
                tableColumns, "目标的Hive引擎表", null,
                HIVE_ENGINE_STORAGE_HANDLER_CLASS, null, tblProperties);
        JdbcUtil.createEngineSchema (eHiveDs, HIVE_ENGINE_DATABASE_NAME, sql);
    }

    @Override
    public boolean testDatasource(Datasource datasource) {
        return SolrUtil.test (new SolrDatasource (datasource));
    }
}
