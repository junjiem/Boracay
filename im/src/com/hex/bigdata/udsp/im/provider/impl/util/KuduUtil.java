package com.hex.bigdata.udsp.im.provider.impl.util;

import com.hex.bigdata.udsp.common.constant.DataType;
import com.hex.bigdata.udsp.im.provider.impl.factory.KuduClientPoolFactory;
import com.hex.bigdata.udsp.im.provider.impl.model.datasource.KuduDatasource;
import com.hex.bigdata.udsp.im.provider.impl.model.metadata.KuduMetadata;
import com.hex.bigdata.udsp.im.provider.impl.util.model.ValueColumn;
import com.hex.bigdata.udsp.im.provider.model.MetadataCol;
import org.apache.commons.pool.impl.GenericObjectPool;
import org.apache.kudu.ColumnSchema;
import org.apache.kudu.Schema;
import org.apache.kudu.Type;
import org.apache.kudu.client.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by PC on 2018/2/26.
 */
public class KuduUtil {
    private static Logger logger = LogManager.getLogger(KuduUtil.class);
    private static Map<String, KuduClientPoolFactory> dataSourcePool;

    public static synchronized KuduClientPoolFactory getDataSource(KuduDatasource datasource) {
        String dsId = datasource.getId();
        if (dataSourcePool == null) {
            dataSourcePool = new HashMap<>();
        }
        KuduClientPoolFactory factory = dataSourcePool.get(dsId);
        if (factory == null) {
            GenericObjectPool.Config config = new GenericObjectPool.Config();
            config.lifo = true;
            config.minIdle = 1;
            config.maxIdle = 10;
            config.maxWait = 3000;
            config.maxActive = 5;
            config.timeBetweenEvictionRunsMillis = 30000;
            config.testWhileIdle = true;
            config.testOnBorrow = false;
            config.testOnReturn = false;
            factory = new KuduClientPoolFactory(config, datasource);
        }
        dataSourcePool.put(dsId, factory);
        return factory;
    }

    public static KuduClient getClient(KuduDatasource datasource) {
        try {
            return getDataSource(datasource).getClient();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void release(KuduDatasource datasource, KuduClient client) {
        getDataSource(datasource).releaseClient(client);
    }

    /**
     * 获取字段信息
     *
     * @param datasource
     * @param tableName
     * @return
     */
    public static List<ColumnSchema> getColumns(KuduDatasource datasource, String tableName) {
        KuduClient client = getClient(datasource);
        try {
            KuduTable table = client.openTable(tableName);
            return table.getSchema().getColumns();
        } catch (KuduException e) {
            e.printStackTrace();
        } finally {
            release(datasource, client);
        }
        return null;
    }

    /**
     * 创建表
     *
     * @param metadata
     * @param ifNotExists
     * @throws Exception
     */
    public static void createTable(KuduMetadata metadata, boolean ifNotExists) throws Exception {
        KuduDatasource datasource = new KuduDatasource(metadata.getDatasource());
        String tableName = metadata.getTbName();
        List<MetadataCol> metadataCols = metadata.getMetadataCols();
        // 判断是否已经存在该表
        if (tableExists(datasource, tableName)) {
            logger.debug("Kudu表" + tableName + "存在，无需创建！");
            if (!ifNotExists) {
                throw new Exception("Kudu表" + tableName + "已经存在！");
            }
        } else {
            logger.debug("Kudu表" + tableName + "不存在，进行创建！");
            // Schema信息
            int count = 0;
            List<ColumnSchema> columns = new ArrayList<>();
            ColumnSchema.ColumnSchemaBuilder schemaBuilder = null;
            for (MetadataCol metadataCol : metadataCols) {
                schemaBuilder = new ColumnSchema.ColumnSchemaBuilder(metadataCol.getName(),
                        getKuduType(metadataCol.getType()));
                if (metadataCol.isPrimary()) { // 主键
                    columns.add(schemaBuilder.key(true).build());
                    count++;
                } else { // 非主键
                    columns.add(schemaBuilder.build());
                }
            }
            if (count == 0)
                throw new IllegalArgumentException("必须指定至少一个主键字段");
            Schema schema = new Schema(columns);
            // Options信息
            CreateTableOptions options = null;
            if (!metadata.getPrePartitioning()) { // 非预分区
                List<String> rangeKeys = new ArrayList<>();
                for (MetadataCol metadataCol : metadataCols) {
                    if (metadataCol.isPrimary()) { // 主键
                        rangeKeys.add(metadataCol.getName());
                    }
                }
                options = new CreateTableOptions()
                        .setRangePartitionColumns(rangeKeys);
            } else { // 预分区
                List<String> hashKeys = new ArrayList<>();
                for (MetadataCol metadataCol : metadataCols) {
                    if (metadataCol.isPrimary()) { // 主键
                        hashKeys.add(metadataCol.getName());
                    }
                }
                int buckets = metadata.getHashPartitionsBuckets();
                options = new CreateTableOptions()
                        .addHashPartitions(hashKeys, buckets);
            }
            // 建表
            KuduClient client = getClient(datasource);
            try {
                client.createTable(tableName, schema, options);
            } finally {
                release(datasource, client);
            }
        }
    }

    /**
     * 删除表
     *
     * @param datasource
     * @param tableName
     * @param ifExists
     */

    public static void dropTable(KuduDatasource datasource, String tableName, boolean ifExists) throws Exception {
        // 判断是否已经存在该表
        if (tableExists(datasource, tableName)) {
            logger.debug("Kudu表" + tableName + "存在，进行删除！");
            KuduClient client = getClient(datasource);
            try {
                client.deleteTable(tableName);
            } catch (KuduException e) {
                e.printStackTrace();
            } finally {
                release(datasource, client);
            }
        } else {
            logger.debug("Kudu表" + tableName + "不存在，无需删除！");
            if (!ifExists) {
                throw new Exception("Kudu表" + tableName + "不存在！");
            }
        }
    }

    /**
     * 检查表是否存在
     *
     * @param datasource
     * @param tableName
     * @return
     */
    public static boolean tableExists(KuduDatasource datasource, String tableName) {
        KuduClient client = getClient(datasource);
        try {
            return client.tableExists(tableName);
        } catch (KuduException e) {
            e.printStackTrace();
        } finally {
            release(datasource, client);
        }
        return false;
    }

    /**
     * 清空表数据
     *
     * @param metadata
     * @throws Exception
     */
    public static void emptyHTable(KuduMetadata metadata) throws Exception {
        KuduDatasource datasource = new KuduDatasource(metadata.getDatasource());
        dropTable(datasource, metadata.getTbName(), false);
        createTable(metadata, false);
    }

    /**
     * 插入单条数据
     *
     * @param datasource
     * @param tableName
     * @param valueColumns
     * @throws KuduException
     */
    public static void insert(KuduDatasource datasource, String tableName, List<ValueColumn> valueColumns) throws KuduException {
        KuduClient client = getClient(datasource);
        KuduSession session = client.newSession();
        try {
            KuduTable table = client.openTable(tableName);
            Insert insert = table.newInsert();
            PartialRow row = insert.getRow();
            operate(row, valueColumns);
            session.apply(insert);
        } finally {
            if (session != null && !session.isClosed()) {
                session.close();
            }
            release(datasource, client);
        }
    }

    /**
     * 更新单条数据
     *
     * @param datasource
     * @param tableName
     * @param valueColumns
     * @throws KuduException
     */
    public static void update(KuduDatasource datasource, String tableName, List<ValueColumn> valueColumns) throws KuduException {
        KuduClient client = getClient(datasource);
        KuduSession session = client.newSession();
        try {
            KuduTable table = client.openTable(tableName);
            Update update = table.newUpdate();
            PartialRow row = update.getRow();
            operate(row, valueColumns);
            session.apply(update);
        } finally {
            if (session != null && !session.isClosed()) {
                session.close();
            }
            release(datasource, client);
        }
    }

    /**
     * 更新插入单条数据
     *
     * @param datasource
     * @param tableName
     * @param valueColumns
     * @throws KuduException
     */
    public static void upsert(KuduDatasource datasource, String tableName, List<ValueColumn> valueColumns) throws KuduException {
        KuduClient client = getClient(datasource);
        KuduSession session = client.newSession();
        try {
            KuduTable table = client.openTable(tableName);
            Upsert upsert = table.newUpsert();
            PartialRow row = upsert.getRow();
            operate(row, valueColumns);
            session.apply(upsert);
        } finally {
            if (session != null && !session.isClosed()) {
                session.close();
            }
            release(datasource, client);
        }
    }

    private static void operate(PartialRow row, List<ValueColumn> valueColumns) {
        for (ValueColumn column : valueColumns) {
            String name = column.getColName();
            String value = column.getValue();
            switch (getKuduType(column.getDataType())) {
                case STRING:
                    row.addString(name, value);
                    break;
                case INT8:
                    row.addByte(name, Byte.valueOf(value));
                    break;
                case INT16:
                    row.addShort(name, Short.valueOf(value));
                    break;
                case INT32:
                    row.addInt(name, Integer.valueOf(value));
                    break;
                case INT64:
                    row.addLong(name, Long.valueOf(value));
                    break;
                case DOUBLE:
                    row.addDouble(name, Double.valueOf(value));
                    break;
                case FLOAT:
                    row.addFloat(name, Float.valueOf(value));
                    break;
                case BINARY:
                    row.addBinary(name, value.getBytes());
                    break;
                case BOOL:
                    row.addBoolean(name, Boolean.valueOf(value));
                    break;
                case UNIXTIME_MICROS:
                    row.addLong(name, Long.valueOf(value));
                    break;
            }
        }
    }

    /**
     * Kudu类型转数据库类型
     *
     * @param type
     * @return
     */
    public static DataType getColType(Type type) {
        switch (type) {
            case INT8:
                return DataType.TINYINT;
            case INT16:
                return DataType.SMALLINT;
            case INT32:
                return DataType.INT;
            case INT64:
                return DataType.BIGINT;
            case STRING:
                return DataType.STRING;
            case BOOL:
                return DataType.BOOLEAN;
            case FLOAT:
                return DataType.FLOAT;
            case DOUBLE:
                return DataType.DOUBLE;
            case UNIXTIME_MICROS:
                return DataType.TIMESTAMP;
            case BINARY:
            default:
                return null;
        }
    }

    /**
     * 数据库类型转Kudu类型
     *
     * @param type
     * @return
     */
    public static Type getKuduType(DataType type) {
        switch (type) {
            case STRING:
            case VARCHAR:
            case CHAR:
                return Type.STRING;
            case DOUBLE:
            case DECIMAL:
                return Type.DOUBLE;
            case TINYINT:
                return Type.INT8;
            case SMALLINT:
                return Type.INT16;
            case INT:
                return Type.INT32;
            case BIGINT:
                return Type.INT64;
            case FLOAT:
                return Type.FLOAT;
            case BOOLEAN:
                return Type.BOOL;
            case TIMESTAMP:
                return Type.UNIXTIME_MICROS;
            default:
                return null;
        }
    }
}
