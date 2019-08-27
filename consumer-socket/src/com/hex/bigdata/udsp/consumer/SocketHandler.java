package com.hex.bigdata.udsp.consumer;

import com.hex.bigdata.udsp.common.api.model.Page;
import com.hex.bigdata.udsp.common.constant.*;
import com.hex.bigdata.udsp.common.util.JSONUtil;
import com.hex.bigdata.udsp.consumer.model.ConsumeRequest;
import com.hex.bigdata.udsp.consumer.model.Request;
import com.hex.bigdata.udsp.consumer.model.Response;
import com.hex.bigdata.udsp.consumer.service.ExternalConsumerService;
import com.hex.bigdata.udsp.consumer.service.LoggingService;
import com.hex.bigdata.udsp.consumer.util.Util;
import com.hex.bigdata.udsp.dsl.AppDslAdaptor;
import com.hex.bigdata.udsp.dsl.DslSqlAdaptor;
import com.hex.bigdata.udsp.dsl.parser.APPDSLParser;
import com.hex.bigdata.udsp.dsl.parser.DSLSQLParser;
import com.hex.goframe.util.WebApplicationContextUtil;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelFutureListener;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.util.CharsetUtil;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.net.InetSocketAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Netty Socket Server Handler
 */
public class SocketHandler extends SimpleChannelInboundHandler<ByteBuf> {
    private static Logger logger = Logger.getLogger (SocketHandler.class);

    private ExternalConsumerService consumerService;
    private LoggingService loggingService;

    public SocketHandler() {
        this.consumerService = (ExternalConsumerService) WebApplicationContextUtil.getBean ("externalConsumerService");
        this.loggingService = (LoggingService) WebApplicationContextUtil.getBean ("loggingService");
    }

    /**
     * 收到消息时，发送信息
     *
     * @param ctx
     * @param msg
     * @throws Exception
     */
    @Override
    protected void channelRead0(ChannelHandlerContext ctx, ByteBuf msg) throws Exception {
        InetSocketAddress insocket = (InetSocketAddress) ctx.channel ().remoteAddress ();
        String clientIp = insocket.getAddress ().getHostAddress ();

        // 接收数据
        byte[] reqByte = new byte[msg.readableBytes ()];
        msg.readBytes (reqByte);
        String reqJson = new String (reqByte, CharsetUtil.UTF_8);
        logger.debug ("接收报文内容:\n" + reqJson);

        // 消费
        String rsponse = consume (reqJson, clientIp);

        // 响应数据
        logger.debug ("响应报文内容:\n" + rsponse);
        byte[] rspByte = rsponse.getBytes (CharsetUtil.UTF_8);
        if (rspByte.length > 0) {
            ByteBuf buf = ctx.alloc ().buffer (rspByte.length);
            buf.writeBytes (rspByte);
            ctx.writeAndFlush (buf).addListener (generateDataGenerator);
        }
    }

    /**
     * 执行消费
     *
     * @param json
     * @param ip
     * @return
     */
    private String consume(String json, String ip) {
        Response response = new Response ();
        long bef = System.currentTimeMillis ();
        Request request = null;
        try {
            request = Util.jsonToRequest (json);
            request.setRequestType (RequestType.OUTER.getValue ());
            request.setRequestIp (ip);
            String sql = request.getSql ();
            if (StringUtils.isBlank (request.getServiceName ())
                    && StringUtils.isNotBlank (sql)) { // 针对IQ模块的应用提供自定义SQL语法服务
                logger.debug ("DSL: " + sql);
                DSLSQLParser parser = DslSqlAdaptor.getDSLSQLParser (sql);
                DSLSQLParser.StatementContext context = parser.statement ();
                ParseTree parse = context.getChild (0);
                if (parse instanceof DSLSQLParser.TestConnectionStatementContext) { // test connection
                    List<Map<String, String>> records = new ArrayList<> ();
                    Map<String, String> record = new HashMap<> ();
                    record.put ("name", "test connection");
                    records.add (record);
                    response.setRecords (records);
                    response.setStatusCode (StatusCode.SUCCESS.getValue ());
                    response.setStatus (Status.SUCCESS.getValue ());
                } else if (parse instanceof DSLSQLParser.SelectStatementContext) { // select ...
                    logger.debug ("select ...");
                    DSLSQLParser.SelectStatementContext selectStatementContext = (DSLSQLParser.SelectStatementContext) parse;
                    String serviceName = DslSqlAdaptor.selectStatementContextToFirstServiceName (selectStatementContext);
                    logger.debug ("serviceName:" + serviceName);
                    request.setServiceName (serviceName); // 设置serviceName
                    String serviceType = consumerService.getServiceType (serviceName);
                    if (ServiceType.IQ_DSL.getValue ().equals (serviceType)) {
                        response = sdlSqlSelect (request); // 交互查询模块的元数据的自定义select SQL
                    } else if (ServiceType.IQ.getValue ().equals (serviceType)) {
                        response = appSdlSelect (request); // 交互查询模块的应用的自定义select SQL
                    } else {
                        throw new Exception (serviceName + "服务不存在或不支持自定义SQL");
                    }
                } else if (parse instanceof DSLSQLParser.ShowServicesStatementContext) { // show services
                    logger.debug ("show services");
                    DSLSQLParser.ShowServicesStatementContext showServicesStatementContext = (DSLSQLParser.ShowServicesStatementContext) parse;
                    String likeName = null;
                    if (showServicesStatementContext.LIKE () != null) {
                        likeName = DslSqlAdaptor.textLiteralContextToValue (showServicesStatementContext.textLiteral ());
                    }
                    response = consumerService.showServices (request.getUdspUser (), likeName);
                } else if (parse instanceof DSLSQLParser.DescribeServiceStatementContext) { // describe <service_name>
                    String serviceName = ((DSLSQLParser.DescribeServiceStatementContext) parse).serviceName ().getText ();
                    logger.debug ("describe " + serviceName);
                    response = consumerService.describeService (request.getUdspUser (), serviceName);
                } else if (parse instanceof DSLSQLParser.CleanCachesStatementContext) { // clean caches
                    DSLSQLParser.CleanCachesStatementContext cleanCachesStatementContext = (DSLSQLParser.CleanCachesStatementContext) parse;
                    if (cleanCachesStatementContext.serviceName () != null) { // clean caches <service_name>
                        String serviceName = cleanCachesStatementContext.serviceName ().getText ();
                        logger.debug ("clean caches " + serviceName);
                        response = consumerService.cleanCachesService (request.getUdspUser (), serviceName);
                    } else { // clean caches
                        logger.debug ("clean caches");
                        response = consumerService.cleanCaches (request.getUdspUser ());
                    }
                } else if (parse instanceof DSLSQLParser.ShowCachesStatementContext) { // show caches
                    DSLSQLParser.ShowCachesStatementContext showCachesStatementContext = (DSLSQLParser.ShowCachesStatementContext) parse;
                    if (showCachesStatementContext.serviceName () != null) { // show caches <service_name>
                        String serviceName = showCachesStatementContext.serviceName ().getText ();
                        logger.debug ("show caches "+serviceName);
                        response = consumerService.showCachesService (serviceName);
                    }else { // show caches
                        logger.debug ("show caches");
                        response = consumerService.showCaches ();
                    }
                } else {
                    throw new Exception ("不支持该SQL语句：" + sql);
                }
            } else { // 老的请求方式
                response = consumerService.consume (request);
            }
        } catch (Exception e) {
            e.printStackTrace ();
            loggingService.writeResponseLog (response, new ConsumeRequest (request), bef, 0, ErrorCode.ERROR_000005, e.toString ());
        }
        return JSONUtil.parseObj2JSON (response);
    }

    /**
     * 交互查询的自定义select SQL
     *
     * @param request
     * @return
     */
    private Response sdlSqlSelect(Request request) {
        return consumerService.consume (request);
    }

    /**
     * 交互查询应用的自定义select SQL
     *
     * @param request
     * @return
     */
    private Response appSdlSelect(Request request) {
        Response response = new Response ();
        String sql = request.getSql ();
        APPDSLParser parser = AppDslAdaptor.getAPPDSLParser (sql);
        APPDSLParser.SelectStatementContext selectStatementContext = parser.selectStatement ();
        // where
        APPDSLParser.WhereClauseContext whereClauseContext = selectStatementContext.whereClause ();
        if (whereClauseContext != null) {
            logger.debug ("whereClause:" + whereClauseContext.toStringTree (parser));
            Map<String, String> data = AppDslAdaptor.whereClauseContextToData (whereClauseContext);
            request.setData (data); // 设置请求参数
        }
        // limit
        APPDSLParser.LimitClauseContext limitClauseContext = selectStatementContext.limitClause ();
        if (limitClauseContext != null) {
            logger.debug ("limitClause:" + limitClauseContext.toStringTree (parser));
            Page page = AppDslAdaptor.limitClauseContextToPage (limitClauseContext);
            request.setPage (page); // 设置分页信息
        }
        // select
        APPDSLParser.SelectElementsContext selectElementsContext = selectStatementContext.selectElements ();
        if (selectElementsContext != null) {
            logger.debug ("selectElements:" + selectElementsContext.toStringTree (parser));
            if (selectElementsContext.star != null) {
                // 获取数据集
                response = consumerService.consume (request);
                if (!StatusCode.SUCCESS.getValue ().equals (response.getStatusCode ())) {
                    return response;
                }
            } else {
                // 获取总行数
                APPDSLParser.SelectElementContext selectElementContext = selectElementsContext.selectElement ();
                String alias = selectElementContext.functionCall ().aggregateWindowedFunction ().getText ();
                if (selectElementContext.AS () != null || selectElementContext.uid () != null) {
                    alias = selectElementContext.uid ().getText (); // AS别名
                }
                response = consumerService.consume (request);
                if (!StatusCode.SUCCESS.getValue ().equals (response.getStatusCode ())) {
                    return response;
                }
                long totalCount = response.getRecords ().size ();
                Page page = response.getPage ();
                if (page != null) {
                    totalCount = page.getTotalCount ();
                }
                List<Map<String, String>> records = new ArrayList<> ();
                Map<String, String> record = new HashMap<> ();
                record.put (alias, String.valueOf (totalCount));
                records.add (record);
                response.setRecords (records);
                response.setReturnColumns (null);
            }
        }
        return response;
    }

    /**
     * 发生异常关闭链路
     *
     * @param ctx
     * @param cause
     */
    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) {
        cause.printStackTrace ();
        ctx.close ();
    }

    /**
     * 建立连接时，发送消息
     *
     * @param ctx
     * @throws Exception
     */
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        logger.debug ("连接的客户端地址:" + ctx.channel ().remoteAddress ());
    }

    private final ChannelFutureListener generateDataGenerator = new ChannelFutureListener () {
        @Override
        public void operationComplete(ChannelFuture future) {
            if (!future.isSuccess ()) {
                future.cause ().printStackTrace ();
                future.channel ().close ();
            }
        }
    };
}
