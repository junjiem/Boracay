package com.hex.bigdata.udsp.common.constant;

/**
 * 操作符
 */
public enum Operator {
    EQ("等于", "=="),
    GT("大于", ">"),
    LT("小于", "<"),
    GE("大于等于", ">="),
    LE("小于等于", "<="),
    NE("不等于", "!="),
    LK("模糊匹配", "like"),
    IN("in查询","in"),
    RLIKE("右模糊匹配","right like");

    private String value;
    private String name;

    private Operator(String name, String value) {
        this.value = value;
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static Operator getOperatorByValue(String value) {
        switch (value){
            case "==":
                return EQ;
            case  ">" :
                return GT;
            case "<" :
                return LT;
            case ">=" :
                return GE;
            case "<=" :
                return LE;
            case "!=" :
                return NE;
            case "like" :
                return LK;
            case "in" :
                return IN;
            case "right like" :
                return RLIKE;
            default:
                return null;
        }
    }
}
