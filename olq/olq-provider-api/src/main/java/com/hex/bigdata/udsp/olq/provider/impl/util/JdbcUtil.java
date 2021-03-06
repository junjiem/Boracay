package com.hex.bigdata.udsp.olq.provider.impl.util;

import com.hex.bigdata.udsp.olq.provider.impl.model.JdbcDatasource;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by JunjieM on 2019-8-19.
 */
public class JdbcUtil {
    private static Logger logger = LogManager.getLogger (JdbcUtil.class);
    private static Map<String, BasicDataSource> dataSourcePool = new ConcurrentHashMap<> ();

    public static BasicDataSource getDataSource(JdbcDatasource datasource) {
        String dsId = datasource.getId ();
        String key = "olq-jdbc-" + dsId;
        synchronized (key.intern ()) {
            BasicDataSource dataSource = dataSourcePool.remove (dsId);
            if (dataSource == null || dataSource.isClosed ()) {
                dataSource = new BasicDataSource ();
                /**
                 * 基础配置
                 */
                if (StringUtils.isNotBlank (datasource.gainDriverClass ())) {
                    dataSource.setDriverClassName (datasource.gainDriverClass ());
                }
                if (StringUtils.isNotBlank (datasource.gainJdbcUrl ())) {
                    dataSource.setUrl (datasource.gainJdbcUrl ());
                }
                if (StringUtils.isNotBlank (datasource.gainUsername ())) {
                    dataSource.setUsername (datasource.gainUsername ());
                }
                if (StringUtils.isNotBlank (datasource.gainPassword ())) {
                    dataSource.setPassword (datasource.gainPassword ());
                }
                /**
                 * 资源配置
                 */
                // 连接池启动时创建的初始化连接数量（默认值为0，推荐为1）。
                if (StringUtils.isNotBlank (datasource.gainInitialSize ())) {
                    dataSource.setInitialSize (Integer.valueOf (datasource.gainInitialSize ()));
                }
                // 连接池中最小的空闲连接数，低于这个数量会被创建新的连接（默认为0，推荐为5）。
                // 该参数越接近maxIdle性能越好，因为连接的创建和销毁都是需要消耗资源的；
                // 但是不能太大，因为在机器很空闲时也会创建低于minIdle个数的连接，类似JVM参数中的Xmn设置。
                if (StringUtils.isNotBlank (datasource.gainMinIdle ())) {
                    dataSource.setMinIdle (Integer.valueOf (datasource.gainMinIdle ()));
                }
                // 连接池中最大的空闲连接数，超过的空闲连接将被释放，如果设置为负数表示不限制（默认为8）。
                // maxIdel不能设置太小，因为假如在高负载情况下连接打开时间比关闭时间快，
                // 会引起连接池中idle的个数上升超过maxIdle，而造成频繁的连接销毁和创建，类似于JVM参数中的Xmx设置。
                if (StringUtils.isNotBlank (datasource.gainMaxIdle ())) {
                    dataSource.setMaxIdle (Integer.valueOf (datasource.gainMaxIdle ()));
                }
                // 连接池中可同时连接的最大连接数（默认为8），具体设置根据应用场景来定。
                if (StringUtils.isNotBlank (datasource.gainMaxActive ())) {
                    dataSource.setMaxActive (Integer.valueOf (datasource.gainMaxActive ()));
                }
                // 最大等待时间，当没有可用连接时，连接池等待连接释放的最大时间，超过该时间限制会抛出异常，
                // 如果设置-1表示无限等待（默认为-1，推荐60000（毫秒），避免因线程池不够用而导致请求被无限挂起）。
                if (StringUtils.isNotBlank (datasource.gainMaxWait ())) {
                    dataSource.setMaxWait (Integer.valueOf (datasource.gainMaxWait ()));
                }
//            // 开启池的准备Statements（默认false，推荐false，经过测试开启后性能没有关闭的好）
//            if(StringUtils.isNotBlank(datasource.getPoolPreparedStatements()))
//                dataSource.setPoolPreparedStatements(Boolean.valueOf(datasource.getPoolPreparedStatements()));
//            // 开启池的准备Statements最大链接数（默认无限制）
//            if(StringUtils.isNotBlank(datasource.getMaxOpenPreparedStatements()))
//                dataSource.setMaxOpenPreparedStatements(Integer.valueOf(datasource.getMaxOpenPreparedStatements()));
                // 连接池中连接在时间段内一直空闲，被逐出链接池的时间（默认30分钟，可以适当做调整，需要和后端服务端的策略配置相关）
                if (StringUtils.isNotBlank (datasource.gainMinEvictableIdleTimeMillis ())) {
                    dataSource.setMinEvictableIdleTimeMillis (Integer.valueOf (datasource.gainMinEvictableIdleTimeMillis ()));
                }
                // 超过removeAbandonedTimeout时间后是否进行没用连接的回收（默认为false，推荐true）
                if (StringUtils.isNotBlank (datasource.gainRemoveAbandoned ())) {
                    dataSource.setRemoveAbandoned (Boolean.valueOf (datasource.gainRemoveAbandoned ()));
                }
                // 超过时间限制，回收没用的连接，单位秒（默认为300秒，推荐180秒）
                if (StringUtils.isNotBlank (datasource.gainRemoveAbandonedTimeout ())) {
                    dataSource.setRemoveAbandonedTimeout (Integer.valueOf (datasource.gainRemoveAbandonedTimeout ()));
                }
                /**
                 * 验证配置
                 */
                // 是否被无效连接销毁器进行检验（推荐true）
                if (StringUtils.isNotBlank (datasource.gainTestWhileIdle ())) {
                    dataSource.setTestWhileIdle (Boolean.valueOf (datasource.gainTestWhileIdle ()));
                }
                // 无效连接的检测间隔时间（毫秒）
                if (StringUtils.isNotBlank (datasource.gainTimeBetweenEvictionRunsMillis ())) {
                    dataSource.setTimeBetweenEvictionRunsMillis (Integer.valueOf (datasource.gainTimeBetweenEvictionRunsMillis ()));
                }
                // 验证链接的SQL语句，必须能返回一行及以上数据
                if (StringUtils.isNotBlank (datasource.gainValidationQuery ())) {
                    dataSource.setValidationQuery (datasource.gainValidationQuery ());
                }
                // 验证有效连接的超时时间
                if (StringUtils.isNotBlank (datasource.gainValidationQueryTimeout ())) {
                    dataSource.setValidationQueryTimeout (Integer.valueOf (datasource.gainValidationQueryTimeout ()));
                }
                // 是否从池中取出连接前进行检验（推荐false），为true时会很影响性能
                if (StringUtils.isNotBlank (datasource.gainTestOnBorrow ())) {
                    dataSource.setTestOnBorrow (Boolean.valueOf (datasource.gainTestOnBorrow ()));
                }
                // 是否在归还到池中前进行检验（推荐false），为true时会很影响性能
                if (StringUtils.isNotBlank (datasource.gainTestOnReturn ())) {
                    dataSource.setTestOnReturn (Boolean.valueOf (datasource.gainTestOnReturn ()));
                }
            }
            dataSourcePool.put (dsId, dataSource);
            return dataSource;
        }
    }

    public static Connection getConnection(JdbcDatasource jdbcDatasource) throws SQLException {
        Connection conn = null;
        BasicDataSource dataSource = getDataSource (jdbcDatasource);
        if (dataSource != null) {
            conn = dataSource.getConnection ();
            try {
                logger.info ("JDBC DB Type: " + conn.getMetaData ().getDatabaseProductName ());
            } catch (Exception e) {
                //
            }
        }
        return conn;
    }

    public static void close(ResultSet rs, Statement stmt, Connection conn) {
        if (rs != null) {
            try {
                rs.close ();
            } catch (SQLException e) {
                e.printStackTrace ();
                rs = null;
            }
        }
        if (stmt != null) {
            try {
                stmt.close ();
            } catch (SQLException e) {
                e.printStackTrace ();
                stmt = null;
            }
        }
        if (conn != null) {
            try {
                conn.close ();
            } catch (SQLException e) {
                e.printStackTrace ();
                conn = null;
            }
        }
    }
}
