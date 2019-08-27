package com.hex.bigdata.udsp.dsl.model;

import java.util.List;

/**
 * Created by JunjieM on 2019-8-22.
 */
public class DslSelectSql {

    private String sourceSql; // 源Select SQL语句
    private String fakeSql; // 伪Select SQL语句
    private List<DslSql> dslSqls; // 子的Select SQL对象

    public String getSourceSql() {
        return sourceSql;
    }

    public void setSourceSql(String sourceSql) {
        this.sourceSql = sourceSql;
    }

    public String getFakeSql() {
        return fakeSql;
    }

    public void setFakeSql(String fakeSql) {
        this.fakeSql = fakeSql;
    }

    public List<DslSql> getDslSqls() {
        return dslSqls;
    }

    public void setDslSqls(List<DslSql> dslSqls) {
        this.dslSqls = dslSqls;
    }
}
