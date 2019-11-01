package com.hex.bigdata.udsp.im.converter.impl.util;

import com.hex.bigdata.udsp.im.converter.impl.model.HiveDatasource;
import com.hex.bigdata.udsp.im.converter.impl.thread.HiveGetLogThread;
import com.hex.bigdata.udsp.im.service.BatchJobService;
import com.hex.goframe.util.WebApplicationContextUtil;
import org.apache.commons.dbcp.DelegatingStatement;
import org.apache.hive.jdbc.HiveStatement;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by JunjieM on 2017-9-22.
 */
public class HiveJdbcUtil {
    private static Logger logger = LogManager.getLogger(HiveJdbcUtil.class);
    private static Map<String, HiveStatement> hiveStatementPool = new ConcurrentHashMap<> ();

    // 这里的锁是类锁
    public static synchronized HiveStatement getHiveStatement(String key) {
        return hiveStatementPool.get(key);
    }

    // 这里的锁是类锁
    public static synchronized void removeHiveStatement(String key) {
        hiveStatementPool.remove(key);
    }

    // 这里的锁是类锁
    public static synchronized void putHiveStatement(String key, HiveStatement statement) {
        hiveStatementPool.put(key, statement);
    }

    public static boolean executeUpdate(String key, HiveDatasource datasource, String updateSql) throws SQLException {
        logger.info("HIVE EXECUTE UPDATE SQL [START]");
        logger.info("UPDATE SQL: \n" + updateSql);
        BatchJobService batchService = (BatchJobService) WebApplicationContextUtil.getBean("batchJobService");
        Connection conn = null;
        Statement stmt = null;
        HiveStatement hiveStmt = null;
        int rs = -1;
        try {
            conn = JdbcUtil.getConnection(datasource);
            stmt = conn.createStatement();

            // DelegatingStatement转成HiveStatement
            hiveStmt = (HiveStatement) ((DelegatingStatement) stmt).getInnermostDelegate();

            // 加入缓存池
            putHiveStatement(key, hiveStmt);

            // 状态改为“正在构建”
            batchService.building(key, 0);

            // 启动 Hive Jdbc 日志监控
            HiveGetLogThread thread = new HiveGetLogThread(key, 500L, 10);
            thread.start();

            String[] sqls = updateSql.split(";");
            for (String sql : sqls) {
                logger.debug("SUB SQL: " + sql);
                rs = hiveStmt.executeUpdate(sql);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException(e);
        } finally {
            JdbcUtil.close(stmt);
            JdbcUtil.close(conn);
            removeHiveStatement(key);
            logger.info("HIVE EXECUTE UPDATE SQL [END]");
        }
        return rs == 0;
    }
}
