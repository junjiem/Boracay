package com.hex.bigdata.udsp.im.converter.impl.util;

import com.hex.bigdata.udsp.common.api.model.Property;
import com.hex.bigdata.udsp.im.converter.impl.model.HBaseDatasource;
import org.apache.commons.lang.StringUtils;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.security.UserGroupInformation;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by JunjieM on 2019-7-4.
 */
public class HBaseConnectionPool {
    static {
        // 解决winutils.exe不存在的问题
        try {
            File workaround = new File (".");
            System.getProperties ().put ("hadoop.home.dir",
                    workaround.getAbsolutePath ());
            new File ("./bin").mkdirs ();
            new File ("./bin/winutils.exe").createNewFile ();
        } catch (IOException e) {
            e.printStackTrace ();
        }
    }

    /**
     * 测试发现这里使用ConcurrentHashMap线程安全Map高并发时反而会导致HBase连接线程无限上涨，而使用HashMap却不会有这个问题。
     */
    private static Map<String, Connection> pool = new HashMap<> ();

    private static Configuration getConfiguration(HBaseDatasource datasource) {
        Configuration conf = HBaseConfiguration.create ();
        for (Property property : datasource.getProperties ()) {
            conf.set (property.getName (), property.getValue ());
        }
        conf.set ("hbase.zookeeper.quorum", datasource.gainZkQuorum ());
        conf.set ("hbase.zookeeper.property.clientPort", datasource.gainZkPort ());
        if (StringUtils.isNotBlank (datasource.gainRpcTimeout ())) {
            conf.set ("hbase.rpc.timeout", datasource.gainRpcTimeout ());
        }
        if (StringUtils.isNotBlank (datasource.gainClientRetriesNumber ())) {
            conf.set ("hbase.client.retries.number", datasource.gainClientRetriesNumber ());
        }
        if (StringUtils.isNotBlank (datasource.gainClientPause ())) {
            conf.set ("hbase.client.pause", datasource.gainClientPause ());
        }
        if (StringUtils.isNotBlank (datasource.gainZkRecoveryRetry ())) {
            conf.set ("zookeeper.recovery.retry", datasource.gainZkRecoveryRetry ());
        }
        if (StringUtils.isNotBlank (datasource.gainZkRecoveryRetryIntervalmill ())) {
            conf.set ("zookeeper.recovery.retry.intervalmill", datasource.gainZkRecoveryRetryIntervalmill ());
        }
        if (StringUtils.isNotBlank (datasource.gainClientOperationTimeout ())) {
            conf.set ("hbase.client.operation.timeout", datasource.gainClientOperationTimeout ());
        }
//        if (StringUtils.isNotBlank(datasource.gainRegionserverLeasePeriod()))
//            conf.set("hbase.regionserver.lease.period", datasource.gainRegionserverLeasePeriod()); // 已被弃用
        if (StringUtils.isNotBlank (datasource.gainClientScannerTimeoutPeriod ())) {
            conf.set ("hbase.client.scanner.timeout.period", datasource.gainClientScannerTimeoutPeriod ());
        }
        if (StringUtils.isNotBlank (datasource.gainHBaseRootdir ())) {
            conf.set ("hbase.rootdir", datasource.gainHBaseRootdir ());
        }
        if (StringUtils.isNotBlank (datasource.gainZookeeperZnodeParent ())) {
            conf.set ("zookeeper.znode.parent", datasource.gainZookeeperZnodeParent ());
        }
            /*
            以下是HBase开启Kerberos认证后需要的配置
             */
        if (StringUtils.isNotBlank (datasource.gainHbaseSecurityAuthentication ())) {
            conf.set ("hbase.security.authentication", datasource.gainHbaseSecurityAuthentication ());
        }
        if (StringUtils.isNotBlank (datasource.gainHadoopSecurityAuthentication ())) {
            conf.set ("hadoop.security.authentication", datasource.gainHadoopSecurityAuthentication ());
        }
        if (StringUtils.isNotBlank (datasource.gainHbaseMasterKerberosPrincipal ())) {
            conf.set ("hbase.master.kerberos.principal", datasource.gainHbaseMasterKerberosPrincipal ());
        }
        if (StringUtils.isNotBlank (datasource.gainHbaseRegionserverKerberosPrincipal ())) {
            conf.set ("hbase.regionserver.kerberos.principal", datasource.gainHbaseRegionserverKerberosPrincipal ());
        }
        if (StringUtils.isNotBlank (datasource.gainKerberosPrincipal ())
                && StringUtils.isNotBlank (datasource.gainKerberosKeytab ())) {
            UserGroupInformation.setConfiguration (conf);
            try {
                UserGroupInformation.loginUserFromKeytab (datasource.gainKerberosPrincipal (), datasource.gainKerberosKeytab ());
            } catch (IOException e) {
                throw new RuntimeException (e);
            }
        }
        return conf;
    }

    public static Connection getConnection(HBaseDatasource datasource) {
        String dsId = datasource.getId ();
        String key = "im-hbase-" + dsId;
        synchronized (key.intern ()) {
            Connection conn = pool.remove (dsId);
            // TODO 这里判断链接是否断开效率较低
            boolean isAborted = true;
            if (conn != null && !conn.isClosed () && !conn.isAborted ()) {
                try {
                    // 尝试获取当中的表，如果获取抛异常则获取连接失败
                    conn.getAdmin ().tableExists (TableName.valueOf ("TEST"));
                    isAborted = false;
                } catch (Exception e) {
                    e.printStackTrace ();
                }
            }
            if (isAborted) { // 重新获取新的连接
                Configuration conf = getConfiguration (datasource);
                try {
                    conn = ConnectionFactory.createConnection (conf);
                } catch (Exception e) {
                    e.printStackTrace ();
                    return null;
                }
            }
            pool.put (dsId, conn);
            return conn;
        }
    }
}
