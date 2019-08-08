package com.hex.bigdata.udsp.demo;

import com.hex.bigdata.udsp.client.factory.ConsumerClientFactory;
import com.hex.bigdata.udsp.client.impl.OlqAppClient;
import com.hex.bigdata.udsp.common.api.model.Page;
import com.hex.bigdata.udsp.common.constant.ConsumerEntity;
import com.hex.bigdata.udsp.common.constant.ConsumerType;
import com.hex.bigdata.udsp.common.constant.StatusCode;
import com.hex.bigdata.udsp.model.request.OlqAppRequest;
import com.hex.bigdata.udsp.model.request.StatusRequest;
import com.hex.bigdata.udsp.model.response.AsyncPackResponse;
import com.hex.bigdata.udsp.model.response.StatusPackResponse;
import com.hex.bigdata.udsp.model.response.SyncPackResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 联机查询应用调用示例
 *
 */
@Deprecated
public class OlqAppClientDemo {

    /**
     * 日志记录
     */
    private static Logger logger = LogManager.getLogger(OlqAppClientDemo.class);

    /**
     * 交互查询/联机查询应用-同步start接口示例
     */
    public void syncStart() {
        //创建自定义客户端
//        String url = "http://127.0.0.1:8088/udsp/http/consume";
//        OlqAppClient client = ConsumerClientFactory.createCustomClient(OlqAppClient.class, url);
        //创建默认客户端,根据udsp.config.properties配置文件获取地址
        OlqAppClient client = ConsumerClientFactory.createCustomClient(OlqAppClient.class);

        //创建请求实体
        OlqAppRequest request = new OlqAppRequest();

        //基础参数
        request.setServiceName("message");
        //基础参数设置-上层应用系统使用者工号
        request.setAppUser("10940");
        //基础参数设置-设置调用start接口
        request.setEntity(ConsumerEntity.START.getValue());
        //基础参数设置-设置同步调用，同步调用为sync，异步调用为async
        request.setType(ConsumerType.SYNC.getValue());
        //基础参数设置-设置UDSP校验用户信息，用户名及token，用户校验信息需UDSP下发
        request.setUdspUser("test");
        request.setToken("000000");

        //设置业务参数-查询参数设置
        Map<String, String> data = new HashMap<>();
        data.put("client_no", "1113829408");
        request.setData(data);

        //设置业务参数-分页参数设置
        Page page = new Page();
        page.setPageSize(300);
        page.setPageIndex(1);
        request.setPage(page);

        //调用并获取结果
        SyncPackResponse response = client.syncStart(request);

        // 拆包响应对象
        if (response == null) {
            logger.error("客户端异常");
        } else {
            if (StatusCode.SUCCESS == response.getStatusCode()) {
                // 分页信息
                page = response.getPage();
                if (page != null) {
                    logger.debug("当前页号：" + page.getPageIndex());
                    logger.debug("当前页条数：" + page.getPageSize());
                    logger.debug("总条数：" + page.getTotalCount());
                    logger.debug("总页数：" + page.getTotalPage());
                }
                // 耗时
                logger.debug("耗时：" + response.getConsumeTime());
                // 消费ID
                logger.debug("消费ID：" + response.getConsumeId());
                // 字段信息
                LinkedHashMap<String, String> returnColumns = response.getReturnColumns();
                for (Map.Entry<String, String> entry : returnColumns.entrySet()) {
                    logger.debug("名称：" + entry.getKey() + "，类型：" + entry.getValue());
                }
                // 数据信息
                List<Map<String, String>> records = response.getRecords();
                for (Map<String, String> record : records) {
                    for (Map.Entry<String, String> entry : record.entrySet()) {
                        logger.debug("名称：" + entry.getKey() + "，值：" + entry.getValue());
                    }
                }
            } else {
                logger.error("状态：" + response.getStatus());
                logger.error("状态码：" + response.getStatusCode());
                logger.error("错误码：" + response.getErrorCode());
                logger.error("错误信息：" + response.getMessage());
            }
        }

    }

    /**
     * 交互查询/联机查询应用-异步start接口示例
     */
    public void asyncStart() {
        //创建自定义客户端
//        String url = "http://127.0.0.1:8088/udsp/http/consume";
//        OlqAppClient client = ConsumerClientFactory.createCustomClient(OlqAppClient.class, url);
        //创建默认客户端,根据udsp.config.properties配置文件获取地址
        OlqAppClient client = ConsumerClientFactory.createCustomClient(OlqAppClient.class);

        //创建请求实体
        OlqAppRequest request = new OlqAppRequest();
        //基础参数设置-设置调用服务的名称
        request.setServiceName("soa_jyls_app");
        //基础参数设置-上层应用系统使用者工号
        request.setAppUser("100940");
        //基础参数设置-设置调用start接口
        request.setEntity(ConsumerEntity.START.getValue());
        //基础参数设置-设置异步调用，同步调用为sync，异步调用为async
        request.setType(ConsumerType.ASYNC.getValue());

        //基础参数设置-设置UDSP校验用户信息，用户名及token，用户校验信息需UDSP下发
        request.setUdspUser("test");
        request.setToken("000000");

        //设置业务参数-查询参数设置
        Map<String, String> data = new HashMap<>();
        data.put("client_no", "1113829408");
        request.setData(data);

        //设置业务参数-分页参数设置
        Page page = new Page();
        page.setPageSize(300);
        page.setPageIndex(1);
        request.setPage(page);

        //调用并获取结果
        AsyncPackResponse response = client.asyncStart(request);

        // 拆包响应对象
        if (response == null) {
            logger.error("客户端异常");
        } else {
            if (StatusCode.SUCCESS == response.getStatusCode()) {
                // 耗时
                logger.debug("耗时：" + response.getConsumeTime());
                // 消费ID
                logger.debug("消费ID：" + response.getConsumeId());
                // 生成文件的FTP路径
                logger.debug("生成文件的FTP路径：" + response.getResponseContent());
                /**
                 * 成功说明异步任务已经调起
                 */
                // 可以继续循环执行查看状态的操作
            } else {
                logger.error("状态：" + response.getStatus());
                logger.error("状态码：" + response.getStatusCode());
                logger.error("错误码：" + response.getErrorCode());
                logger.error("错误信息：" + response.getMessage());
            }
        }
    }

    /**
     * 交互查询/联机查询应用-异步status接口示例
     */
    public void asyncStatus() {
        //创建自定义客户端
//        String url = "http://127.0.0.1:8088/udsp/http/consume";
//        OlqAppClient client = ConsumerClientFactory.createCustomClient(OlqAppClient.class, url);
        //创建默认客户端,根据udsp.config.properties配置文件获取地址
        OlqAppClient client = ConsumerClientFactory.createCustomClient(OlqAppClient.class);

        //创建请求实体
        StatusRequest request = new StatusRequest();
        //基础参数设置-设置调用服务的名称
        request.setServiceName("soa_jyls_app");
        //基础参数设置-上层应用系统使用者工号
        request.setAppUser("10940");
        //基础参数设置-设置调用status接口，查看任务状态
        request.setEntity(ConsumerEntity.STATUS.getValue());
        //基础参数设置-设置异步调用，同步调用为sync，异步调用为async
        request.setType(ConsumerType.ASYNC.getValue());
        //基础参数设置-设置UDSP校验用户信息，用户名及token，用户校验信息需UDSP下发
        request.setUdspUser("test");
        request.setToken("000000");

        //设置业务参数-消费id
        request.setConsumeId("955a0c14a55ebe727ff45f20939dfc97");

        //调用并获取结果
        StatusPackResponse response = client.asyncStatus(request);

        // 拆包响应对象
        if (response == null) {
            logger.error("客户端异常");
        } else {
            if (StatusCode.SUCCESS == response.getStatusCode()) {
                logger.info("异步消费完成");
                // 可以继续执行FTP下载文件的操作
            }
            if (StatusCode.RUNNING == response.getStatusCode()) {
                logger.info("异步消费正在执行");
                // 可以继续执行查看状态的操作
            } else {
                logger.error("状态：" + response.getStatus());
                logger.error("状态码：" + response.getStatusCode());
                logger.error("错误码：" + response.getErrorCode());
                logger.error("错误信息：" + response.getMessage());
            }
        }
    }

    public static void main(String[] args) {
        OlqAppClientDemo demo = new OlqAppClientDemo();
        demo.asyncStart();
        demo.asyncStatus();
        demo.syncStart();
    }
}
