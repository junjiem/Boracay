package com.hex.bigdata.udsp.im.converter.impl.wrapper;

import com.hex.bigdata.udsp.im.converter.RealtimeSourceConverter;
import com.hex.bigdata.udsp.im.converter.model.Metadata;
import com.hex.bigdata.udsp.im.converter.model.ModelMapping;
import com.hex.bigdata.udsp.im.converter.model.ValueColumn;
import com.hex.bigdata.udsp.im.converter.model.WhereProperty;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.IOException;
import java.util.List;

/**
 * Created by JunjieM on 2017-9-7.
 */
public abstract class KafkaWrapper extends Wrapper implements RealtimeSourceConverter {
    private static Logger logger = LogManager.getLogger(KafkaWrapper.class);

    @Override
    protected void insertInto(Metadata metadata, List<ModelMapping> modelMappings, List<ValueColumn> valueColumns) throws Exception {
        try {
            throw new Exception("不支持该方法");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void updateInsert(Metadata metadata, List<ModelMapping> modelMappings, List<ValueColumn> valueColumns, List<WhereProperty> whereProperties) throws Exception {
        try {
            throw new Exception("不支持该方法");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void matchingUpdate(Metadata metadata, List<ModelMapping> modelMappings, List<ValueColumn> valueColumns, List<WhereProperty> whereProperties) throws Exception {
        try {
            throw new Exception("不支持该方法");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected List<String> getSelectColumns(List<ModelMapping> modelMappings, Metadata metadata) {
        try {
            throw new Exception("不支持该方法");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void emptyDatas(Metadata metadata) throws IOException, Exception {
        try {
            throw new Exception("不支持该方法");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
