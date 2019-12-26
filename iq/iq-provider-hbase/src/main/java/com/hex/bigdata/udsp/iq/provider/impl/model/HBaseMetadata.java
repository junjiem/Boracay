package com.hex.bigdata.udsp.iq.provider.impl.model;

import com.hex.bigdata.udsp.common.api.model.Property;
import com.hex.bigdata.udsp.iq.provider.model.Metadata;
import org.apache.commons.lang3.StringUtils;
import org.apache.hadoop.hbase.util.Bytes;

import java.util.List;
import java.util.Map;

/**
 * Created by PC on 2018/8/20.
 */
public class HBaseMetadata extends Metadata {

    public HBaseMetadata() {
    }

    public HBaseMetadata(List<Property> properties) {
        super(properties);
    }

    public HBaseMetadata(Map<String, Property> propertyMap) {
        super(propertyMap);
    }

    public HBaseMetadata(Metadata metadata) {
        super(metadata);
    }

    public String gainFqDataType() {
        String value = gainProperty("hbase.fq.data.type").getValue();
        if (StringUtils.isBlank(value)) {
            value = "dsv";
        }
        return value;
    }

    public String gainDsvSeparator() {
        String value = gainProperty("hbase.fq.dsv.separator").getValue();
        if (StringUtils.isBlank(value)) {
            value = "\\007";
        }
        return value;
    }

    public byte[] gainFamilyName() {
        String value = gainProperty("hbase.family.name").getValue();
        if (StringUtils.isBlank(value)) {
            value = "f";
        }
        return Bytes.toBytes(value);
    }

    public byte[] gainQualifierName() {
        String value = gainProperty("hbase.qualifier.name").getValue();
        if (StringUtils.isBlank(value)) {
            value = "q";
        }
        return Bytes.toBytes(value);
    }
}
