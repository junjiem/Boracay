package com.hex.bigdata.udsp.consumer.service;

import com.hex.bigdata.udsp.common.constant.*;
import com.hex.bigdata.udsp.common.service.InitParamService;
import com.hex.bigdata.udsp.common.util.DateUtil;
import com.hex.bigdata.udsp.common.util.JSONUtil;
import com.hex.bigdata.udsp.common.util.StatementUtil;
import com.hex.bigdata.udsp.common.util.UUIDUtil;
import com.hex.bigdata.udsp.consumer.model.ConsumeRequest;
import com.hex.bigdata.udsp.consumer.model.Request;
import com.hex.bigdata.udsp.consumer.model.Response;
import com.hex.bigdata.udsp.mc.model.McConsumeLog;
import com.hex.bigdata.udsp.mc.service.McConsumeLogService;
import com.hex.bigdata.udsp.rc.model.RcUserService;
import com.hex.bigdata.udsp.rc.service.AlarmService;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.sql.SQLException;

/**
 * Created by JunjieM on 2018-5-26.
 */
@Service
public class LoggingService {
    private static Logger logger = LogManager.getLogger (LoggingService.class);

    @Autowired
    private McConsumeLogService mcConsumeLogService;
    @Autowired
    private AlarmService alarmService;
    @Autowired
    private InitParamService initParamService;

    /**
     * 异常时写日志
     *
     * @param response
     * @param consumeRequest
     * @param bef
     * @param runBef
     * @param errorCode
     * @param message
     */
    public void writeResponseLog(Response response, ConsumeRequest consumeRequest, long bef, long runBef,
                                 ErrorCode errorCode, String message) {
        Request request = consumeRequest.getRequest ();
        String appType = "";
        String consumeId = "";
        String type = "";
        String udspUser = "";
        String serviceName = "";
        if (request != null) {
            appType = request.getAppType ();
            consumeId = request.getConsumeId ();
            type = request.getType ();
            udspUser = request.getUdspUser ();
            serviceName = request.getServiceName ();
        }

        long now = System.currentTimeMillis ();

        /*
         OLQ或OLQ_APP执行超时时，取消正在执行的SQL
         */
        if ((ServiceType.OLQ.getValue ().equalsIgnoreCase (appType) || ServiceType.OLQ_APP.getValue ().equals (appType))
                && ErrorCode.ERROR_000015 == errorCode && StringUtils.isNotBlank (consumeId)) {
            try {
                StatementUtil.cancel (consumeId);
            } catch (SQLException e) {
                message = "取消正在执行的SQL出错，错误信息：" + e.getMessage ();
            }
        }

        /*
         当等待/执行超时，发送报警信息
         */
        if (ErrorCode.ERROR_000014 == errorCode || ErrorCode.ERROR_000015 == errorCode) {
            RcUserService rcUserService = consumeRequest.getRcUserService ();
            if (rcUserService != null) {
                long timout = 0;
                if (ErrorCode.ERROR_000014 == errorCode) {
                    timout = ConsumerType.SYNC.getValue ().equalsIgnoreCase (type) ?
                            rcUserService.getMaxSyncExecuteTimeout () : rcUserService.getMaxAsyncExecuteTimeout ();
                } else {
                    long maxSyncWaitTimeout = rcUserService.getMaxSyncWaitTimeout () == 0 ?
                            initParamService.getMaxSyncWaitTimeout () : rcUserService.getMaxSyncWaitTimeout ();
                    long maxAsyncWaitTimeout = rcUserService.getMaxAsyncWaitTimeout () == 0 ?
                            initParamService.getMaxAsyncWaitTimeout () : rcUserService.getMaxAsyncWaitTimeout ();
                    timout = ConsumerType.SYNC.getValue ().equalsIgnoreCase (type) ?
                            maxSyncWaitTimeout : maxAsyncWaitTimeout;
                }
                String msg = udspUser + "用户"
                        + (ConsumerType.SYNC.getValue ().equalsIgnoreCase (type) ? "【同步】" : "【异步】")
                        + "方式执行" + serviceName + "服务"
                        + (ErrorCode.ERROR_000014 == errorCode ? "【等待】" : "【执行】")
                        + "超时，开始时间：" + DateUtil.getDateString (bef) + "，超时时间：" + timout + "秒"
                        + (runBef != 0 ? "，执行耗时：" + new BigDecimal ((float) (now - runBef) / 1000).setScale (2, BigDecimal.ROUND_HALF_UP).doubleValue () + "秒" : "")
                        + "，总耗时：" + new BigDecimal ((float) (now - bef) / 1000).setScale (2, BigDecimal.ROUND_HALF_UP).doubleValue () + "秒！";
                try {
                    alarmService.send (rcUserService, msg);
                } catch (Exception e) {
                    e.printStackTrace ();
                    message = "发送警报出错，错误信息：" + e.getMessage ();
                }
            }
        }

        if (StringUtils.isBlank (consumeId)) {
            consumeId = UUIDUtil.consumeId (JSONUtil.parseObj2JSON (request));
        }

        McConsumeLog mcConsumeLog = new McConsumeLog ();
        mcConsumeLog.setPkId (consumeId);
        mcConsumeLog.setErrorCode (errorCode.getValue ());
        mcConsumeLog.setMessage (message);
        if (bef != 0) {
            mcConsumeLog.setRequestStartTime (DateUtil.getDateString (bef));
            mcConsumeLog.setRequestEndTime (DateUtil.getDateString (now));
        }
        if (runBef != 0) {
            mcConsumeLog.setRunStartTime (DateUtil.getDateString (runBef));
            mcConsumeLog.setRunEndTime (DateUtil.getDateString (now));
        }

        if (response != null) {
            response.setStatus (Status.DEFEAT.getValue ());
            response.setStatusCode (StatusCode.DEFEAT.getValue ());
            response.setErrorCode (errorCode.getValue ());
            response.setMessage (message);
            response.setConsumeTime (now - bef);
            response.setConsumeId (consumeId);
        }

        //日志信息入库
        writeLogToDb (request, mcConsumeLog, YesOrNo.NO.getValue ());
    }

    /**
     * 向数据库写消费日志
     *
     * @param request
     * @param mcConsumeLog
     * @param status
     */
    @Deprecated
    public void writeLogToDb(Request request, McConsumeLog mcConsumeLog, String status) {
        writeLogToDb (request, mcConsumeLog, status, false);
    }

    /**
     * 向数据库写消费日志
     *
     * @param request
     * @param mcConsumeLog
     * @param status
     * @param isCache
     */
    public void writeLogToDb(Request request, McConsumeLog mcConsumeLog, String status, boolean isCache) {
        if (request != null) {
            //同步/异步
            if (StringUtils.isNotBlank (request.getType ())) {
                mcConsumeLog.setSyncType (request.getType ().toUpperCase ());
            }
            //服务名称
            if (StringUtils.isNotBlank (request.getServiceName ())) {
                mcConsumeLog.setServiceName (request.getServiceName ());
            }
            //用户名称
            if (StringUtils.isNotBlank (request.getUdspUser ())) {
                mcConsumeLog.setUserName (request.getUdspUser ());
            }
            //请求类型
            if (StringUtils.isNotBlank (request.getRequestType ())) {
                mcConsumeLog.setRequestType (request.getRequestType ());
            }
            //设置应用类型
            if (StringUtils.isNotBlank (request.getAppType ())) {
                mcConsumeLog.setAppType (request.getAppType ().toUpperCase ());
            }
            //设置应用名称
            if (StringUtils.isNotBlank (request.getAppName ())) {
                mcConsumeLog.setAppName (request.getAppName ());
            }
            mcConsumeLog.setRequestContent (JSONUtil.parseObj2JSON (request));
        }
        //设置是否从缓存获取结果数据
        mcConsumeLog.setIsCache (isCache ? "0" : "1");
        //设置结果状态(0：成功 1：失败)
        mcConsumeLog.setStatus (status);
        mcConsumeLogService.insert (mcConsumeLog);
    }

    /**
     * 非异常时写日志
     *
     * @param bef
     * @param runBef
     * @param request
     * @param response
     * @param isCache
     */
    public void writeResponseLog(Request request, Response response, long bef, long runBef, boolean isCache) {
        long now = System.currentTimeMillis ();
        McConsumeLog mcConsumeLog = new McConsumeLog ();
        mcConsumeLog.setPkId (request.getConsumeId ());
        if (bef != 0) {
            mcConsumeLog.setRequestStartTime (DateUtil.getDateString (bef));
            mcConsumeLog.setRequestEndTime (DateUtil.getDateString (now));
        }
        if (runBef != 0) {
            mcConsumeLog.setRunStartTime (DateUtil.getDateString (runBef));
            mcConsumeLog.setRunEndTime (DateUtil.getDateString (now));
        }
        if (StringUtils.isNotBlank (response.getErrorCode ())) {
            mcConsumeLog.setErrorCode (response.getErrorCode ());
        } else if (Status.DEFEAT.getValue ().equals (response.getStatus ())) {
            mcConsumeLog.setErrorCode (ErrorCode.ERROR_000099.getValue ());
        }
        if (StringUtils.isNotBlank (response.getMessage ())) {
            mcConsumeLog.setMessage (response.getMessage ());
        }
        if (ConsumerType.SYNC.getValue ().equalsIgnoreCase (request.getType ())) {
            mcConsumeLog.setSyncType (request.getType ().toUpperCase ());
        } else {
            mcConsumeLog.setSyncType (request.getType ().toUpperCase ());
        }
        if (StringUtils.isNotBlank (response.getResponseContent ())) {
            mcConsumeLog.setResponseContent (response.getResponseContent ());
        }
        if (!isCache) { // 非从缓存中获取的结果数据才要写入接口耗时
            mcConsumeLog.setConsumeTime (response.getConsumeTime ());
        }
        if (Status.SUCCESS.getValue ().equals (response.getStatus ())
                || Status.RUNNING.getValue ().equals (response.getStatus ())) {
            writeLogToDb (request, mcConsumeLog, YesOrNo.YES.getValue (), isCache);
        } else {
            writeLogToDb (request, mcConsumeLog, YesOrNo.NO.getValue (), isCache);
        }
    }
}
