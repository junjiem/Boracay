package com.hex.bigdata.udsp.im.converter.impl.model;

import com.hex.bigdata.udsp.common.api.model.Property;
import com.hex.bigdata.udsp.im.converter.model.Metadata;
import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.Map;

/**
 * Created by JunjieM on 2017-9-5.
 */
public class SolrMetadata extends Metadata {
    public SolrMetadata() {
    }

    public SolrMetadata(List<Property> properties) {
        super(properties);
    }

    public SolrMetadata(Map<String, Property> propertyMap) {
        super(propertyMap);
    }

    public SolrMetadata(Metadata metadata) {
        super(metadata);
    }

    public int gainShards() {
        String value = gainProperty("solr.shards").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumeric(value)) {
            throw new IllegalArgumentException ("solr.shards不能为空且必须是整数");
        }
        return Integer.valueOf(value);
    }

    public int gainReplicas() {
        String value = gainProperty("solr.replicas").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumeric(value)) {
            //throw new IllegalArgumentException("solr.replicas不能为空且必须是整数");
            value = "2";
        }
        return Integer.valueOf(value);
    }

    public int gainMaxShardsPerNode() {
        String value = gainProperty("solr.max.shards.per.node").getValue();
        if (StringUtils.isBlank(value) || !StringUtils.isNumeric(value)) {
            //throw new IllegalArgumentException("solr.max.shards.per.node不能为空且必须是整数");
            value = "2";
        }
        return Integer.valueOf(value);
    }
}
