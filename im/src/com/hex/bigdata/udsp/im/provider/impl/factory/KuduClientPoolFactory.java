package com.hex.bigdata.udsp.im.provider.impl.factory;

import com.hex.bigdata.udsp.im.provider.impl.model.datasource.KuduDatasource;
import org.apache.commons.pool.BasePoolableObjectFactory;
import org.apache.commons.pool.impl.GenericObjectPool;
import org.apache.kudu.client.KuduClient;
import org.apache.kudu.client.KuduException;

import java.util.List;

/**
 * Created by PC on 2018/2/26.
 */
public class KuduClientPoolFactory {
    private GenericObjectPool pool;

    public KuduClientPoolFactory(GenericObjectPool.Config config, KuduDatasource datasource) {
        KuduClientFactory factory = new KuduClientFactory(datasource);
        pool = new GenericObjectPool(factory, config);
    }

    public KuduClient getClient() throws Exception {
        return (KuduClient) pool.borrowObject();
    }

    public void releaseClient(KuduClient client) {
        try {
            pool.returnObject(client);
        } catch (Exception e) {
            if (client != null) {
                try {
                    client.shutdown();
                } catch (KuduException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    public void closePool() {
        if (pool != null) {
            try {
                pool.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

class KuduClientFactory extends BasePoolableObjectFactory {

    private KuduClient.KuduClientBuilder clientBuilder;

    private List<String> masterAddresses;
    private Integer bossCount;
    private Long defaultAdminOperationTimeoutMs;
    private Long defaultOperationTimeoutMs;
    private Long defaultSocketReadTimeoutMs;
    private boolean disableStatistics;
    private Integer workerCount;

    public KuduClientFactory(KuduDatasource datasource) {
        masterAddresses = datasource.getMasterAddresses();
        bossCount = datasource.getBossCount();
        clientBuilder = new KuduClient.KuduClientBuilder(masterAddresses);
        if (bossCount != null)
            clientBuilder = clientBuilder.bossCount(bossCount);
        defaultAdminOperationTimeoutMs = datasource.getDefaultAdminOperationTimeoutMs();
        if (defaultAdminOperationTimeoutMs != null)
            clientBuilder = clientBuilder.defaultAdminOperationTimeoutMs(defaultAdminOperationTimeoutMs);
        defaultOperationTimeoutMs = datasource.getDefaultOperationTimeoutMs();
        if (defaultOperationTimeoutMs != null)
            clientBuilder = clientBuilder.defaultOperationTimeoutMs(defaultOperationTimeoutMs);
        defaultSocketReadTimeoutMs = datasource.getDefaultSocketReadTimeoutMs();
        if (defaultSocketReadTimeoutMs != null)
            clientBuilder = clientBuilder.defaultSocketReadTimeoutMs(defaultSocketReadTimeoutMs);
        disableStatistics = datasource.getDisableStatistics();
        if (disableStatistics)
            clientBuilder = clientBuilder.disableStatistics();
        workerCount = datasource.getWorkerCount();
        if (workerCount != null)
            clientBuilder = clientBuilder.workerCount(workerCount);
    }

    @Override
    public Object makeObject() throws Exception {
        return clientBuilder.build();
    }

    public void destroyObject(Object obj) throws Exception {
        if (obj instanceof KuduClient) {
            ((KuduClient) obj).shutdown();
        }
    }

    public boolean validateObject(Object obj) {
        if (obj == null) {
            return false;
        }
        return true;
    }
}
