package com.hex.bigdata.udsp.common.aggregator;

/**
 * 自定义函数
 */
public class H2Functions {

    /**
     * 字符串转Double函数
     * <p>
     * 函数注册：CREATE ALIAS IF NOT EXISTS f_todouble FOR "com.hex.bigdata.udsp.common.aggregator.H2Functions.parserString2Double";
     *
     * @param str
     * @return
     */
    public static double parserString2Double(String str) {
        if (null == str) {
            return 0f;
        }
        try {
            return Double.parseDouble (str);
        } catch (Exception e) {
            return 0f;
        }
    }
}