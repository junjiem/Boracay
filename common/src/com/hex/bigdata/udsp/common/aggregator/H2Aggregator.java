package com.hex.bigdata.udsp.common.aggregator;

import com.hex.bigdata.udsp.common.aggregator.constant.H2DataType;
import com.hex.bigdata.udsp.common.aggregator.model.H2DataColumn;
import com.hex.bigdata.udsp.common.aggregator.model.H2Response;
import com.hex.bigdata.udsp.common.aggregator.util.H2SqlUtil;
import com.hex.bigdata.udsp.dsl.DslSqlAdaptor;
import com.hex.bigdata.udsp.dsl.model.Component;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.sql.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * H2聚合器
 */
@Repository
public class H2Aggregator {
    private static Logger logger = LogManager.getLogger (H2Aggregator.class);

    private static final String TBL_PREFIX = "CACHE_";
    private static final int BATCH_SIZE = 20000;

    @Autowired
    @Qualifier("h2DataSource")
    private BasicDataSource h2DataSource;

    @Value("${aggregator.h2.data.timeout:43200}")
    private int aggregatorH2DataTimeout;

    // Map<String tableName, Long timestamp>
    private static Map<String, Long> h2AggMetaCacher = new ConcurrentHashMap<> ();

    /**
     * 获取表名称
     *
     * @param serviceName
     * @param component
     * @return
     */
    public String getH2TableName(String serviceName, Component component) {
        return getH2TableNamePrefix (serviceName) + getH2TableNameSuffix (component);
    }

    private String getH2TableNamePrefix(String serviceName) {
        return TBL_PREFIX + DigestUtils.md5Hex (serviceName).substring (8, 24) + "_";
    }

    private String getH2TableNameSuffix(Component component) {
        return DigestUtils.md5Hex (DslSqlAdaptor.componentToStatement (component)).substring (8, 24);
    }

    /**
     * 加载数据操作
     *
     * @param tableName
     * @param columns
     * @param records
     */
    public void load(String tableName, List<H2DataColumn> columns, List<Map<String, String>> records) {
        long bef = System.currentTimeMillis ();
        if (records != null && records.size () != 0) {
            // before Load
            beforeLoad (tableName, columns);
            // Load data
            try (Connection conn = h2DataSource.getConnection ();
                 PreparedStatement ps = conn.prepareStatement (H2SqlUtil.insertInto (tableName, columns.size ()));
            ) {
                H2DataColumn column = null;
                String colName = "";
                H2DataType dataType = null;
                String value = "";
                int count = 0;
                for (Map<String, String> record : records) {
                    for (int i = 1; i <= columns.size (); i++) {
                        column = columns.get (i - 1);
                        colName = column.getColName ();
                        dataType = column.getDataType ();
                        value = record.get (colName);
                        try {
                            switch (dataType) {
                                case VARCHAR:
                                case CHAR:
                                    ps.setString (i, value);
                                    break;
                                case DECIMAL:
                                    ps.setBigDecimal (i, new BigDecimal (value));
                                    break;
                                case DOUBLE:
                                    ps.setDouble (i, Double.parseDouble (value));
                                    break;
                                case INT:
                                    ps.setInt (i, Integer.parseInt (value));
                                    break;
                                case TINYINT:
                                    ps.setByte (i, Byte.parseByte (value));
                                    break;
                                case SMALLINT:
                                    ps.setShort (i, Short.parseShort (value));
                                    break;
                                case FLOAT:
                                    ps.setFloat (i, Float.parseFloat (value));
                                    break;
                                case BIGINT:
                                    ps.setLong (i, Long.parseLong (value));
                                    break;
                                case TIMESTAMP:
                                    ps.setTimestamp (i, Timestamp.valueOf (value));
                                    break;
                                case BOOLEAN:
                                    ps.setBoolean (i, Boolean.parseBoolean (value));
                                    break;
                                default:
                                    ps.setString (i, value);
                            }
                        } catch (Exception e) {
                            logger.warn (e.getMessage ());
                            ps.setObject (i, null);
                        }
                    }
                    ps.addBatch ();
                    if (++count % BATCH_SIZE == 0) {
                        ps.executeBatch ();
                        logger.info ("H2 load batch {}", count);
                    }
                }
                ps.executeBatch ();
            } catch (SQLException e) {
                e.printStackTrace ();
                throw new RuntimeException (e.getMessage ());
            }
            // after Load
            afterLoad (tableName);
            logger.info ("H2 Database loadBatch using time: {} ms", System.currentTimeMillis () - bef);
        }
    }

    // 加载数据前操作
    private void beforeLoad(String tableName, List<H2DataColumn> columns) {
        try (Connection conn = h2DataSource.getConnection ();
             Statement stmt = conn.createStatement ();) {
            String dropTableSql = H2SqlUtil.dropTable (tableName);
            logger.info ("Execute: {}", dropTableSql);
            stmt.execute (dropTableSql);
            String createTableSql = H2SqlUtil.createTable (tableName, columns);
            logger.info ("Execute: {}", createTableSql);
            stmt.execute (createTableSql);
        } catch (SQLException e) {
            e.printStackTrace ();
            throw new RuntimeException (e.getMessage ());
        }
    }

    // 加载数据后操作
    private void afterLoad(String tableName) {
        h2AggMetaCacher.put (tableName, System.currentTimeMillis ());
    }

    /**
     * 查询H2数据库
     *
     * @param sql
     * @return
     * @throws Exception
     */
    public H2Response query(String sql) {
        logger.info ("Execute: {}", sql);
        long bef = System.currentTimeMillis ();
        H2Response response = new H2Response ();
        List<Map<String, String>> records = new ArrayList<> ();
        LinkedHashMap<String, String> columns = new LinkedHashMap<> ();
        Map<String, String> record = null;
        String columnLabel = "";
        try (Connection conn = h2DataSource.getConnection ();
             Statement stat = conn.createStatement ();
             ResultSet rs = stat.executeQuery (sql)) {
            ResultSetMetaData metadata = rs.getMetaData ();
            int count = metadata.getColumnCount ();
            for (int i = 1; i <= count; i++) {
                columns.put (metadata.getColumnLabel (i), metadata.getColumnTypeName (i));
            }
            while (rs.next ()) {
                record = new HashMap<> ();
                for (int i = 1; i <= count; i++) {
                    columnLabel = metadata.getColumnLabel (i);
                    record.put (columnLabel, rs.getString (columnLabel));
                }
                records.add (record);
            }
        } catch (Exception e) {
            e.printStackTrace ();
            throw new RuntimeException (e.getMessage ());
        }
        response.setColumns (columns);
        response.setRecords (records);
        logger.info ("H2 Database query using time: {} ms", System.currentTimeMillis () - bef);
        return response;
    }

    /**
     * 是否可以重新加载
     *
     * @param tableName
     * @return
     */
    public boolean isReload(String tableName) {
        return isTimeout (tableName) || !isTableExists (tableName);
    }

    // 判断h2数据是否超时
    private boolean isTimeout(String tableName) {
        Long createTimeStamp = h2AggMetaCacher.get (tableName);
        return createTimeStamp == null || System.currentTimeMillis () - createTimeStamp > (aggregatorH2DataTimeout * 1000);
    }

    /**
     * 检查表是否存在于h2数据库中
     *
     * @param tableName
     * @return
     */
    public boolean isTableExists(String tableName) {
        boolean exists = false;
        String sql = H2SqlUtil.tablesInfo (tableName);
        try (Connection conn = h2DataSource.getConnection ();
             Statement stat = conn.createStatement ();
             ResultSet rs = stat.executeQuery (sql)) {
            int count = 0;
            while (rs.next ()) {
                count = rs.getInt (1);
            }
            if (count > 0) {
                exists = true;
            }
        } catch (Exception e) {
            e.printStackTrace ();
            throw new RuntimeException (e.getMessage ());
        }
        return exists;
    }

    /**
     * 获取服务的缓存名称
     *
     * @param serviceName
     * @return
     */
    public List<String> getCaches(String serviceName) {
        return getTableNames (getH2TableNamePrefix (serviceName));
    }

    /**
     * 获取所有的缓存名称
     *
     * @return
     */
    public List<String> getCaches() {
        return getTableNames (TBL_PREFIX);
    }

    /**
     * 获取表名称列表
     *
     * @param tableNamePrefix
     * @return
     */
    public List<String> getTableNames(String tableNamePrefix) {
        List<String> list = new ArrayList<> ();
        String sql = H2SqlUtil.tableList (tableNamePrefix);
        logger.info ("Execute: {}", sql);
        try (Connection conn = h2DataSource.getConnection ();
             Statement stat = conn.createStatement ();
             ResultSet rs = stat.executeQuery (sql)) {
            while (rs.next ()) {
                list.add (rs.getString (1));
            }
        } catch (Exception e) {
            e.printStackTrace ();
            throw new RuntimeException (e.getMessage ());
        }
        return list;
    }

    /**
     * 删除表
     *
     * @param tableName
     * @return
     */
    public boolean dropTable(String tableName) {
        String sql = H2SqlUtil.dropTable (tableName);
        logger.info ("Execute: {}", sql);
        try (Connection conn = h2DataSource.getConnection ();
             Statement stat = conn.createStatement ();) {
            stat.execute (sql);
        } catch (Exception e) {
            e.printStackTrace ();
            throw new RuntimeException (e.getMessage ());
        }
        return true;
    }

    /**
     * 清空数据库
     *
     * @return
     */
    public boolean cleanDatabase() {
        String sql = H2SqlUtil.resetDB ();
        logger.info ("Execute: {}", sql);
        try (Connection conn = h2DataSource.getConnection ();
             Statement stmt = conn.createStatement ();) {
            stmt.execute (sql);
        } catch (SQLException e) {
            e.printStackTrace ();
            throw new RuntimeException (e.getMessage ());
        }
        return true;
    }
}
