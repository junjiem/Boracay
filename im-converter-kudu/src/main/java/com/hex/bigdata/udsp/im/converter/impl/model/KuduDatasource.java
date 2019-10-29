package com.hex.bigdata.udsp.im.converter.impl.model;

import com.hex.bigdata.udsp.common.api.model.Datasource;
import org.apache.commons.lang3.StringUtils;

import java.util.Arrays;
import java.util.List;

/**
 * Created by JunjieM on 2018-2-24.
 */
public class KuduDatasource extends Datasource {

    public KuduDatasource(Datasource datasource) {
        super(datasource);
    }

    public String gainKuduMasterHosts() {
        String value = gainProperty("kudu.master.hosts").getValue();
        if (StringUtils.isBlank(value)) {
            throw new IllegalArgumentException ("kudu.master.hosts不能为空");
        }
        return value;
    }

    public List<String> gainMasterAddresses() {
        return Arrays.asList(gainKuduMasterHosts().split(","));
    }

    /**
     * @return
     */
    public Integer gainBossCount() {
        String value = gainProperty("boss.count").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumericSpace(value)) {
            return null;
        }
        return Integer.valueOf(value);
    }

    /**
     * 用于管理操作的超时时间（毫秒）
     *
     * @return
     */
    public Long gainDefaultAdminOperationTimeoutMs() {
        String value = gainProperty("default.admin.operation.timeout.ms").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumericSpace(value)) {
            return null;
        }
        return Long.valueOf(value);
    }

    /**
     * 用于用户操作的超时时间（毫秒）
     *
     * @return
     */
    public Long gainDefaultOperationTimeoutMs() {
        String value = gainProperty("default.operation.timeout.ms").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumericSpace(value)) {
            return null;
        }
        return Long.valueOf(value);
    }

    /**
     * Socket读取的超时时间（毫秒）
     *
     * @return
     */
    public Long gainDefaultSocketReadTimeoutMs() {
        String value = gainProperty("default.socket.read.timeout.ms").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumericSpace(value)) {
            return null;
        }
        return Long.valueOf(value);
    }

    /**
     * 禁用客户端的统计数据集
     *
     * @return
     */
    public boolean gainDisableStatistics() {
        String value = gainProperty("disable.statistics").getValue();
        if (StringUtils.isBlank(value)) {
            value = "false";
        }
        return Boolean.valueOf(value);
    }

    /**
     * 工作线程的最大数量
     *
     * @return
     */
    public Integer gainWorkerCount() {
        String value = gainProperty("worker.count").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumericSpace(value)) {
            return null;
        }
        return Integer.valueOf(value);
    }

}
