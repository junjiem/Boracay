package com.hex.bigdata.udsp.im.provider.impl.wrapper;

import com.hex.bigdata.udsp.im.provider.BatchSourceProvider;
import com.hex.bigdata.udsp.im.provider.BatchTargetProvider;
import com.hex.bigdata.udsp.im.provider.RealtimeTargetProvider;
import com.hex.bigdata.udsp.im.provider.impl.model.datasource.KuduDatasource;
import com.hex.bigdata.udsp.im.provider.impl.model.metadata.KuduMetadata;
import com.hex.bigdata.udsp.im.provider.impl.util.KuduUtil;
import com.hex.bigdata.udsp.im.provider.impl.util.model.ValueColumn;
import com.hex.bigdata.udsp.im.provider.impl.util.model.WhereProperty;
import com.hex.bigdata.udsp.im.provider.model.Metadata;
import com.hex.bigdata.udsp.im.provider.model.ModelMapping;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by PC on 2018/2/26.
 */
public abstract class KuduWrapper extends Wrapper implements BatchSourceProvider, BatchTargetProvider, RealtimeTargetProvider {
    private static Logger logger = LogManager.getLogger(KuduWrapper.class);

    protected static final String HIVE_ENGINE_STORAGE_HANDLER_CLASS = "org.apache.hadoop.hive.kudu.KuduStorageHandler";

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
        KuduDatasource datasource = new KuduDatasource(metadata.getDatasource());
        String tableName = metadata.getTbName();
        KuduUtil.insert(datasource, tableName, valueColumns);
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
        KuduDatasource datasource = new KuduDatasource(metadata.getDatasource());
        String tableName = metadata.getTbName();
        KuduUtil.upsert(datasource, tableName, valueColumns);
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
        KuduDatasource datasource = new KuduDatasource(metadata.getDatasource());
        String tableName = metadata.getTbName();
        KuduUtil.update(datasource, tableName, valueColumns);
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
        KuduMetadata kuduMetadata = new KuduMetadata(metadata);
        KuduUtil.emptyHTable(kuduMetadata);
    }
}
