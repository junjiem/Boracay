package com.hex.bigdata.udsp.consumer;

import com.hex.bigdata.udsp.common.constant.ErrorCode;
import com.hex.bigdata.udsp.common.constant.RequestType;
import com.hex.bigdata.udsp.common.util.FTPClientConfig;
import com.hex.bigdata.udsp.common.util.HostUtil;
import com.hex.bigdata.udsp.consumer.model.ConsumeRequest;
import com.hex.bigdata.udsp.consumer.model.Request;
import com.hex.bigdata.udsp.consumer.model.Response;
import com.hex.bigdata.udsp.consumer.service.ExternalConsumerService;
import com.hex.bigdata.udsp.consumer.service.LoggingService;
import com.hex.bigdata.udsp.consumer.util.Util;
import com.hex.goframe.controller.BaseController;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by JunjieM on 2018-6-20.
 */
@RequestMapping("/http")
@Controller
public class HttpConsumer extends BaseController {
    private static Logger logger = LogManager.getLogger(HttpConsumer.class);

    static {
        FTPClientConfig.loadConf("goframe/udsp/udsp.config.properties");
    }

    @Autowired
    private LoggingService loggingService;

    @Autowired
    private ExternalConsumerService consumerService;

    /**
     * 欢迎信息
     */
    @RequestMapping(value = {"/welcome"}, method = {RequestMethod.GET})
    @ResponseBody
    public String welcome() {
        return "Welcome to use UDSP consuming http service!";
    }

    /**
     * 外部请求
     * <p/>
     * 这里用json字符串作为请求参数是为了自己转换成Request，出错时把信息返回给请求方。
     */
    @RequestMapping(value = {"/consume"}, method = {RequestMethod.POST})
    @ResponseBody
    public Response consume(@RequestBody String json, HttpServletRequest httpServletRequest) {
        Response response = new Response();
        long bef = System.currentTimeMillis();
        Request request = null;
        try {
            request = Util.jsonToRequest(json);
            request.setRequestType (RequestType.OUTER.getValue ());
            request.setRequestIp(HostUtil.getRealRequestIp(httpServletRequest)); // 获取并设置客户端请求的IP
            response = consumerService.consume(request);
        } catch (Exception e) {
            e.printStackTrace();
            loggingService.writeResponseLog(response, new ConsumeRequest(request), bef, 0, ErrorCode.ERROR_000005, e.toString ());
        }
        return response;
    }
}
