package com.hex.bigdata.udsp.common.api.model;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by junjiem on 2017-3-2.
 */
public class Datasource extends Base implements Serializable {
    private String id; // Redis使用Jackson进行序列化和反序列化时对于get开头的方法必须要有对应的变量

    private String name;

    private String describe;

    private String type;  // 类型

    private String note;

    private String implClass;

    public Datasource() {
        // Redis使用Jackson进行序列化和反序列化时必须要有空构造函数
    }

    public Datasource(List<Property> properties) {
        super(properties);
    }

    public Datasource(Map<String, Property> propertieMap) {
        super(propertieMap);
    }

    public Datasource(Datasource datasource) {
        super(datasource.propertyMap);
        this.type = datasource.type;
        this.name = datasource.name;
        this.describe = datasource.describe;
        this.note = datasource.note;
        this.implClass = datasource.implClass;
    }

    public String getId() {
        StringBuffer sb = new StringBuffer();
        for (Property property : properties) {
            sb.append(property.getName() + "=" + property.getValue() + "\n");
        }
        return DigestUtils.md5Hex(sb.toString());
    }

    public String getImplClass() {
        return implClass;
    }

    public void setImplClass(String implClass) {
        this.implClass = implClass;
    }

    public String getName() {
        if (StringUtils.isBlank(name))
            throw new IllegalArgumentException("name不能为空");
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescribe() {
        if (StringUtils.isBlank(describe))
            throw new IllegalArgumentException("describe不能为空");
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getType() {
        if (StringUtils.isBlank(type))
            throw new IllegalArgumentException("type不能为空");
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
