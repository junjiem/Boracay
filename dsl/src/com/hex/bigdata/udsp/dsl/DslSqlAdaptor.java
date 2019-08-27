package com.hex.bigdata.udsp.dsl;

import com.hex.bigdata.udsp.dsl.constant.ColumnType;
import com.hex.bigdata.udsp.dsl.constant.ComparisonOperator;
import com.hex.bigdata.udsp.dsl.constant.LogicalOperator;
import com.hex.bigdata.udsp.dsl.constant.OrderExpression;
import com.hex.bigdata.udsp.dsl.model.*;
import com.hex.bigdata.udsp.dsl.parser.DSLSQLLexer;
import com.hex.bigdata.udsp.dsl.parser.DSLSQLParser;
import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.ParserRuleContext;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.*;

/**
 * DSLSQL的适配器
 */
public class DslSqlAdaptor {
    private static Logger logger = LogManager.getLogger (DslSqlAdaptor.class);

    private static final String ALTERNATIVE = "subSelectSql";

    /**
     * 获取DSLSQLParser
     *
     * @param sql
     * @return
     * @throws RuntimeException
     */
    public static DSLSQLParser getDSLSQLParser(String sql) throws RuntimeException {
        // 新建一个输入流，从标准输入读取数据
        ANTLRInputStream input = new ANTLRInputStream (sql);
        // 新建一个词法分析器，处理输入的字符流
        DSLSQLLexer lexer = new DSLSQLLexer (input);
        lexer.addErrorListener (DescriptiveErrorListener.INSTANCE); // 设置错误处理的监听类
        // 新建一个词法符号的缓冲区，用于储存词法分析器将生成的词法符号
        CommonTokenStream tokens = new CommonTokenStream (lexer);
        // 新建一个语法分析器，处理词法符号缓冲区中的内容
        DSLSQLParser parser = new DSLSQLParser (tokens);
//        parser.setErrorHandler(new BailErrorStrategy ()); // 设置错误处理的策略类
        parser.addErrorListener (DescriptiveErrorListener.INSTANCE); // 设置错误处理的监听类
        return parser;
    }

    /**
     * 获取真实的文本，包含空格、指标符和换行符
     *
     * @param sql
     * @param context
     * @return
     */
    public static String getText(String sql, ParserRuleContext context) {
        int startIndex = context.getStart ().getStartIndex ();
        int stopIndex = context.getStop ().getStopIndex ();
        return sql.substring (startIndex, stopIndex + 1);
    }

    /**
     * SQL字符串解析成对象
     *
     * @param sql SQL语法
     * @return
     */
    public static DslSelectSql sqlToObject(String sql) {
        DSLSQLParser parser = DslSqlAdaptor.getDSLSQLParser (sql);
        DSLSQLParser.SelectStatementContext selectStatementContext = parser.selectStatement ();
        logger.info ("dsl: " + getText (sql, selectStatementContext));
        List<ParserRuleContext> contexts = lowestParserRuleContexts (selectStatementContext);
        // 升序排序
        Collections.sort (contexts, new Comparator<ParserRuleContext> () {
            @Override
            public int compare(ParserRuleContext obj1, ParserRuleContext obj2) {
                Integer index1 = obj1.getStart ().getStartIndex ();
                Integer index2 = obj2.getStart ().getStartIndex ();
                return index1.compareTo (index2);
            }
        });
        List<DslSql> dslSqls = parserRuleContextsToJoinDslSqls (sql, contexts);
        // 封装DslSelectSql
        DslSelectSql dslSelectSql = new DslSelectSql ();
        dslSelectSql.setDslSqls (dslSqls);
        dslSelectSql.setSourceSql (sql);
        String fakeSql = fakeSqlToRealSql (sql, contexts);
        logger.info ("fakeSql: " + fakeSql);
        dslSelectSql.setFakeSql (fakeSql);
        return dslSelectSql;
    }

    private static List<DslSql> parserRuleContextsToJoinDslSqls(String sql, List<ParserRuleContext> parserRuleContexts) {
        if (parserRuleContexts == null || parserRuleContexts.size () == 0) {
            return null;
        }
        List<DslSql> dslSqls = new ArrayList<> ();
        for (int i = 0; i < parserRuleContexts.size (); i++) {
            ParserRuleContext parserRuleContext = parserRuleContexts.get (i);
            DslSql dslSql = parserRuleContextToDslSql (sql, parserRuleContext);
            dslSqls.add (dslSql);
        }
        return dslSqls;
    }

    /**
     * parserRuleContext转DslSql
     *
     * @param sql
     * @param parserRuleContext
     * @return
     */
    private static DslSql parserRuleContextToDslSql(String sql, ParserRuleContext parserRuleContext) {
        if (parserRuleContext == null) {
            return null;
        }
        if (parserRuleContext instanceof DSLSQLParser.ServiceNameContext) {
            DSLSQLParser.ServiceNameContext serviceNameContext = (DSLSQLParser.ServiceNameContext) parserRuleContext;
            return new DslSql (serviceNameContext.getText ());
        } else if (parserRuleContext instanceof DSLSQLParser.SelectStatementContext) {
            DSLSQLParser.SelectStatementContext selectStatementContext = (DSLSQLParser.SelectStatementContext) parserRuleContext;
            // serviceName
            DSLSQLParser.ServiceNameContext serviceNameContext = selectStatementContext.subSelectStatement ().serviceName ();
            String serviceName = serviceNameContext.getText ();
            // select
            String select = null;
            DSLSQLParser.SelectElementsContext selectElementsContext = selectStatementContext.selectElements ();
            if (selectElementsContext != null) {
                select = getText (sql, selectElementsContext);
            }
            // where
            Component where = null;
            DSLSQLParser.WhereClauseContext whereClauseContext = selectStatementContext.whereClause ();
            if (whereClauseContext != null) {
                DSLSQLParser.LogicExpressionsContext logicExpressionsContext = whereClauseContext.logicExpressions ();
                where = DslSqlAdaptor.logicExpressionsContextToComponent (logicExpressionsContext);
            }
            // group by
            List<String> groupBy = null;
            DSLSQLParser.GroupByCaluseContext groupByCaluseContext = selectStatementContext.groupByCaluse ();
            if (groupByCaluseContext != null) {
                groupBy = DslSqlAdaptor.groupByCaluseContextToGroupBy (groupByCaluseContext);
            }
            // order by
            List<Order> orderBy = null;
            DSLSQLParser.OrderByClauseContext orderByClauseContext = selectStatementContext.orderByClause ();
            if (orderByClauseContext != null) {
                orderBy = DslSqlAdaptor.orderByClauseContextToOrderBy (orderByClauseContext);
            }
            // limit
            Limit limit = null;
            DSLSQLParser.LimitClauseContext limitClauseContext = selectStatementContext.limitClause ();
            if (limitClauseContext != null) {
                limit = DslSqlAdaptor.limitClauseContextToLimit (limitClauseContext);
            }
            // 封装DslSql
            DslSql dslSql = new DslSql ();
            dslSql.setName (serviceName);
            dslSql.setSelect (select);
            dslSql.setWhere (where);
            dslSql.setGroupBy (groupBy);
            dslSql.setOrderBy (orderBy);
            dslSql.setLimit (limit);
            return dslSql;
        }
        return null;
    }

    /**
     * 生成真实的SQL
     *
     * @param sql
     * @param contexts
     * @return
     */
    private static String fakeSqlToRealSql(String sql, List<ParserRuleContext> contexts) {
        if (contexts == null || contexts.size () == 0) {
            return sql;
        }
        String str = "";
        int index = 0;
        int startIndex = 0;
        int stopIndex = 0;
        String fakeSqlPrefix = "";
        String fakeSqlSuffix = "";
        for (int i = 0; i < contexts.size (); i++) {
            ParserRuleContext ruleContext = contexts.get (i);
            startIndex = ruleContext.getStart ().getStartIndex ();
            stopIndex = ruleContext.getStop ().getStopIndex ();
            fakeSqlPrefix = sql.substring (index, startIndex);
            fakeSqlSuffix = sql.substring (stopIndex + 1);
            str += fakeSqlPrefix + "${" + ALTERNATIVE + i + "}";
            index = stopIndex + 1;
        }
        str += fakeSqlSuffix;
        return str;
    }

    /**
     * 获取服务名称
     *
     * @param parserRuleContext
     * @return
     */
    private static String getServiceName(ParserRuleContext parserRuleContext) {
        if (parserRuleContext == null) {
            return null;
        }
        if (parserRuleContext instanceof DSLSQLParser.SelectStatementContext) {
            DSLSQLParser.SelectStatementContext selectStatementContext = (DSLSQLParser.SelectStatementContext) parserRuleContext;
            return selectStatementContext.subSelectStatement ().serviceName ().getText ();
        } else if (parserRuleContext instanceof DSLSQLParser.ServiceNameContext) {
            DSLSQLParser.ServiceNameContext serviceNameContext = (DSLSQLParser.ServiceNameContext) parserRuleContext;
            return serviceNameContext.getText ();
        }
        return null;
    }

    /**
     * 递归得到List<ParserRuleContext>对象（DSLSQLParser.SelectStatementContext 或 DSLSQLParser.ServiceNameContext）
     *
     * @param selectStatementContext
     * @return
     */
    private static List<ParserRuleContext> lowestParserRuleContexts(DSLSQLParser.SelectStatementContext selectStatementContext) {
        if (selectStatementContext == null) {
            return null;
        }
        List<ParserRuleContext> parserRuleContexts = new ArrayList<> ();
        DSLSQLParser.SubSelectStatementContext subSelectStatementContext = selectStatementContext.subSelectStatement ();
        if (subSelectStatementContext != null) {
            if (subSelectStatementContext.serviceName () != null) {
                if (selectStatementContext.joinCaluse () == null) {
                    parserRuleContexts.add (selectStatementContext);
                } else {
                    parserRuleContexts.add (subSelectStatementContext.serviceName ());
                }
            } else {
                DSLSQLParser.SelectStatementContext selectStatementContext1 = subSelectStatementContext.selectStatement ();
                parserRuleContexts.addAll (lowestParserRuleContexts (selectStatementContext1));
            }
        }
        DSLSQLParser.JoinCaluseContext joinCaluseContext = selectStatementContext.joinCaluse ();
        if (joinCaluseContext != null) {
            List<DSLSQLParser.JoinElementContext> joinElementContexts = joinCaluseContext.joinElement ();
            for (DSLSQLParser.JoinElementContext joinElementContext : joinElementContexts) {
                DSLSQLParser.SubSelectStatementContext subSelectStatementContext1 = joinElementContext.subSelectStatement ();
                if (subSelectStatementContext1.serviceName () != null) {
                    parserRuleContexts.add (subSelectStatementContext1.serviceName ());
                } else {
                    parserRuleContexts.addAll (lowestParserRuleContexts (subSelectStatementContext1.selectStatement ()));
                }
            }
        }
        return parserRuleContexts;
    }

    /**
     * 递归得到第一个服务名称
     *
     * @param selectStatementContext
     * @return
     */
    public static String selectStatementContextToFirstServiceName(DSLSQLParser.SelectStatementContext selectStatementContext) {
        if (selectStatementContext == null) {
            return null;
        }
        DSLSQLParser.SubSelectStatementContext subSelectStatementContext = selectStatementContext.subSelectStatement ();
        if (subSelectStatementContext.serviceName () != null) {
            return subSelectStatementContext.serviceName ().getText ();
        }
        return selectStatementContextToFirstServiceName (subSelectStatementContext.selectStatement ());
    }

    private static String textLiteralToValue(String textLiteral) {
        return textLiteral.substring (1, textLiteral.length () - 1); // 去除首尾的单引号
    }

    public static String textLiteralContextToValue(DSLSQLParser.TextLiteralContext textLiteralContext) {
        return textLiteralToValue (textLiteralContext.getText ());
    }

    private static String valueContextToValue(DSLSQLParser.ValueContext valueContext) {
        String value = null;
        DSLSQLParser.TextLiteralContext textLiteralContext = valueContext.textLiteral ();
        if (textLiteralContext != null) {
            value = textLiteralContextToValue (textLiteralContext);
        } else {
            value = valueContext.decimalLiteral ().getText ();
        }
        return value;
    }

    private static ColumnType valueContextToColumnType(DSLSQLParser.ValueContext valueContext) {
        DSLSQLParser.TextLiteralContext textLiteralContext = valueContext.textLiteral ();
        if (textLiteralContext != null) {
            return ColumnType.STRING;
        } else {
            return ColumnType.NUMBER;
        }
    }

    private static ComparisonOperator transComparisonOperator(String operator) {
        operator = operator.toUpperCase ();
        ComparisonOperator comparison = ComparisonOperator.EQ;
        if (ComparisonOperator.EQ.getValue ().equals (operator)) {
            comparison = ComparisonOperator.EQ;
        } else if (ComparisonOperator.NE.getValue ().equals (operator)) {
            comparison = ComparisonOperator.NE;
        } else if (ComparisonOperator.NE2.getValue ().equals (operator)) {
            comparison = ComparisonOperator.NE2;
        } else if (ComparisonOperator.GE.getValue ().equals (operator)) {
            comparison = ComparisonOperator.GE;
        } else if (ComparisonOperator.LE.getValue ().equals (operator)) {
            comparison = ComparisonOperator.LE;
        } else if (ComparisonOperator.GT.getValue ().equals (operator)) {
            comparison = ComparisonOperator.GT;
        } else if (ComparisonOperator.LT.getValue ().equals (operator)) {
            comparison = ComparisonOperator.LT;
        } else if (ComparisonOperator.IN.getValue ().equals (operator)) {
            comparison = ComparisonOperator.IN;
        } else if (ComparisonOperator.NOT_IN.getValue ().equals (operator)) {
            comparison = ComparisonOperator.NOT_IN;
        } else if (ComparisonOperator.LIKE.getValue ().equals (operator)) {
            comparison = ComparisonOperator.LIKE;
        } else if (ComparisonOperator.NOT_LIKE.getValue ().equals (operator)) {
            comparison = ComparisonOperator.NOT_LIKE;
        } else if (ComparisonOperator.BETWEEN_AND.getValue ().equals (operator)) {
            comparison = ComparisonOperator.BETWEEN_AND;
        } else if (ComparisonOperator.IS_NULL.getValue ().equals (operator)) {
            comparison = ComparisonOperator.IS_NULL;
        } else if (ComparisonOperator.IS_NOT_NULL.getValue ().equals (operator)) {
            comparison = ComparisonOperator.IS_NOT_NULL;
        }
        return comparison;
    }

    private static OrderExpression transOrderExpression(String order) {
        OrderExpression expression = OrderExpression.ASC;
        if (OrderExpression.DESC.getValue ().equals (order)) {
            expression = OrderExpression.DESC;
        }
        return expression;
    }

    /**
     * DSLSQLParser.LogicExpressionsContext 转 Component
     *
     * @param logicExpressionsContext
     * @return
     */
    private static Component logicExpressionsContextToComponent(DSLSQLParser.LogicExpressionsContext logicExpressionsContext) {
        int count = logicExpressionsContext.getChildCount ();
        // 拆分OR逻辑操作
        Map<Integer, Integer> map = new HashMap<> ();
        int startIndex = 0;
        int endIndex = 0;
        for (int i = 0; i < count; i++) {
            if (i % 2 == 1) { // 逻辑操作符
                DSLSQLParser.LogicalOperatorContext logicalOperatorContext = (DSLSQLParser.LogicalOperatorContext) logicExpressionsContext.getChild (i);
                if (logicalOperatorContext.OR () != null) {
                    endIndex = i - 1;
                    map.put (startIndex, endIndex);
                    startIndex = i + 1;
                }
            }
        }
        map.put (startIndex, count - 1);
        // 处理每个拆分的逻辑操作
        List<Component> components = new ArrayList<> ();
        for (Map.Entry<Integer, Integer> entry : map.entrySet ()) {
            Component component = logicExpressionsContextToComponent (logicExpressionsContext, entry.getKey (), entry.getValue ());
            components.add (component);
        }
        if (components.size () == 1) {
            return components.get (0);
        } else {
            return new Composite (LogicalOperator.OR, components);
        }
    }

    private static Component logicExpressionsContextToComponent(DSLSQLParser.LogicExpressionsContext logicExpressionsContext, int startIndex, int endIndex) {
        List<Component> components = new ArrayList<> ();
        for (int i = startIndex; i <= endIndex; i++) {
            if (i % 2 == 0) { // 逻辑操作
                DSLSQLParser.LogicExpressionContext logicExpressionContext = (DSLSQLParser.LogicExpressionContext) logicExpressionsContext.getChild (i);
                Component component = logicExpressionContextToComponent (logicExpressionContext);
                components.add (component);
            }
        }
        if (components.size () == 1) {
            return components.get (0);
        } else {
            return new Composite (LogicalOperator.AND, components);
        }
    }

    /**
     * DSLSQLParser.LogicExpressionContext 转 Component
     *
     * @param logicExpressionContext
     * @return
     */
    private static Component logicExpressionContextToComponent(DSLSQLParser.LogicExpressionContext logicExpressionContext) {
        DSLSQLParser.LogicExpressionsContext logicExpressionsContext = logicExpressionContext.logicExpressions ();
        if (logicExpressionsContext != null) { // '(' logicExpressions ')'
            return logicExpressionsContextToComponent (logicExpressionsContext);
        } else { // 非'(' logicExpressions ')'
            List<String> values = new ArrayList<> ();
            DSLSQLParser.FullColumnNameContext fullColumnNameContext = logicExpressionContext.fullColumnName ();
            if (fullColumnNameContext != null) { // fullColumnName BETWEEN value AND value | fullColumnName NOT? IN '(' value (',' value)*  ')' | fullColumnName IS NOT? NULL
                String name = fullColumnNameContext.columnName ().getText (); // columnName
                List<DSLSQLParser.ValueContext> valueContexts = logicExpressionContext.value (); // values
                if (logicExpressionContext.BETWEEN () != null && logicExpressionContext.AND () != null) {// fullColumnName BETWEEN value AND value
                    DSLSQLParser.ValueContext startValueContext = valueContexts.get (0);
                    DSLSQLParser.ValueContext endValueContext = valueContexts.get (1);
                    values.add (valueContextToValue (startValueContext));
                    values.add (valueContextToValue (endValueContext));
                    ColumnType columnType = valueContextToColumnType (startValueContext);
                    return new Dimension (name, ComparisonOperator.BETWEEN_AND, columnType, values);
                } else if (logicExpressionContext.IN () != null) {// fullColumnName NOT? IN '(' value (',' value)*  ')'
                    ComparisonOperator comparison = null;
                    if (logicExpressionContext.NOT () != null) { // NOT IN
                        comparison = ComparisonOperator.NOT_IN;
                    } else { // IN
                        comparison = ComparisonOperator.IN;
                    }
                    for (DSLSQLParser.ValueContext valueContext : valueContexts) {
                        values.add (valueContextToValue (valueContext));
                    }
                    ColumnType columnType = valueContextToColumnType (valueContexts.get (0));
                    return new Dimension (name, comparison, columnType, values);
                } else if (logicExpressionContext.IS () != null && logicExpressionContext.NULL () != null) { // fullColumnName IS NOT? NULL
                    ComparisonOperator comparison = null;
                    if (logicExpressionContext.NOT () != null) { // IS NOT NULL
                        comparison = ComparisonOperator.IS_NOT_NULL;
                    } else { // IS NULL
                        comparison = ComparisonOperator.IS_NULL;
                    }
                    return new Dimension (name, comparison);
                }
            } else { // logicExpressionCal comparisonOperator logicExpressionCal
                List<DSLSQLParser.LogicExpressionCalContext> logicExpressionCalContexts = logicExpressionContext.logicExpressionCal ();
                DSLSQLParser.LogicExpressionCalContext logicExpressionCalContext1 = logicExpressionCalContexts.get (0);
                DSLSQLParser.LogicExpressionCalContext logicExpressionCalContext2 = logicExpressionCalContexts.get (1);
                if (logicExpressionCalContext1.fullColumnName () != null && logicExpressionCalContext2.value () != null) {
                    // fullColumnName comparisonOperator value
                    String name = logicExpressionCalContext1.fullColumnName ().columnName ().getText ();
                    String operator = logicExpressionContext.comparisonOperator ().getText ();
                    ComparisonOperator comparison = transComparisonOperator (operator);
                    DSLSQLParser.ValueContext valueContext = logicExpressionCalContext2.value ();
                    values.add (valueContextToValue (valueContext));
                    ColumnType columnType = valueContextToColumnType (valueContext);
                    return new Dimension (name, comparison, columnType, values);
                } else if (logicExpressionCalContext2.fullColumnName () != null && logicExpressionCalContext1.value () != null) {
                    // value comparisonOperator fullColumnName
                    String name = logicExpressionCalContext2.fullColumnName ().columnName ().getText ();
                    String operator = logicExpressionContext.comparisonOperator ().getText ();
                    ComparisonOperator comparison = transComparisonOperator (operator);
                    DSLSQLParser.ValueContext valueContext = logicExpressionCalContext1.value ();
                    values.add (valueContextToValue (valueContext));
                    ColumnType columnType = valueContextToColumnType (valueContext);
                    return new Dimension (name, comparison, columnType, values);
                }
            }
        }
        return null;
    }

    private static Limit limitClauseContextToLimit(DSLSQLParser.LimitClauseContext limitClauseContext) {
        int offset = 0;
        int limit = 1;
        DSLSQLParser.DecimalLiteralContext limitContext = limitClauseContext.limit;
        DSLSQLParser.DecimalLiteralContext offsetContext = limitClauseContext.offset;
        if (limitContext != null) {
            limit = Integer.valueOf (limitContext.getText ());
        }
        if (offsetContext != null) {
            offset = Integer.valueOf (offsetContext.getText ());
        }
        return new Limit (limit, offset);
    }

    private static List<String> groupByCaluseContextToGroupBy(DSLSQLParser.GroupByCaluseContext groupByCaluseContext) {
        List<String> list = new ArrayList<> ();
        List<DSLSQLParser.GroupByItemContext> groupByItemContexts = groupByCaluseContext.groupByItem ();
        for (DSLSQLParser.GroupByItemContext groupByItemContext : groupByItemContexts) {
            list.add (groupByItemContext.fullColumnName ().columnName ().getText ());
        }
        return list;
    }

    private static List<Order> orderByClauseContextToOrderBy(DSLSQLParser.OrderByClauseContext orderByClauseContext) {
        List<Order> list = new ArrayList<> ();
        List<DSLSQLParser.OrderByExpressionContext> orderByExpressionContexts = orderByClauseContext.orderByExpression ();
        for (DSLSQLParser.OrderByExpressionContext orderByExpressionContext : orderByExpressionContexts) {
            String name = orderByExpressionContext.fullColumnName ().columnName ().getText ();
            OrderExpression expression = OrderExpression.ASC;
            if (orderByExpressionContext.order != null) {
                expression = transOrderExpression (orderByExpressionContext.order.getText ());
            }
            list.add (new Order (name, expression));
        }
        return list;
    }

    /**
     * 对象解析成SQL字符串
     *
     * @param dslSelectSql
     * @return
     */
    public static String objectToSql(DslSelectSql dslSelectSql) {
        String fakeSql = dslSelectSql.getFakeSql ();
        logger.info ("fakeSql: " + fakeSql);
        String sql = fakeSql;
        List<DslSql> dslSqls = dslSelectSql.getDslSqls ();
        if (dslSqls != null && dslSqls.size () != 0) {
            for (int i = 0; i < dslSqls.size (); i++) {
                DslSql dslSql = dslSqls.get (i);
                String subSql = dslSqlToSql (dslSql);
                logger.info ("subSql: " + subSql);
                sql = sql.replace ("${" + ALTERNATIVE + i + "}", subSql);
            }
        }
        logger.info ("sql: " + sql);
        return sql;
    }

    private static String dslSqlToSql(DslSql dslSql) {
        return selectToStatement (dslSql.getSelect ())
                + dslSql.getName ()
                + whereToStatement (dslSql.getWhere ())
                + groupByToStatement (dslSql.getGroupBy ())
                + orderByToStatement (dslSql.getOrderBy ())
                + limitToStatement (dslSql.getLimit ());
    }

    private static String selectToStatement(String select) {
        if (StringUtils.isBlank (select)) {
            return "";
        }
        return "SELECT " + select + " FROM ";
    }

    private static String orderByToStatement(List<Order> orderBy) {
        if (orderBy == null || orderBy.size () == 0) {
            return "";
        }
        String str = " ORDER BY ";
        for (int i = 0, l = orderBy.size (); i < l; i++) {
            str += (i == 0 ? "" : ", ") + orderToStatement (orderBy.get (i));
        }
        return str;
    }

    private static String orderToStatement(Order order) {
        String str = order.getName ();
        OrderExpression orderExp = order.getOrderExp ();
        if (orderExp != null) {
            str = getOrderExp (orderExp, str);
        }
        return str;
    }

    private static String getOrderExp(OrderExpression orderExp, String column) {
        switch (orderExp.getValue ()) {
            case "DESC":
                return column + " DESC";
            default:
                return column + " ASC";
        }
    }

    private static String groupByToStatement(List<String> groupBy) {
        if (groupBy == null || groupBy.size () == 0) {
            return "";
        }
        String str = " GROUP BY ";
        for (int i = 0, l = groupBy.size (); i < l; i++) {
            str += (i == 0 ? "" : ", ") + groupBy.get (i);
        }
        return str;
    }

    private static String whereToStatement(Component where) {
        if (where == null) {
            return "";
        }
        return " WHERE " + componentToStatement (where);
    }

    /**
     * 递归解析Component
     *
     * @param component
     * @return
     */
    public static String componentToStatement(Component component) {
        if (component == null) {
            return "";
        }
        if (component instanceof Dimension) {
            return dimensionToStatement ((Dimension) component);
        } else if (component instanceof Composite) {
            Composite composite = (Composite) component;
            LogicalOperator logiOper = composite.getLogiOper ();
            String str = "(";
            List<Component> components = composite.getComponents ();
            for (int i = 0, l = components.size (); i < l; i++) {
                str += (i == 0 ? "" : " " + logiOper.getValue () + " ");
                str += componentToStatement (components.get (i));
            }
            str += ")";
            return str;
        }
        return null;
    }

    private static String dimensionToStatement(Dimension dimension) {
        String columnName = dimension.getColumnName ();
        ComparisonOperator compOper = dimension.getCompOper ();
        List<String> values = getValues (dimension.getColumnType (), dimension.getValues ());
        switch (compOper.getValue ()) {
            case "=":
            case "!=":
            case "<>":
            case ">":
            case "<":
            case ">=":
            case "<=":
            case "LIKE":
            case "NOT LIKE":
                return (values == null || values.size () == 0) ? "1 = 1" :
                        columnName + " " + compOper.getValue () + " " + values.get (0);
            case "BETWEEN AND":
                return (values == null || values.size () < 2) ? "1 = 1" :
                        "(" + columnName + " >= " + values.get (0) + " AND " + columnName + " <= " + values.get (1) + ")";
            case "IN":
            case "NOT IN":
                return (values == null || values.size () == 0) ? "1 = 1" :
                        columnName + " " + compOper.getValue () + " (" + StringUtils.join (values, ",") + ")";
            case "IS NULL":
            case "IS NOT NULL":
                return columnName + " " + compOper.getValue ();
        }
        return null;
    }

    private static List<String> getValues(ColumnType columnType, List<String> values) {
        List<String> newValues = new ArrayList<> ();
        for (String value : values) {
            newValues.add (getValue (columnType, value));
        }
        return newValues;
    }

    private static String getValue(ColumnType columnType, String value) {
        switch (columnType.getValue ()) {
            case "STRING":
                return "'" + value + "'";
            default:
                return value;
        }
    }

    private static String limitToStatement(Limit limit) {
        if (limit == null || limit.getLimit () == 0) {
            return "";
        }
        String str = " LIMIT " + limit.getLimit ();
        if (limit.getOffset () > 0) {
            str += " OFFSET " + limit.getOffset ();
        }
        return str;
    }

}
