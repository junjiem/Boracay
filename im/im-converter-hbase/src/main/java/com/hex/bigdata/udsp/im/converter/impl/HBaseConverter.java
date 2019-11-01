package com.hex.bigdata.udsp.im.converter.impl;

import com.hex.bigdata.udsp.common.api.model.Datasource;
import com.hex.bigdata.udsp.im.converter.impl.model.HBaseDatasource;
import com.hex.bigdata.udsp.im.converter.impl.model.HBaseMetadata;
import com.hex.bigdata.udsp.im.converter.impl.model.HiveDatasource;
import com.hex.bigdata.udsp.im.converter.impl.util.*;
import com.hex.bigdata.udsp.im.converter.impl.wrapper.HBaseWrapper;
import com.hex.bigdata.udsp.im.converter.model.Metadata;
import com.hex.bigdata.udsp.im.converter.model.MetadataCol;
import com.hex.bigdata.udsp.im.converter.model.Model;
import com.hex.bigdata.udsp.im.converter.model.ModelMapping;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

/**
 * Created by JunjieM on 2017-9-5.
 */
//@Component("com.hex.bigdata.udsp.im.converter.impl.HBaseConverter")
public class HBaseConverter extends HBaseWrapper {
    private static Logger logger = LogManager.getLogger (HBaseConverter.class);

    @Override
    public List<MetadataCol> columnInfo(Metadata metadata) {
        // HBase无法获取字段信息，返回null
        return null;
    }

    @Override
    public void createSchema(Metadata metadata) throws Exception {
        HBaseMetadata hBaseMetadata = new HBaseMetadata (metadata);
        HBaseUtil.createHTable (hBaseMetadata, true);
    }

    @Override
    public void dropSchema(Metadata metadata) throws Exception {
        HBaseDatasource hBaseDatasource = new HBaseDatasource (metadata.getDatasource ());
        HBaseUtil.dropHTable (hBaseDatasource, metadata.getTbName (), true);
    }

    @Override
    public void createTargetEngineSchema(Model model) throws Exception {
        Metadata metadata = model.getTargetMetadata ();
        HiveDatasource eHiveDs = new HiveDatasource (model.getEngineDatasource ());
        String id = model.getId ();
        HBaseMetadata hbaseMetadata = new HBaseMetadata (metadata);
        String fullTbName = hbaseMetadata.getTbName ();
        String tableName = getTargetTableName (id);
        List<ModelMapping> modelMappings = model.getModelMappings ();
        String sql = HiveSqlUtil.createStorageHandlerTable (true, true, tableName,
                getTargetColumns (modelMappings, hbaseMetadata), "目标的Hive引擎表", null,
                HIVE_ENGINE_STORAGE_HANDLER_CLASS, getSerDeProperties (modelMappings, hbaseMetadata),
                getTblProperties (fullTbName));
        JdbcUtil.createEngineSchema (eHiveDs, HIVE_ENGINE_DATABASE_NAME, sql);
    }

    @Override
    public boolean checkSchema(Metadata metadata) throws Exception {
        HBaseDatasource datasource = new HBaseDatasource (metadata.getDatasource ());
        String tableName = metadata.getTbName ();
        return HBaseUtil.isTableAvailable (datasource, tableName);
    }

    @Override
    public void addColumns(Metadata metadata, List<MetadataCol> addMetadataCols) throws Exception {
        // HBase无需更新表结构
    }

    @Override
    public boolean testDatasource(Datasource datasource) {
        HBaseDatasource hBaseDatasource = new HBaseDatasource (datasource);
        return !HBaseUtil.isAborted (hBaseDatasource);
    }
}
