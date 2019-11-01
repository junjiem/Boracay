package com.hex.bigdata.udsp.im.converter.model;

import com.hex.bigdata.udsp.common.api.model.Base;
import com.hex.bigdata.udsp.common.api.model.Datasource;
import com.hex.bigdata.udsp.common.api.model.Property;
import com.hex.bigdata.udsp.im.constant.BuildMode;
import com.hex.bigdata.udsp.im.constant.ModelStatus;
import com.hex.bigdata.udsp.im.constant.ModelType;
import com.hex.bigdata.udsp.im.constant.UpdateMode;
import org.apache.commons.lang3.StringUtils;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by JunjieM on 2017-9-5.
 */
public class Model extends Base implements Serializable {
    private String id; // 唯一键

    private String name;

    private String describe;

    private String note;

    private ModelType type; // 类型（1：批量 2：实时）

    private ModelStatus status; // 状态（1：未建，2：已建）

    private BuildMode buildMode; // 构建策略（1：增量，2：全量）

    private UpdateMode updateMode; // 更新策略（1、匹配更新 2、更新、插入 3、增量插入）

    private List<MetadataCol> updateKeys; // 更新键值集合

    private Datasource sourceDatasource; // 源的数据源

    private Metadata targetMetadata; // 目标的元数据

    private Datasource engineDatasource; // 引擎的数据源

    private List<ModelMapping> modelMappings; // 字段映射集合

    private List<ModelFilterCol> modelFilterCols; // 过滤字段集合

    public Model() {
    }

    public Model(List<Property> properties) {
        super(properties);
    }

    public Model(Map<String, Property> propertyMap) {
        super(propertyMap);
    }

    public Model(Model model) {
        super(model.propertyMap);
        this.id = model.id;
        this.name = model.name;
        this.describe = model.describe;
        this.note = model.note;
        this.type = model.type;
        this.status = model.status;
        this.buildMode = model.buildMode;
        this.updateMode = model.updateMode;
        this.updateKeys = model.updateKeys;
        this.sourceDatasource = model.sourceDatasource;
        this.targetMetadata = model.targetMetadata;
        this.engineDatasource = model.engineDatasource;
        this.modelMappings = model.modelMappings;
        this.modelFilterCols = model.modelFilterCols;
    }

    public String getId() {
        if (StringUtils.isBlank(id)) {
            throw new IllegalArgumentException ("id不能为空");
        }
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        if (StringUtils.isBlank(name)) {
            throw new IllegalArgumentException ("name不能为空");
        }
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public ModelType getType() {
        if (type == null) {
            throw new IllegalArgumentException ("type不能为空");
        }
        return type;
    }

    public void setType(ModelType type) {
        this.type = type;
    }

    public ModelStatus getStatus() {
        if (status == null) {
            throw new IllegalArgumentException ("status不能为空");
        }
        return status;
    }

    public void setStatus(ModelStatus status) {
        this.status = status;
    }

    public BuildMode getBuildMode() {
        return buildMode;
    }

    public void setBuildMode(BuildMode buildMode) {
        this.buildMode = buildMode;
    }

    public UpdateMode getUpdateMode() {
        return updateMode;
    }

    public void setUpdateMode(UpdateMode updateMode) {
        this.updateMode = updateMode;
    }

    public Datasource getSourceDatasource() {
        if (sourceDatasource == null) {
            throw new IllegalArgumentException ("sourceDatasource不能为空");
        }
        return sourceDatasource;
    }

    public void setSourceDatasource(Datasource sourceDatasource) {
        this.sourceDatasource = sourceDatasource;
    }

    public Metadata getTargetMetadata() {
        if (targetMetadata == null) {
            throw new IllegalArgumentException ("targetMetadata不能为空");
        }
        return targetMetadata;
    }

    public void setTargetMetadata(Metadata targetMetadata) {
        this.targetMetadata = targetMetadata;
    }

    public Datasource getEngineDatasource() {
        return engineDatasource;
    }

    public void setEngineDatasource(Datasource engineDatasource) {
        this.engineDatasource = engineDatasource;
    }

    public List<ModelMapping> getModelMappings() {
        if (modelMappings == null || modelMappings.size() == 0) {
            throw new IllegalArgumentException ("modelMappings不能为空");
        }
        return modelMappings;
    }

    public void setModelMappings(List<ModelMapping> modelMappings) {
        this.modelMappings = modelMappings;
    }

    public List<ModelFilterCol> getModelFilterCols() {
        return modelFilterCols;
    }

    public void setModelFilterCols(List<ModelFilterCol> modelFilterCols) {
        this.modelFilterCols = modelFilterCols;
    }

    public List<MetadataCol> getUpdateKeys() {
        return updateKeys;
    }

    public void setUpdateKeys(List<MetadataCol> updateKeys) {
        this.updateKeys = updateKeys;
    }

    public boolean gainViolenceQuery() {
        String value = gainProperty("violence.query").getValue();
        if (StringUtils.isBlank(value)) {
            value = "true";
        }
        return Boolean.valueOf(value);
    }

    /**
     * hive.set.sql="set mapred.map.tasks=1;"
     * @return
     */
    public String gainHiveSetSql() {
        String value = gainProperty("hive.set.sql").getValue();
        if (StringUtils.isBlank(value)) {
            value = "";
        }
        return value;
    }
}
