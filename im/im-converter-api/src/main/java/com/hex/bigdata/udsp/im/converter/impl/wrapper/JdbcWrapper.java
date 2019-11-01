package com.hex.bigdata.udsp.im.converter.impl.wrapper;

import com.hex.bigdata.metadata.db.model.Column;
import com.hex.bigdata.udsp.common.api.model.Datasource;
import com.hex.bigdata.udsp.common.constant.DataType;
import com.hex.bigdata.udsp.common.util.ExceptionUtil;
import com.hex.bigdata.udsp.im.constant.DatasourceType;
import com.hex.bigdata.udsp.im.converter.BatchSourceConverter;
import com.hex.bigdata.udsp.im.converter.BatchTargetConverter;
import com.hex.bigdata.udsp.im.converter.impl.model.HiveDatasource;
import com.hex.bigdata.udsp.im.converter.impl.model.JdbcDatasource;
import com.hex.bigdata.udsp.im.converter.impl.model.JdbcModel;
import com.hex.bigdata.udsp.im.converter.model.*;
import com.hex.bigdata.udsp.im.converter.impl.model.HiveMetadata;
import com.hex.bigdata.udsp.im.converter.impl.model.JdbcMetadata;
import com.hex.bigdata.udsp.im.converter.impl.util.*;
import com.hex.bigdata.udsp.im.converter.impl.util.JdbcUtil;
import com.hex.bigdata.udsp.im.converter.impl.util.SqlUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by JunjieM on 2017-9-7.
 */
public abstract class JdbcWrapper extends Wrapper implements BatchTargetConverter, BatchSourceConverter {
    private static Logger logger = LogManager.getLogger (JdbcWrapper.class);

    protected static final String HIVE_ENGINE_STORAGE_HANDLER_CLASS = "com.hex.hive.jdbc.JdbcStorageHandler";

    /**
     * 注：
     * 支持JDBC的数据源在创建表时我们不去创建复合主键和复合索引，
     * 请根据实际情况自行使用SQL语句创建合适的复合主键和复合索引。
     *
     * @param metadata
     * @throws Exception
     */
    @Override
    public void createSchema(Metadata metadata) throws Exception {
        JdbcDatasource jdbcDatasource = new JdbcDatasource (metadata.getDatasource ());
        String fullTbName = metadata.getTbName ();
        String tableComment = metadata.getDescribe ();
        List<TableColumn> columns = SqlUtil.convertToTableColumnList (metadata.getMetadataCols ());
        JdbcUtil.executeUpdate (jdbcDatasource, createSchemaSqls (fullTbName, columns, tableComment));
    }

    protected abstract List<String> createSchemaSqls(String tableName, List<TableColumn> columns, String tableComment);

    @Override
    public void dropSchema(Metadata metadata) throws Exception {
        JdbcDatasource jdbcDatasource = new JdbcDatasource (metadata.getDatasource ());
        String fullTbName = metadata.getTbName ();
        JdbcUtil.executeUpdate (jdbcDatasource, dropSchemaSql (fullTbName));
    }

    protected abstract String dropSchemaSql(String tableName);

    @Override
    public void addColumns(Metadata metadata, List<MetadataCol> addMetadataCols) throws Exception {
        if (addMetadataCols != null && addMetadataCols.size () != 0) {
            JdbcDatasource jdbcDatasource = new JdbcDatasource (metadata.getDatasource ());
            String fullTbName = metadata.getTbName ();
            List<TableColumn> addColumns = SqlUtil.convertToTableColumnList (addMetadataCols);
            JdbcUtil.executeUpdate (jdbcDatasource, addColumnSqls (fullTbName, addColumns));
        }
    }

    protected abstract List<String> addColumnSqls(String tableName, List<TableColumn> addColumns);

    @Override
    public List<MetadataCol> columnInfo(Model model) {
        Datasource datasource = model.getSourceDatasource ();
        JdbcDatasource jdbcDatasource = new JdbcDatasource (datasource);
        JdbcModel jdbcModel = new JdbcModel (model);
        return getColumnInfo (jdbcDatasource, jdbcModel);
    }

    @Override
    public List<MetadataCol> columnInfo(Metadata metadata) {
        JdbcDatasource jdbcDatasource = new JdbcDatasource (metadata.getDatasource ());
        String fullTbName = metadata.getTbName ();
        String[] strs = fullTbName.split (DATABASE_AND_TABLE_SEP_TRANS);
        String dbName = null;
        String tbName = null;
        if (strs.length == 1) {
            tbName = strs[0];
        } else if (strs.length == 2) {
            dbName = strs[0];
            tbName = strs[1];
        }
        return getMetadataCols (jdbcDatasource, dbName, tbName);
    }

    private List<MetadataCol> getMetadataCols(JdbcDatasource datasource, String dbName, String tbName) {
        List<MetadataCol> metadataCols = null;
        Connection conn = null;
        try {
            conn = JdbcUtil.getConnection (datasource);
            metadataCols = getMetadataCols (conn, dbName, tbName);
        } catch (SQLException e) {
            e.printStackTrace ();
            throw new RuntimeException ("获取字段信息失败！");
        } catch (Exception e) {
            e.printStackTrace ();
            throw new RuntimeException (e.getMessage ());
        } finally {
            com.hex.bigdata.metadata.db.util.JdbcUtil.close (conn);
        }
        return metadataCols;
    }

    private List<MetadataCol> getColumnInfo(JdbcDatasource datasource, JdbcModel model) {
        String dbName = model.gainDatabaseName ();
        String tbName = model.gainTableName ();
        String selectSql = model.gainSelectSql ();
        if (StringUtils.isNotBlank (selectSql)) {
            selectSql = "SELECT * FROM (" + selectSql + ") UDSP_VIEW WHERE 1=0";
            return getMetadataCols (datasource, selectSql);
        } else {
            return getMetadataCols (datasource, dbName, tbName);
        }
    }

    private List<MetadataCol> getMetadataCols(JdbcDatasource datasource, String querySql) {
        List<MetadataCol> metadataCols = null;
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = JdbcUtil.getConnection (datasource);
            stmt = conn.createStatement ();
            rs = stmt.executeQuery (querySql);
            ResultSetMetaData md = rs.getMetaData ();
            int columnCount = md.getColumnCount ();
            metadataCols = new ArrayList<> ();
            if (columnCount >= 1) {
                for (int i = 1; i <= columnCount; i++) {
                    metadataCols.add (getMetadataCol (md, i));
                }
            }
        } catch (SQLException e) {
            logger.warn (ExceptionUtil.getMessage (e));
        } finally {
            com.hex.bigdata.metadata.db.util.JdbcUtil.close (rs);
            com.hex.bigdata.metadata.db.util.JdbcUtil.close (stmt);
            com.hex.bigdata.metadata.db.util.JdbcUtil.close (conn);
        }
        return metadataCols;
    }

    /**
     * 创建源引擎Schema
     *
     * @param model
     * @throws Exception
     */
    @Override
    public void createSourceEngineSchema(Model model) throws Exception {
        Datasource sDs = model.getSourceDatasource ();
        String sDsId = sDs.getId ();
        Datasource eDs = model.getEngineDatasource ();
        String eDsId = eDs.getId ();
        if (!sDsId.equals (eDsId)) { // 源、引擎的数据源不相同

            // 查询表名
            String tableName = null;
            JdbcModel jdbcModel = new JdbcModel (model);
            String dbName = jdbcModel.gainDatabaseName ();
            String tbName = jdbcModel.gainTableName ();
            String selectSql = jdbcModel.gainSelectSql ();
            if (StringUtils.isNotBlank (dbName) && StringUtils.isNotBlank (tbName)) {
                tableName = dbName + DATABASE_AND_TABLE_SEP + tbName;
            } else if (StringUtils.isBlank (dbName) && StringUtils.isNotBlank (tbName)) {
                tableName = tbName;
            } else if (StringUtils.isBlank (tbName) && StringUtils.isBlank (selectSql)) {
                throw new Exception ("配置参数table.name和select.sql不能都为空");
            }

            // 查询SQL
            String inputQuery = null;
            if (StringUtils.isNotBlank (selectSql)) {
                inputQuery = selectSql;
            }

            // 引擎表名
            String engineSchemaName = getSourceTableName (model.getId ());

            createSourceEngineSchema (model, engineSchemaName, tableName, inputQuery);
        }
    }

    /**
     * 创建源引擎Schema（只针对非暴力查询模式时使用）
     *
     * @param model
     * @param engineSchemaName
     * @throws Exception
     */
    @Override
    public void createSourceEngineSchema(Model model, String engineSchemaName) throws Exception {
        // 查询表名
        String tableName = null;
        JdbcModel jdbcModel = new JdbcModel (model);
        String dbName = jdbcModel.gainDatabaseName ();
        String tbName = jdbcModel.gainTableName ();
        String selectSql = jdbcModel.gainSelectSql ();
        if (StringUtils.isNotBlank (dbName) && StringUtils.isNotBlank (tbName)) {
            tableName = dbName + DATABASE_AND_TABLE_SEP + tbName;
        } else if (StringUtils.isBlank (dbName) && StringUtils.isNotBlank (tbName)) {
            tableName = tbName;
        } else if (StringUtils.isBlank (tbName) && StringUtils.isBlank (selectSql)) {
            throw new Exception ("配置参数table.name和select.sql不能都为空");
        }

        // 动态SQL
        String inputQuery = null;
        Metadata metadata = model.getTargetMetadata ();
        List<ModelMapping> modelMappings = model.getModelMappings ();
        List<String> selectColumns = getSelectColumns (modelMappings, metadata);
        List<WhereProperty> whereProperties = getWhereProperties (model.getModelFilterCols ());
        if (StringUtils.isNotBlank (selectSql)) {
            inputQuery = SqlUtil.select2 (selectColumns, selectSql, whereProperties);
        } else {
            inputQuery = SqlUtil.select (selectColumns, tableName, whereProperties);
        }

        createSourceEngineSchema (model, engineSchemaName, tableName, inputQuery);
    }

    private void createSourceEngineSchema(Model model, String engineSchemaName, String tableName, String inputQuery) throws Exception {
        Datasource sDs = model.getSourceDatasource ();
        JdbcDatasource jdbcDatasource = new JdbcDatasource (sDs);
        Datasource eDs = model.getEngineDatasource ();
        HiveDatasource hiveDatasource = new HiveDatasource (eDs);
        String sql = HiveSqlUtil.createStorageHandlerTable (true, true, engineSchemaName,
                getSourceColumns (model.getModelMappings ()), "源的Hive引擎表", null,
                HIVE_ENGINE_STORAGE_HANDLER_CLASS, null, getTblProperties (jdbcDatasource, tableName, inputQuery));
        JdbcUtil.createEngineSchema (hiveDatasource, HIVE_ENGINE_DATABASE_NAME, sql);
    }

    @Override
    public boolean testDatasource(Datasource datasource) {
        boolean canConnection = false;
        Connection conn = null;
        try {
            conn = JdbcUtil.getConnection (new JdbcDatasource (datasource));
            if (conn != null && !conn.isClosed ()) {
                canConnection = true;
            }
        } catch (Exception e) {
            e.printStackTrace ();
        } finally {
            com.hex.bigdata.metadata.db.util.JdbcUtil.close (conn);
        }
        return canConnection;
    }

    @Override
    public void createTargetEngineSchema(Model model) throws Exception {
        Datasource eDs = model.getEngineDatasource ();
        String eDsId = eDs.getId ();
        Metadata metadata = model.getTargetMetadata ();
        Datasource tDs = metadata.getDatasource ();
        String tDsId = tDs.getId ();
        String tDsType = tDs.getType ();
        if (!tDsId.equals (eDsId)) { // 目标、引擎的数据源不相同
            if (DatasourceType.HIVE.getValue ().equals (tDsType)) { // 目标是Hive数据源
                /*
                可以把数据插入目标，但是有编码问题还会有碎文件的问题。
                 */
                throw new Exception ("目标是HIVE类型时必须与引擎是同一个数据源");
            }
            HiveDatasource eHiveDs = new HiveDatasource (model.getEngineDatasource ());
            String id = model.getId ();
            HiveMetadata hiveMetadata = new HiveMetadata (metadata);
            String fullTbName = hiveMetadata.getTbName ();
            String tableName = getTargetTableName (id);
            JdbcDatasource jdbcDatasource = new JdbcDatasource (metadata.getDatasource ());
            String sql = HiveSqlUtil.createStorageHandlerTable (true, true, tableName,
                    getTargetColumns (model.getModelMappings ()), "目标的Hive引擎表", null,
                    HIVE_ENGINE_STORAGE_HANDLER_CLASS, null, getTblProperties (jdbcDatasource, fullTbName, null));
            JdbcUtil.executeUpdate (eHiveDs, sql);
        }
    }

    private List<TableColumn> getTargetColumns(List<ModelMapping> modelMappings) {
        List<TableColumn> columns = new ArrayList<> ();
        for (ModelMapping mapping : modelMappings) {
            MetadataCol metadataCol = mapping.getMetadataCol ();
            String dataType = getDataType (metadataCol.getType (), metadataCol.getLength ());
            columns.add (new TableColumn (metadataCol.getName (), dataType, metadataCol.getDescribe ()));
        }
        return columns;
    }

    private List<TableColumn> getSourceColumns(List<ModelMapping> modelMappings) {
        List<TableColumn> columns = new ArrayList<> ();
        for (ModelMapping mapping : modelMappings) {
            String dataType = getDataType (mapping.getType (), mapping.getLength ());
            columns.add (new TableColumn (mapping.getName (), dataType, mapping.getDescribe ()));
        }
        return columns;
    }

    private List<TblProperty> getTblProperties(JdbcDatasource datasource, String tableName, String inputQuery) {
        List<TblProperty> tblProperties = new ArrayList<> ();
        tblProperties.add (new TblProperty ("mapred.jdbc.driver.class", datasource.gainDriverClass ()));
        tblProperties.add (new TblProperty ("mapred.jdbc.url", datasource.gainJdbcUrl ()));
        if (StringUtils.isNotBlank (datasource.gainUsername ())) {
            tblProperties.add (new TblProperty ("mapred.jdbc.username", datasource.gainUsername ()));
        }
        if (StringUtils.isNotBlank (datasource.gainPassword ())) {
            tblProperties.add (new TblProperty ("mapred.jdbc.password", datasource.gainPassword ()));
        }
        if (StringUtils.isNotBlank (tableName)) {
            tblProperties.add (new TblProperty ("mapred.jdbc.input.table.name", tableName));
        }
        if (StringUtils.isNotBlank (inputQuery)) {
            inputQuery = inputQuery.replaceAll ("'", "\\\\'");
            tblProperties.add (new TblProperty ("mapred.jdbc.input.query", inputQuery)); // SQL查询语句
        }
        if (StringUtils.isNotBlank (tableName)) {
            tblProperties.add (new TblProperty ("mapred.jdbc.output.table.name", tableName));
        }
        tblProperties.add (new TblProperty ("mapred.jdbc.hive.lazy.split", "false")); // 是否懒分割。false：根据MAP数生成多个查询；true：默认只生成一个查询。
        tblProperties.add (new TblProperty ("jdbc.storage.handler.input.fetch.size", "1024")); // 批量大小
        return tblProperties;
    }

    protected MetadataCol getMetadataCol(ResultSetMetaData md, int i) throws SQLException {
        String columnLabel = md.getColumnLabel (i);
        String columnTypeName = md.getColumnTypeName (i);
        int precision = 0;
        try {
            precision = md.getPrecision (i);
        } catch (SQLException e) {
            precision = 0;
        }
        int scale = 0;
        try {
            scale = md.getScale (i);
        } catch (SQLException e) {
            scale = 0;
        }
        if (columnLabel.contains (".")) {
            columnLabel = columnLabel.split ("\\.")[1];
        }
        String colLength = "";
        if (scale == 0 && precision > 0) {
            colLength = String.valueOf (precision);
        } else if (scale > 0 && precision > 0 && scale <= precision) {
            colLength = String.valueOf (precision) + "," + String.valueOf (scale);
        }
        MetadataCol mdCol = new MetadataCol ();
        mdCol.setSeq ((short) i);
        mdCol.setName (columnLabel);
        mdCol.setType (getColType (columnTypeName));
        mdCol.setLength (colLength);
        mdCol.setPrimary (false);
        mdCol.setIndexed (false);
        mdCol.setStored (true);
        return mdCol;
    }

    protected abstract DataType getColType(String type);

    protected List<MetadataCol> getMetadataCols(Connection conn, String dbName, String tbName) throws SQLException {
        List<Column> columns = getColumns (conn, dbName, tbName);
        if (columns == null) {
            return null;
        }
        List<MetadataCol> mdCols = new ArrayList<> ();
        MetadataCol mdCol = null;
        for (Column col : columns) {
            mdCol = new MetadataCol ();
            mdCol.setSeq ((short) col.getSeq ());
            mdCol.setName (col.getName ());
            mdCol.setDescribe (col.getComment ());
            mdCol.setType (getColType (col.getType ()));
            mdCol.setLength (col.getLength ());
            mdCol.setPrimary (col.getPrimaryKeyN () > 0);
            mdCol.setIndexed (col.getPrimaryKeyN () > 0);
            mdCol.setStored (true);
            mdCols.add (mdCol);
        }
        return mdCols;
    }

    protected abstract List<Column> getColumns(Connection conn, String dbName, String tbName) throws SQLException;

    @Override
    protected List<String> getSelectColumns(List<ModelMapping> modelMappings, Metadata metadata) {
        if (modelMappings == null || modelMappings.size () == 0) {
            return null;
        }
        List<String> selectColumns = new ArrayList<> ();
        for (ModelMapping mapping : modelMappings) {
            selectColumns.add (mapping.getName ());
        }
        return selectColumns;
    }

    @Override
    public boolean checkSchema(Metadata metadata) throws SQLException {
        JdbcDatasource datasource = new JdbcDatasource (metadata.getDatasource ());
        String tbName = metadata.getTbName ();
        String sql = "select 1 from " + tbName;
        Connection conn = null;
        Statement stmt = null;
        boolean exists = true;
        try {
            conn = JdbcUtil.getConnection (datasource);
            stmt = conn.createStatement ();
            stmt.executeQuery (sql);
        } catch (Exception e) {
            logger.warn (ExceptionUtil.getMessage (e));
            if (e.getMessage ().indexOf ("doesn't exist") != -1 // mysql
                    || e.getMessage ().indexOf ("does not exist") != -1 // mysql
                    || e.getMessage ().indexOf ("ORA-00942") != -1 // oracle
                    || e.getMessage ().indexOf ("Table not found") != -1 // hive
                    || e.getMessage ().indexOf ("Could not resolve table reference") != -1 // impala
                    || e.getMessage ().indexOf ("Table undefined") != -1 // phoenix
                    ) {
                exists = false;
            }
        } finally {
            com.hex.bigdata.metadata.db.util.JdbcUtil.close (stmt);
            com.hex.bigdata.metadata.db.util.JdbcUtil.close (conn);
        }
        return exists;
    }

    @Override
    public void emptyDatas(Metadata metadata) throws Exception {
        JdbcDatasource jdbcDatasource = new JdbcDatasource (metadata.getDatasource ());
        JdbcMetadata jdbcMetadata = new JdbcMetadata (metadata);
        String tableName = jdbcMetadata.getTbName ();
        String updateSql = SqlUtil.truncateTable (tableName);
        JdbcUtil.executeUpdate (jdbcDatasource, updateSql);
    }

    @Override
    protected void insertInto(Metadata metadata, List<ModelMapping> modelMappings, List<ValueColumn> valueColumns) throws Exception {
        JdbcDatasource jdbcDatasource = new JdbcDatasource (metadata.getDatasource ());
        JdbcUtil.executeUpdate (jdbcDatasource, insertSql (metadata.getTbName (), valueColumns));
    }

    protected abstract String insertSql(String tableName, List<ValueColumn> valueColumns);

    @Override
    protected void updateInsert(Metadata metadata, List<ModelMapping> modelMappings, List<ValueColumn> valueColumns, List<WhereProperty> whereProperties) throws Exception {
        JdbcDatasource jdbcDatasource = new JdbcDatasource (metadata.getDatasource ());
        if (JdbcUtil.executeUpdate (jdbcDatasource, updateSql (metadata.getTbName (), valueColumns, whereProperties)) == 0) {
            JdbcUtil.executeUpdate (jdbcDatasource, insertSql (metadata.getTbName (), valueColumns));
        }
    }

    protected abstract String updateSql(String tableName, List<ValueColumn> valueColumns, List<WhereProperty> whereProperties);

    @Override
    protected void matchingUpdate(Metadata metadata, List<ModelMapping> modelMappings, List<ValueColumn> valueColumns, List<WhereProperty> whereProperties) throws Exception {
        JdbcDatasource jdbcDatasource = new JdbcDatasource (metadata.getDatasource ());
        JdbcUtil.executeUpdate (jdbcDatasource, updateSql (metadata.getTbName (), valueColumns, whereProperties));
    }
}
