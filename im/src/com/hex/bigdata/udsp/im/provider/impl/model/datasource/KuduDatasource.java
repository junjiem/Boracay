package com.hex.bigdata.udsp.im.provider.impl.model.datasource;

import com.hex.bigdata.udsp.common.provider.model.Datasource;
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

    public String getKuduMasterHosts() {
        String value = getProperty("kudu.master.hosts").getValue();
        if (StringUtils.isBlank(value))
            throw new IllegalArgumentException("kudu.master.hosts不能为空");
        return value;
    }

    public List<String> getMasterAddresses() {
        return Arrays.asList(getKuduMasterHosts().split(","));
    }

    /**
     * @return
     */
    public Integer getBossCount() {
        String value = getProperty("boss.count").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumericSpace(value))
            return null;
        return Integer.valueOf(value);
    }

    /**
     * 用于管理操作的超时时间（毫秒）
     *
     * @return
     */
    public Long getDefaultAdminOperationTimeoutMs() {
        String value = getProperty("default.admin.operation.timeout.ms").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumericSpace(value))
            return null;
        return Long.valueOf(value);
    }

    /**
     * 用于用户操作的超时时间（毫秒）
     *
     * @return
     */
    public Long getDefaultOperationTimeoutMs() {
        String value = getProperty("default.operation.timeout.ms").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumericSpace(value))
            return null;
        return Long.valueOf(value);
    }

    /**
     * Socket读取的超时时间（毫秒）
     *
     * @return
     */
    public Long getDefaultSocketReadTimeoutMs() {
        String value = getProperty("default.socket.read.timeout.ms").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumericSpace(value))
            return null;
        return Long.valueOf(value);
    }

    /**
     * 禁用客户端的统计数据集
     *
     * @return
     */
    public boolean getDisableStatistics() {
        String value = getProperty("disable.statistics").getValue();
        if (StringUtils.isBlank(value))
            value = "false";
        return Boolean.valueOf(value);
    }

    /**
     * 工作线程的最大数量
     *
     * @return
     */
    public Integer getWorkerCount() {
        String value = getProperty("worker.count").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumericSpace(value))
            return null;
        return Integer.valueOf(value);
    }

}
