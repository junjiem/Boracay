package com.hex.bigdata.udsp.im.converter.impl;

import com.hex.bigdata.metadata.db.ClientFactory;
import com.hex.bigdata.metadata.db.model.Column;
import com.hex.bigdata.metadata.db.util.AcquireType;
import com.hex.bigdata.metadata.db.util.DBType;
import com.hex.bigdata.udsp.common.constant.DataType;
import com.hex.bigdata.udsp.im.converter.RealtimeTargetConverter;
import com.hex.bigdata.udsp.im.converter.impl.util.OracleSqlUtil;
import com.hex.bigdata.udsp.im.converter.impl.wrapper.JdbcWrapper;
import com.hex.bigdata.udsp.im.converter.model.TableColumn;
import com.hex.bigdata.udsp.im.converter.model.ValueColumn;
import com.hex.bigdata.udsp.im.converter.model.WhereProperty;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by JunjieM on 2017-9-5.
 */
//@Component("com.hex.bigdata.udsp.im.converter.impl.OracleConverter")
public class OracleConverter extends JdbcWrapper implements RealtimeTargetConverter {
    private static Logger logger = LogManager.getLogger (OracleConverter.class);

    @Override
    protected List<String> createSchemaSqls(String tableName, List<TableColumn> columns, String tableComment) {
        List<String> sqls = new ArrayList<> ();
        String createTableSql = OracleSqlUtil.createTable (tableName, columns);
        if (StringUtils.isNotBlank (createTableSql)) sqls.add (createTableSql);
        String commentTableSql = OracleSqlUtil.commentTable (tableName, tableComment);
        if (StringUtils.isNotBlank (commentTableSql)) sqls.add (commentTableSql);
        List<String> commentColumnsSqls = OracleSqlUtil.commentColumns (tableName, columns);
        if (commentColumnsSqls != null && commentColumnsSqls.size () != 0) sqls.addAll (commentColumnsSqls);
        return sqls;
    }

    @Override
    protected String dropSchemaSql(String tableName) {
        return OracleSqlUtil.dropTable (tableName);
    }

    @Override
    protected List<String> addColumnSqls(String tableName, List<TableColumn> addColumns) {
        List<String> sqls = new ArrayList<> ();
        List<String> addColumnSqls = OracleSqlUtil.addColumns (tableName, addColumns);
        if (addColumnSqls != null && addColumnSqls.size () != 0) sqls.addAll (addColumnSqls);
        List<String> commentColumnsSqls = OracleSqlUtil.commentColumns (tableName, addColumns);
        if (commentColumnsSqls != null && commentColumnsSqls.size () != 0) sqls.addAll (commentColumnsSqls);
        return sqls;
    }

    @Override
    protected DataType getColType(String type) {
        switch (type.toUpperCase ()) {
            case "VARCHAR":
            case "VARCHAR2":
            case "NVARCHAR2":
                return DataType.VARCHAR;
            case "CLOB":
            case "LONG":
            case "BLOB":
                return DataType.STRING;
            case "NUMBER":
                return DataType.DECIMAL;
            case "CHAR":
            case "NCHAR":
                return DataType.CHAR;
            case "BINARY_FLOAT":
                return DataType.FLOAT;
            case "BINARY_DOUBLE":
                return DataType.DOUBLE;
            case "TIMESTAMP":
            case "TIMESTAMP(6)":
            case "DATE":
                return DataType.TIMESTAMP;
            default:
                return DataType.STRING;
        }
    }

    @Override
    protected List<Column> getColumns(Connection conn, String dbName, String tbName) throws SQLException {
        // Oracle通过JDBCAPI方式获取字段集合时库名和表名大小写敏感
        return ClientFactory.createMetaClient (AcquireType.JDBCAPI, DBType.ORACLE, conn)
                .getColumns (StringUtils.isBlank (dbName) ? dbName : dbName.toUpperCase (),
                        StringUtils.isBlank (tbName) ? tbName : tbName.toUpperCase ());
    }

    @Override
    protected String insertSql(String tableName, List<ValueColumn> valueColumns) {
        return OracleSqlUtil.insert (tableName, valueColumns);
    }

    @Override
    protected String updateSql(String tableName, List<ValueColumn> valueColumns, List<WhereProperty> whereProperties) {
        return OracleSqlUtil.update (tableName, valueColumns, whereProperties);
    }
}
