package com.hex.bigdata.udsp.im.provider.impl;

import com.hex.bigdata.udsp.common.provider.model.Datasource;
import com.hex.bigdata.udsp.im.provider.impl.model.datasource.KuduDatasource;
import com.hex.bigdata.udsp.im.provider.impl.model.metadata.KuduMetadata;
import com.hex.bigdata.udsp.im.provider.impl.util.KuduUtil;
import com.hex.bigdata.udsp.im.provider.impl.wrapper.KuduWrapper;
import com.hex.bigdata.udsp.im.provider.model.Metadata;
import com.hex.bigdata.udsp.im.provider.model.MetadataCol;
import com.hex.bigdata.udsp.im.provider.model.Model;
import org.apache.kudu.ColumnSchema;
import org.apache.kudu.client.KuduClient;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by PC on 2018/2/26.
 */
@Component("com.hex.bigdata.udsp.im.provider.impl.KuduProvider")
public class KuduProvider extends KuduWrapper {

    @Override
    public boolean testDatasource(Datasource datasource) {
        KuduDatasource kuduDatasource = new KuduDatasource(datasource);
        KuduClient client = null;
        try {
            client = KuduUtil.getClient(kuduDatasource);
            if (client != null) return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            KuduUtil.release(kuduDatasource, client);
        }
        return false;
    }

    @Override
    public List<MetadataCol> columnInfo(Metadata metadata) {
        KuduDatasource datasource = new KuduDatasource(metadata.getDatasource());
        String tableName = metadata.getTbName();
        List<ColumnSchema> columns = KuduUtil.getColumns(datasource, tableName);
        if (columns == null) return null;
        List<MetadataCol> mdCols = new ArrayList<>();
        MetadataCol mdCol = null;
        ColumnSchema column = null;
        for (int i = 0; i < columns.size(); i++) {
            column = columns.get(i);
            mdCol = new MetadataCol();
            mdCol.setSeq((short) (i + 1));
            mdCol.setName(column.getName());
            mdCol.setDescribe(mdCol.getName());
            mdCol.setType(KuduUtil.getColType(column.getType()));
            mdCol.setPrimary(column.isKey());
            mdCol.setIndexed(false);
            mdCol.setStored(true);
            mdCols.add(mdCol);
        }
        return mdCols;
    }

    @Override
    public void createSchema(Metadata metadata) throws Exception {
        KuduMetadata kuduMetadata = new KuduMetadata(metadata);
        KuduUtil.createTable(kuduMetadata, true);
    }

    @Override
    public void dropSchema(Metadata metadata) throws Exception {
        KuduDatasource datasource = new KuduDatasource(metadata.getDatasource());
        String tableName = metadata.getTbName();
        KuduUtil.dropTable(datasource, tableName, true);
    }

    @Override
    public boolean checkSchema(Metadata metadata) throws Exception {
        KuduDatasource datasource = new KuduDatasource(metadata.getDatasource());
        String tableName = metadata.getTbName();
        return KuduUtil.tableExists(datasource, tableName);
    }

    @Override
    public void createTargetEngineSchema(Model model) throws Exception {

    }

    @Override
    public void createSourceEngineSchema(Model model) throws Exception {

    }

    @Override
    public void createSourceEngineSchema(Model model, String engineSchemaName) throws Exception {

    }

    @Override
    public List<MetadataCol> columnInfo(Model model) {
        return null;
    }
}
