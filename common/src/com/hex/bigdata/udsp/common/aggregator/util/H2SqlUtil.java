package com.hex.bigdata.udsp.common.aggregator.util;

import com.hex.bigdata.udsp.common.aggregator.constant.H2DataType;
import com.hex.bigdata.udsp.common.aggregator.model.H2DataColumn;
import org.apache.commons.lang.StringUtils;

import java.util.List;

/**
 * Created by JunjieM on 2019-1-29.
 */
public class H2SqlUtil {

    public static String resetDB() {
        return "DROP ALL OBJECTS DELETE FILES";
    }

    public static String dropTable(String tableName) {
        return "DROP TABLE IF EXISTS " + tableName;
    }

    public static String createTable(String tableName, List<H2DataColumn> columns) {
        return "CREATE TABLE " + tableName + getColumns (columns);
    }

    private static String getColumns(List<H2DataColumn> columns) {
        String sql = "";
        int count = 0;
        if (columns != null && columns.size () != 0) {
            sql = " (";
            for (H2DataColumn column : columns) {
                String colName = column.getColName ();
                H2DataType dataType = column.getDataType ();
                String length = column.getLength ();
                if (StringUtils.isBlank (colName) || dataType == null) {
                    continue;
                }
                sql += (count == 0 ? "" : ",");
                sql += colName + " " + getColType (dataType, length);
                count++;
            }
            sql += ")";
        }
        return sql;
    }

    private static String getColType(H2DataType dataType, String length) {
        switch (dataType) {
            case VARCHAR:
            case CHAR:
            case DECIMAL:
                return dataType.getValue () + "(" + length + ")";
            case BIGINT:
            case DOUBLE:
            case INT:
            case SMALLINT:
            case TIMESTAMP:
            case BOOLEAN:
            case TINYINT:
            default:
                return dataType.getValue ();
        }
    }

    public static String insertInto(String tableName, int columnSize) {
        return "INSERT INTO " + tableName + getValues (columnSize);
    }

    private static String getValues(int size) {
        String sql = "";
        if (size != 0) {
            sql = " VALUES (";
            for (int i = 0; i < size; i++) {
                sql += (i == 0 ? "" : ", ");
                sql += "?";
            }
            sql += ")";
        }
        return sql;
    }

    public static String tablesInfo(String tableName) {
        return "SELECT count(*) FROM INFORMATION_SCHEMA.tables WHERE table_name = upper('" + tableName + "')";
    }

    public static String tableList(String tableNamePrefix) {
        return "SELECT table_name FROM INFORMATION_SCHEMA.tables WHERE table_name like '" + tableNamePrefix.toUpperCase () + "%'";
    }
}
