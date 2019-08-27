package com.hex.bigdata.udsp.consumer.service;

import com.hex.bigdata.udsp.common.constant.ErrorCode;
import com.hex.bigdata.udsp.common.constant.ServiceStatus;
import com.hex.bigdata.udsp.common.constant.ServiceType;
import com.hex.bigdata.udsp.consumer.model.ConsumeRequest;
import com.hex.bigdata.udsp.consumer.model.Request;
import com.hex.bigdata.udsp.consumer.model.Response;
import com.hex.bigdata.udsp.consumer.util.Util;
import com.hex.bigdata.udsp.dsl.DslSqlAdaptor;
import com.hex.bigdata.udsp.dsl.model.DslSelectSql;
import com.hex.bigdata.udsp.dsl.model.DslSql;
import com.hex.bigdata.udsp.iq.provider.model.dsl.IqDslResponse;
import com.hex.bigdata.udsp.iq.service.IqProviderService;
import com.hex.bigdata.udsp.rc.model.RcService;
import com.hex.bigdata.udsp.rc.model.RcUserService;
import com.hex.bigdata.udsp.rc.service.RcServiceService;
import com.hex.bigdata.udsp.rc.service.RcUserServiceService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 同步交互查询自定义SQL的服务
 */
@Service
public class IqDslSyncService {

    private static Logger logger = LoggerFactory.getLogger (IqDslSyncService.class);

    private static final ExecutorService executorService = Executors.newCachedThreadPool (new ThreadFactory () {
        private AtomicInteger id = new AtomicInteger (0);

        @Override
        public Thread newThread(Runnable r) {
            Thread thread = new Thread (r);
            thread.setName ("iq-dsl-service-" + id.addAndGet (1));
            return thread;
        }
    });

    @Autowired
    private RcServiceService rcServiceService;
    @Autowired
    private RcUserServiceService rcUserServiceService;
    @Autowired
    private IqProviderService iqProviderService;
    @Autowired
    private LoggingService loggingService;

    /**
     * 运行（添加了超时机制）
     *
     * @param consumeRequest
     * @param bef
     * @return
     */
    public Response startForTimeout(ConsumeRequest consumeRequest, long bef) {
        long runBef = System.currentTimeMillis ();
        Response response = new Response ();
        try {
            Request request = consumeRequest.getRequest ();

            // 通过SQL解析成DslSelectSql
            final DslSelectSql dslSelectSql = DslSqlAdaptor.sqlToObject (request.getSql ());

            // 获取所有服务的元数据ID
            final Map<String, String> mdIds = getMdIds (dslSelectSql, request.getUdspUser ());

            RcUserService rcUserService = consumeRequest.getRcUserService ();
            if (rcUserService == null || rcUserService.getMaxSyncExecuteTimeout () == 0) { // 不开启超时
                response = run (mdIds, dslSelectSql);
            } else { // 开启一个新的线程，其内部执行交互查询任务，执行成功时或者执行超时时向下走
                Future<Response> futureTask = executorService.submit (new Callable () {
                    @Override
                    public Response call() throws Exception {
                        return run (mdIds, dslSelectSql);
                    }
                });
                response = futureTask.get (rcUserService.getMaxSyncExecuteTimeout (), TimeUnit.SECONDS);
            }
        } catch (TimeoutException e) {
            loggingService.writeResponseLog (response, consumeRequest, bef, runBef, ErrorCode.ERROR_000015, e.toString ());
        } catch (Exception e) {
            e.printStackTrace ();
            loggingService.writeResponseLog (response, consumeRequest, bef, runBef, ErrorCode.ERROR_000007, e.toString ());
        }
        return response;
    }

    /**
     * 运行
     *
     * @param mdIds
     * @param dslSelectSql
     * @return Response
     */
    public Response run(Map<String, String> mdIds, DslSelectSql dslSelectSql) {
        try {
            IqDslResponse iqDslResponse = iqProviderService.select (mdIds, dslSelectSql);
            Response response = new Response ();
            response.setStatus (iqDslResponse.getStatus ().getValue ());
            response.setStatusCode (iqDslResponse.getStatusCode ().getValue ());
            response.setRecords (iqDslResponse.getRecords ());
            response.setReturnColumns (iqDslResponse.getColumns ());
            response.setMessage (iqDslResponse.getMessage ());
            response.setConsumeTime (iqDslResponse.getConsumeTime ());
            return response;
        } catch (Exception e) {
            e.printStackTrace ();
            return Util.errorResponse (ErrorCode.ERROR_000007, e.toString ());
        }
    }

    private Map<String, String> getMdIds(DslSelectSql dslSelectSql, String udspUser) {
        Map<String, String> mdIds = new HashMap<> ();
        List<DslSql> dslSqls = dslSelectSql.getDslSqls ();
        if (dslSqls != null && dslSqls.size () != 0) {
            for (DslSql dslSql : dslSqls) {
                String serviceName = dslSql.getName ();
                RcService rcService = rcServiceService.selectByServiceName (serviceName);
                if (rcService == null) {
                    throw new RuntimeException (serviceName + "服务没有注册!");
                }
                if (ServiceStatus.STOP.getValue ().equals (rcService.getStatus ())) {
                    throw new RuntimeException (serviceName + "服务已经停用!");
                }
                String appType = rcService.getType ();
                if (!ServiceType.IQ.getValue ().equals (appType)
                        && !ServiceType.IQ_DSL.getValue ().equals (appType)) {
                    throw new RuntimeException (serviceName + "服务不支持自定义SQL!");
                }
                RcUserService rcUserService = rcUserServiceService.selectByUserIdAndServiceId (udspUser, rcService.getPkId ());
                if (rcUserService == null) {
                    throw new RuntimeException (serviceName + "服务没有授权给" + udspUser + "用户!");
                }
                String mdId = rcService.getAppId ();
                mdIds.put (serviceName, mdId);
            }
        }
        return mdIds;
    }

}
