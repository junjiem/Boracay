package com.hex.bigdata.udsp.im.converter.impl.model;


import com.hex.bigdata.udsp.common.api.model.Property;
import com.hex.bigdata.udsp.im.converter.model.Metadata;
import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by JunjieM on 2018-2-26.
 */
public class KuduMetadata extends Metadata {
    public KuduMetadata() {
    }

    public KuduMetadata(List<Property> properties) {
        super(properties);
    }

    public KuduMetadata(Map<String, Property> propertyMap) {
        super(propertyMap);
    }

    public KuduMetadata(Metadata metadata) {
        super(metadata);
    }

    /**
     * 是否预分桶
     *
     * @return
     */
    public boolean gainPrePartitioning() {
        String value = gainProperty("pre.partitioning").getValue();
        if (StringUtils.isBlank(value)) {
            return false;
        }
        return Boolean.valueOf(value);
    }

    /**
     * 哈希分桶数（必须大于等于2）
     *
     * @return
     */
    public Integer gainHashPartitionsBuckets() {
        String value = gainProperty("hash.partitions.buckets").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumericSpace(value)) {
            return 2;
        }
        if (Integer.valueOf(value) < 2) {
            throw new IllegalArgumentException ("hash.partitions.buckets必须大于等于2");
        }
        return Integer.valueOf(value);
    }
}
