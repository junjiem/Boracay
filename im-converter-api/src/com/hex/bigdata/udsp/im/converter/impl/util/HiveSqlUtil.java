package com.hex.bigdata.udsp.im.converter.impl.util;

import com.hex.bigdata.udsp.common.constant.DataType;
import com.hex.bigdata.udsp.common.constant.Operator;
import com.hex.bigdata.udsp.im.converter.model.*;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

/**
 * Created by JunjieM on 2017-9-6.
 */
public class HiveSqlUtil {
    private static final String UDSP_VIEW = "UDSP_VIEW";
    private static final String UDSP_HBASE_VIEW = "UDSP_HBASE_VIEW";

    /**
     * 创建常规表
     *
     * @param isExternal
     * @param ifNotExists
     * @param tableName
     * @param columns
     * @param tableComment
     * @param partitions
     * @param rowFormat
     * @param fileFormat
     * @return
     */
    public static String createTable(boolean isExternal, boolean ifNotExists,
                                     String tableName, List<TableColumn> columns, String tableComment,
                                     List<TableColumn> partitions, RowFormat rowFormat, String fileFormat) {
        return "CREATE" + getExternal(isExternal) + " TABLE"
                + getIfNotExists(ifNotExists) + " " + tableName
                + getColumns(columns) + getTableComment(tableComment)
                + getPartitions(partitions) + getRowFormat(rowFormat)
                + getFileFormat(fileFormat);
    }

    /**
     * 创建表并复制SQL的字段和数据
     *
     * @param ifNotExists
     * @param tableName
     * @param tableComment
     * @param rowFormat
     * @param fileFormat
     * @param selectColumns
     * @param selectSql
     * @param whereProperties
     * @return
     */
    public static String createTableAsSelect2(boolean ifNotExists, String tableName, String tableComment,
                                             RowFormat rowFormat, String fileFormat, List<String> selectColumns,
                                             String selectSql, List<WhereProperty> whereProperties) {
        return createTable (false, ifNotExists, tableName, null, tableComment, null, rowFormat, fileFormat)
                + "\n AS \n" + select2(selectColumns, selectSql, whereProperties);
    }

    /**
     * 创建表并复制表的字段和数据
     *
     * @param ifNotExists
     * @param tableName
     * @param tableComment
     * @param rowFormat
     * @param fileFormat
     * @param selectColumns
     * @param selectTableName
     * @param whereProperties
     * @return
     */
    public static String createTableAsSelect(boolean ifNotExists, String tableName, String tableComment,
                                     RowFormat rowFormat, String fileFormat, List<String> selectColumns,
                                             String selectTableName, List<WhereProperty> whereProperties) {
        return createTable (false, ifNotExists, tableName, null, tableComment, null, rowFormat, fileFormat)
                + "\n AS \n" + select (selectColumns, selectTableName, whereProperties);
    }

    /**
     * 删除表
     *
     * @param ifExists
     * @param tableName
     * @return
     */
    public static String dropTable(boolean ifExists, String tableName) {
        return "DROP TABLE" + getIfExists(ifExists) + " " + tableName;
    }

    /**
     * 创建StorageHandler表
     *
     * @param isExternal
     * @param ifNotExists
     * @param tableName
     * @param columns
     * @param tableComment
     * @param partitions
     * @param storageHandlerClass
     * @param serDeProperties
     * @param tblProperties
     * @return
     */
    public static String createStorageHandlerTable(boolean isExternal, boolean ifNotExists,
                                                   String tableName, List<TableColumn> columns, String tableComment,
                                                   List<TableColumn> partitions, String storageHandlerClass,
                                                   List<SerDeProperty> serDeProperties, List<TblProperty> tblProperties) {
        return "CREATE" + getExternal(isExternal) + " TABLE"
                + getIfNotExists(ifNotExists) + " " + tableName
                + getColumns(columns) + getTableComment(tableComment)
                + getPartitions(partitions)
                + getStoredBy(storageHandlerClass)
                + getSerDeProperties(serDeProperties)
                + getTblProperties(tblProperties);
    }

    /**
     * 查询表
     *
     * @param selectColumns
     * @param selectTableName
     * @param whereProperties
     * @return
     */
    public static String select(List<String> selectColumns,
                                String selectTableName, List<WhereProperty> whereProperties) {
        return "SELECT " + getSelectColumns(selectColumns) + "\n FROM "
                + selectTableName + getWhere(whereProperties);
    }

    /**
     * 查询SQL
     *
     * @param selectColumns
     * @param selectSql
     * @param whereProperties
     * @return
     */
    public static String select2(List<String> selectColumns,
                                 String selectSql, List<WhereProperty> whereProperties) {
        return "SELECT " + getSelectColumns(UDSP_VIEW, selectColumns) + "\n FROM (\n"
                + selectSql + "\n) " + UDSP_VIEW + " " + getWhere(UDSP_VIEW, whereProperties);
    }

    /**
     * 查询表并插入表
     *
     * @param isOverwrite
     * @param insertTableName
     * @param partitionColumns
     * @param selectColumns
     * @param selectTableName
     * @param whereProperties
     * @return
     */
    public static String insert(boolean isOverwrite, String insertTableName,
                                List<String> partitionColumns, List<String> selectColumns,
                                String selectTableName, List<WhereProperty> whereProperties) {
        return "INSERT" + getOverwrite(isOverwrite) + " TABLE "
                + insertTableName + getPartitionKey(partitionColumns) + "\n"
                + select(selectColumns, selectTableName, whereProperties);
    }

    /**
     * 查询SQL并插入表
     *
     * @param isOverwrite
     * @param insertTableName
     * @param partitionColumns
     * @param selectColumns
     * @param selectSql
     * @param whereProperties
     * @return
     */
    public static String insert2(boolean isOverwrite, String insertTableName,
                                 List<String> partitionColumns, List<String> selectColumns,
                                 String selectSql, List<WhereProperty> whereProperties) {
        return "INSERT" + getOverwrite(isOverwrite) + " TABLE "
                + insertTableName + getPartitionKey(partitionColumns) + "\n"
                + select2(selectColumns, selectSql, whereProperties);
    }

    /**
     * 目标表是HBase类型且有自定义sql时重新生成自定义sql语句
     *
     * @param selectColumns
     * @param selectSql
     * @param whereProperties
     * @return
     */
    public static String selectByHBase(List<String> selectColumns,
                                       String selectSql, List<WhereProperty> whereProperties) {
        return "SELECT " + getSelectColumns(selectColumns) + "\n FROM (\n"
                + selectSql + "\n) " + UDSP_HBASE_VIEW + " " + getWhere(UDSP_HBASE_VIEW, whereProperties);
    }

    /**
     * 添加多个字段
     *
     * @param tableName
     * @param columns
     * @return
     */
    public static String addColumns(String tableName, List<TableColumn> columns) {
        return "ALTER TABLE " + tableName + " ADD COLUMNS " + getColumns(columns);
    }

    public static String createDatabase(boolean ifNotExists, String databaseName) {
        return "CREATE DATABASE " + getIfNotExists(ifNotExists) + " " + databaseName;
    }

    private static String getPartitionKey(List<String> columns) {
        String sql = "";
        if (columns != null && columns.size() != 0) {
            sql = "\n PARTITION (";
            if (columns != null && columns.size() != 0) {
                for (int i = 0; i < columns.size(); i++) {
                    sql += (i == 0 ? columns.get(i) : ", " + columns.get(i));
                }
            }
            sql += ")";
        }
        return sql;
    }

    private static String getWhere(List<WhereProperty> whereProperties) {
        String sql = "";
        String name = null;
        String value = null;
        DataType type = null;
        Operator operator = null;
        int count = 0;
        if (whereProperties != null && whereProperties.size() != 0) {
            for (WhereProperty whereProperty : whereProperties) {
                name = whereProperty.getName();
                value = whereProperty.getValue();
                type = whereProperty.getType();
                operator = whereProperty.getOperator();
                if (StringUtils.isBlank(name) || StringUtils.isBlank(value) || operator == null) {
                    continue;
                }
                sql += (count == 0 ? "\n WHERE " : " AND ");
                sql += name + SqlUtil.getCondition(value, type, operator);
                count++;
            }
        }
        return sql;
    }

    private static String getWhere(String alias, List<WhereProperty> whereProperties) {
        String sql = "";
        String name = null;
        String value = null;
        DataType type = null;
        Operator operator = null;
        int count = 0;
        if (whereProperties != null && whereProperties.size() != 0) {
            for (WhereProperty whereProperty : whereProperties) {
                name = whereProperty.getName();
                value = whereProperty.getValue();
                type = whereProperty.getType();
                operator = whereProperty.getOperator();
                if (StringUtils.isBlank(name) || StringUtils.isBlank(value) || operator == null)
                    continue;
                sql += (count == 0 ? "\n WHERE " : " AND ");
                sql += alias + "." + name + SqlUtil.getCondition(value, type, operator);
                count++;
            }
        }
        return sql;
    }

    private static String getSelectColumns(List<String> columns) {
        String sql = " * ";
        if (columns != null && columns.size() != 0) {
            sql = "";
            for (int i = 0; i < columns.size(); i++) {
                String name = columns.get(i);
                sql += (i == 0 ? "" : ",");
                sql += StringUtils.isBlank(name) ? "NULL" : name;
            }
        }
        return sql;
    }

    private static String getSelectColumns(String alias, List<String> columns) {
        String sql = " " + alias + ".* ";
        if (columns != null && columns.size() != 0) {
            sql = "";
            for (int i = 0; i < columns.size(); i++) {
                String name = columns.get(i);
                sql += (i == 0 ? "" : ",");
                sql += (StringUtils.isBlank(name) || "NULL".equalsIgnoreCase(name)) ? "NULL" : alias + "." + name;
            }
        }
        return sql;
    }

    private static String getOverwrite(boolean isOverwrite) {
        String sql = " INTO";
        if (isOverwrite) {
            sql = " OVERWRITE";
        }
        return sql;
    }

    private static String getStoredBy(String storageHandlerClass) {
        return "\n STORED BY '" + storageHandlerClass + "'";
    }

    private static String getSerDeProperties(List<SerDeProperty> serDeProperties) {
        String sql = "";
        SerDeProperty property = null;
        if (serDeProperties != null && serDeProperties.size() != 0) {
            sql = "\n WITH SERDEPROPERTIES (";
            for (int i = 0; i < serDeProperties.size(); i++) {
                property = serDeProperties.get(i);
                sql += (i == 0 ? "\n" : "\n,");
                sql += "'" + property.getKey() + "' = '" + property.getValue() + "'";
            }
            sql += "\n)";
        }
        return sql;
    }

    private static String getTblProperties(List<TblProperty> tblPropertiess) {
        String sql = "";
        TblProperty property = null;
        if (tblPropertiess != null && tblPropertiess.size() != 0) {
            sql = "\n TBLPROPERTIES (";
            for (int i = 0; i < tblPropertiess.size(); i++) {
                property = tblPropertiess.get(i);
                sql += (i == 0 ? "\n" : "\n,");
                sql += "'" + property.getKey() + "' = '" + property.getValue() + "'";
            }
            sql += "\n)";
        }
        return sql;
    }

    private static String getFileFormat(String fileFormat) {
        String sql = "";
        if (fileFormat != null && !fileFormat.trim().equals("")) {
            sql = "\n STORED AS " + fileFormat;
        }
        return sql;
    }

    private static String getIfExists(boolean ifExists) {
        String sql = "";
        if (ifExists) {
            sql = " IF EXISTS";
        }
        return sql;
    }

    private static String getExternal(boolean isExternal) {
        String sql = "";
        if (isExternal) {
            sql = " EXTERNAL";
        }
        return sql;
    }

    private static String getIfNotExists(boolean ifNotExists) {
        String sql = "";
        if (ifNotExists) {
            sql = " IF NOT EXISTS";
        }
        return sql;
    }

    private static String getColumns(List<TableColumn> columns) {
        String sql = "";
        String colName = "";
        String dataType = "";
        String colComment = "";
        String length = "";
        int count = 0;
        if (columns != null && columns.size() != 0) {
            sql = "\n (";
            for (TableColumn column : columns) {
                colName = column.getColName();
                dataType = column.getDataType();
                colComment = column.getColComment();
                length = column.getLength();
                if (StringUtils.isBlank(colName) || StringUtils.isBlank(dataType))
                    continue;
                sql += (count == 0 ? "\n" : "\n,");
                sql += colName + " " + getColType(dataType, length);
                if (StringUtils.isNotBlank(colComment)) {
                    sql += " COMMENT '" + colComment + "'";
                }
                count++;
            }
            sql += "\n)";
        }
        return sql;
    }

    private static String getColType(String dataType, String length) {
        if (DataType.VARCHAR.getValue().equals(dataType)) {
            dataType = "VARCHAR(" + length + ")";
        } else if (DataType.CHAR.getValue().equals(dataType)) {
            dataType = "CHAR(" + length + ")";
        } else if (DataType.DECIMAL.getValue().equals(dataType)) {
            dataType = "DECIMAL(" + length + ")";
        }
        return dataType;
    }

    private static String getTableComment(String tableComment) {
        String sql = "";
        if (tableComment != null && !tableComment.trim().equals("")) {
            sql = "\n COMMENT '" + tableComment + "'";
        }
        return sql;
    }

    private static String getPartitions(List<TableColumn> partitions) {
        String sql = "";
        if (partitions != null && partitions.size() != 0) {
            sql = "\n PARTITIONED BY " + getColumns(partitions);
        }
        return sql;
    }

    private static String getRowFormat(RowFormat rowFormat) {
        String sql = "";
        if (rowFormat != null) {
            sql = "\n ROW FORMAT DELIMITED";
            String fieldsTerminated = rowFormat.getFieldsTerminated();
            String fieldsEscaped = rowFormat.getFieldsEscaped();
            String linesTerminated = rowFormat.getLinesTerminated();
            if (fieldsTerminated != null && !fieldsTerminated.trim().equals("")) {
                sql += " FIELDS TERMINATED BY '" + fieldsTerminated + "'";
                if (fieldsEscaped != null && !fieldsEscaped.trim().equals("")) {
                    sql += " ESCAPED BY '" + fieldsEscaped + "'";
                }
            }
            if (linesTerminated != null && !linesTerminated.trim().equals("")) {
                sql += " LINES TERMINATED BY '" + linesTerminated + "'";
            }
        }
        return sql;
    }
}
