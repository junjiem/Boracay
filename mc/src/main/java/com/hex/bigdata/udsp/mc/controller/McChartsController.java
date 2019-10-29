package com.hex.bigdata.udsp.mc.controller;

import com.hex.bigdata.udsp.mc.dto.McChartsView;
import com.hex.bigdata.udsp.mc.service.McChartsService;
import com.hex.goframe.controller.BaseController;
import com.hex.goframe.model.MessageResult;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.FastDateFormat;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.util.*;

/**
 * Created by PC on 2017/3/24.
 */
@RequestMapping("/mc/stats/charts")
@Controller
public class McChartsController extends BaseController {

    private static Logger logger = LogManager.getLogger (McChartsController.class);
    private static final FastDateFormat ymdhmsFormat = FastDateFormat.getInstance ("yyyy-MM-dd HH:mm:ss");
    private static final FastDateFormat ymdhmFormat = FastDateFormat.getInstance ("yyyy-MM-dd HH:mm");
    private static final FastDateFormat ymdhFormat = FastDateFormat.getInstance ("yyyy-MM-dd HH");
    private static final FastDateFormat ymdFormat = FastDateFormat.getInstance ("yyyy-MM-dd");
    private static final String UNDEFINED = "undefined";
    private static final Map<String, String> appTypeMap = new HashMap () {{
        put ("IQ", "交互查询");
        put ("OLQ", "联机查询");
        put ("MM", "模型管理");
        put ("RTS_PRODUCER", "实时流-生产者");
        put ("RTS_CONSUMER", "实时流-消费者");
        put ("OLQ_APP", "联机查询应用");
        put ("IM", "交互建模");
        put ("IQ_DSL", "交互查询DSL");
    }};

    @Autowired
    private McChartsService mcChartsService;

    /**
     * 获取服务器当前日期时间
     *
     * @return
     */
    @RequestMapping({"/nowtime"})
    @ResponseBody
    public MessageResult nowtime() {
        logger.debug ("get now date time");
        boolean status = true;
        String message = "获取当前时间成功";
        String nowtime = "";
        try {
            nowtime = ymdhmsFormat.format (new Date ());
        } catch (Exception e) {
            e.printStackTrace ();
            status = false;
            message = "系统异常：" + e;
        }
        return new MessageResult (status, message, nowtime);
    }

    /**
     * 时间维度-分结果状态的消费统计
     *
     * @param datetime
     * @param interval
     * @return
     */
    @RequestMapping({"/chart1"})
    @ResponseBody
    public MessageResult chart1(String datetime, long interval) {
        logger.debug ("select datetime=" + datetime + " interval=" + interval);
        boolean status = true;
        String message = "获取数据成功";
        Map<String, List> data = new HashMap<> ();
        try {
            Date dtEnd = getDate (datetime);
            String dtEndStr = ymdhmsFormat.format (dtEnd);
            Date dtStart = new Date (dtEnd.getTime () - interval * 60 * 1000);
            String dtStartStr = ymdhmsFormat.format (dtStart);
            long milli;
            FastDateFormat format;
            double len;
            List<McChartsView> list = null;
            if (interval <= 6 * 60) { // 数据粒度：分钟
                milli = 60 * 1000;
                format = ymdhmFormat;
                len = interval;
                list = mcChartsService.chart1Minute (dtStartStr, dtEndStr);
            } else if (interval <= 2 * 24 * 60) { // 数据粒度：小时
                milli = 60 * 60 * 1000;
                format = ymdhFormat;
                len = Math.ceil (interval / 60);
                list = mcChartsService.chart1Hour (dtStartStr, dtEndStr);
            } else { // 数据粒度：天
                milli = 24 * 60 * 60 * 1000;
                format = ymdFormat;
                len = Math.ceil (interval / (24 * 60));
                list = mcChartsService.chart1Day (dtStartStr, dtEndStr);
            }
            Map<String, Long> successMap = new HashMap<> ();
            Map<String, Long> defeatMap = new HashMap<> ();
            for (McChartsView item : list) {
                if ("0".equals (item.getStatus ())) { // 成功状态
                    successMap.put (item.getDatetime (), item.getCountNum ());
                } else if ("1".equals (item.getStatus ())) { // 失败状态
                    defeatMap.put (item.getDatetime (), item.getCountNum ());
                }
            }
            List<String> xList = new ArrayList<> ();
            List<Long> successList = new ArrayList<> ();
            List<Long> defeatList = new ArrayList<> ();
            for (int i = 0; i < len; i++) {
                String key = format.format (new Date (dtStart.getTime () + (i + 1) * milli));
                xList.add (key);
                successList.add (getValue (successMap, key));
                defeatList.add (getValue (defeatMap, key));
            }
            data.put ("X", xList);
            data.put ("SUCCESS", successList);
            data.put ("DEFEAT", defeatList);
        } catch (Exception e) {
            e.printStackTrace ();
            status = false;
            message = "系统异常：" + e;
        }
        return new MessageResult (status, message, data);
    }

    /**
     * 时间维度-分应用类型的消费统计
     *
     * @param datetime
     * @param interval
     * @return
     */
    @RequestMapping({"/chart2"})
    @ResponseBody
    public MessageResult chart2(String datetime, long interval) {
        logger.debug ("select datetime=" + datetime + " interval=" + interval);
        boolean status = true;
        String message = "获取数据成功";
        Map<String, List> data = new HashMap<> ();
        try {
            Date dtEnd = getDate (datetime);
            String dtEndStr = ymdhmsFormat.format (dtEnd);
            Date dtStart = new Date (dtEnd.getTime () - interval * 60 * 1000);
            String dtStartStr = ymdhmsFormat.format (dtStart);
            long milli;
            FastDateFormat format;
            double len;
            List<McChartsView> list = null;
            if (interval <= 6 * 60) { // 数据粒度：分钟
                milli = 60 * 1000;
                format = ymdhmFormat;
                len = interval;
                list = mcChartsService.chart2Minute (dtStartStr, dtEndStr);
            } else if (interval <= 2 * 24 * 60) { // 数据粒度：小时
                milli = 60 * 60 * 1000;
                format = ymdhFormat;
                len = Math.ceil (interval / 60);
                list = mcChartsService.chart2Hour (dtStartStr, dtEndStr);
            } else { // 数据粒度：天
                milli = 24 * 60 * 60 * 1000;
                format = ymdFormat;
                len = Math.ceil (interval / (24 * 60));
                list = mcChartsService.chart2Day (dtStartStr, dtEndStr);
            }
            Map<String, Long> iqMap = new HashMap<> ();
            Map<String, Long> olqMap = new HashMap<> ();
            Map<String, Long> mmMap = new HashMap<> ();
            Map<String, Long> rtsProducerMap = new HashMap<> ();
            Map<String, Long> rtsConsumerMap = new HashMap<> ();
            Map<String, Long> olqAppMap = new HashMap<> ();
            Map<String, Long> imMap = new HashMap<> ();
            Map<String, Long> iqDslMap = new HashMap<> ();
            String type = null;
            String dt = null;
            Long num = null;
            for (McChartsView item : list) {
                type = item.getAppType ();
                if (StringUtils.isBlank (type)) {
                    type = UNDEFINED;
                }
                dt = item.getDatetime ();
                num = item.getCountNum ();
                switch (type) {
                    case "IQ":
                        iqMap.put (dt, num);
                        break;
                    case "OLQ":
                        olqMap.put (dt, num);
                        break;
                    case "MM":
                        mmMap.put (dt, num);
                        break;
                    case "RTS_PRODUCER":
                        rtsProducerMap.put (dt, num);
                        break;
                    case "RTS_CONSUMER":
                        rtsConsumerMap.put (dt, num);
                        break;
                    case "OLQ_APP":
                        olqAppMap.put (dt, num);
                        break;
                    case "IM":
                        imMap.put (dt, num);
                        break;
                    case "IQ_DSL":
                        iqDslMap.put (dt, num);
                        break;
                }
            }
            List<String> xList = new ArrayList<> ();
            List<Long> iqList = new ArrayList<> ();
            List<Long> olqList = new ArrayList<> ();
            List<Long> mmList = new ArrayList<> ();
            List<Long> rtsProducerList = new ArrayList<> ();
            List<Long> rtsConsumerList = new ArrayList<> ();
            List<Long> olqAppList = new ArrayList<> ();
            List<Long> imList = new ArrayList<> ();
            List<Long> iqDslList = new ArrayList<> ();
            for (int i = 0; i < len; i++) {
                String key = format.format (new Date (dtStart.getTime () + (i + 1) * milli));
                xList.add (key);
                iqList.add (getValue (iqMap, key));
                olqList.add (getValue (olqMap, key));
                mmList.add (getValue (mmMap, key));
                rtsProducerList.add (getValue (rtsProducerMap, key));
                rtsConsumerList.add (getValue (rtsConsumerMap, key));
                olqAppList.add (getValue (olqAppMap, key));
                imList.add (getValue (imMap, key));
                iqDslList.add (getValue (iqDslMap, key));
            }
            data.put ("X", xList);
            data.put ("IQ", iqList);
            data.put ("OLQ", olqList);
            data.put ("MM", mmList);
            data.put ("RTS_PRODUCER", rtsProducerList);
            data.put ("RTS_CONSUMER", rtsConsumerList);
            data.put ("OLQ_APP", olqAppList);
            data.put ("IM", imList);
            data.put ("IQ_DSL", iqDslList);
        } catch (Exception e) {
            e.printStackTrace ();
            status = false;
            message = "系统异常：" + e;
        }
        return new MessageResult (status, message, data);
    }

    /**
     * 用户维度-分结果状态的消费统计
     *
     * @param datetime
     * @param interval
     * @return
     */
    @RequestMapping({"/chart3"})
    @ResponseBody
    public MessageResult chart3(String datetime, long interval) {
        logger.debug ("select datetime=" + datetime + " interval=" + interval);
        boolean status = true;
        String message = "获取数据成功";
        Map<String, List> data = new HashMap<> ();
        try {
            Date dtEnd = getDate (datetime);
            String dtEndStr = ymdhmsFormat.format (dtEnd);
            Date dtStart = new Date (dtEnd.getTime () - interval * 60 * 1000);
            String dtStartStr = ymdhmsFormat.format (dtStart);
            List<McChartsView> list = mcChartsService.chart3 (dtStartStr, dtEndStr);
            Map<String, Integer> xMap = new HashMap<> ();
            Map<String, Long> successMap = new HashMap<> ();
            Map<String, Long> defeatMap = new HashMap<> ();
            for (McChartsView item : list) {
                xMap.put (item.getUserName (), 1);
                if ("0".equals (item.getStatus ())) { // 成功状态
                    successMap.put (item.getUserName (), item.getCountNum ());
                } else if ("1".equals (item.getStatus ())) { // 失败状态
                    defeatMap.put (item.getUserName (), item.getCountNum ());
                }
            }
            List<String> xList = new ArrayList<> ();
            List<Long> successList = new ArrayList<> ();
            List<Long> defeatList = new ArrayList<> ();
            for (String key : xMap.keySet ()) {
                xList.add (key);
                successList.add (getValue (successMap, key));
                defeatList.add (getValue (defeatMap, key));
            }
            data.put ("X", xList);
            data.put ("SUCCESS", successList);
            data.put ("DEFEAT", defeatList);
        } catch (Exception e) {
            e.printStackTrace ();
            status = false;
            message = "系统异常：" + e;
        }
        return new MessageResult (status, message, data);
    }

    /**
     * 用户维度-分应用类型的消费统计
     *
     * @param datetime
     * @param interval
     * @return
     */
    @RequestMapping({"/chart4"})
    @ResponseBody
    public MessageResult chart4(String datetime, long interval) {
        logger.debug ("select datetime=" + datetime + " interval=" + interval);
        boolean status = true;
        String message = "获取数据成功";
        Map<String, List> data = new HashMap<> ();
        try {
            Date dtEnd = getDate (datetime);
            String dtEndStr = ymdhmsFormat.format (dtEnd);
            Date dtStart = new Date (dtEnd.getTime () - interval * 60 * 1000);
            String dtStartStr = ymdhmsFormat.format (dtStart);
            List<McChartsView> list = mcChartsService.chart4 (dtStartStr, dtEndStr);
            Map<String, Integer> xMap = new HashMap<> ();
            Map<String, Long> iqMap = new HashMap<> ();
            Map<String, Long> olqMap = new HashMap<> ();
            Map<String, Long> mmMap = new HashMap<> ();
            Map<String, Long> rtsProducerMap = new HashMap<> ();
            Map<String, Long> rtsConsumerMap = new HashMap<> ();
            Map<String, Long> olqAppMap = new HashMap<> ();
            Map<String, Long> imMap = new HashMap<> ();
            Map<String, Long> iqDslMap = new HashMap<> ();
            String type = null;
            String dt = null;
            Long num = null;
            for (McChartsView item : list) {
                xMap.put (item.getUserName (), 1);
                type = item.getAppType ();
                if (StringUtils.isBlank (type)) {
                    type = UNDEFINED;
                }
                dt = item.getDatetime ();
                num = item.getCountNum ();
                switch (type) {
                    case "IQ":
                        iqMap.put (dt, num);
                        break;
                    case "OLQ":
                        olqMap.put (dt, num);
                        break;
                    case "MM":
                        mmMap.put (dt, num);
                        break;
                    case "RTS_PRODUCER":
                        rtsProducerMap.put (dt, num);
                        break;
                    case "RTS_CONSUMER":
                        rtsConsumerMap.put (dt, num);
                        break;
                    case "OLQ_APP":
                        olqAppMap.put (dt, num);
                        break;
                    case "IM":
                        imMap.put (dt, num);
                        break;
                    case "IQ_DSL":
                        iqDslMap.put (dt, num);
                        break;
                }
            }
            List<String> xList = new ArrayList<> ();
            List<Long> iqList = new ArrayList<> ();
            List<Long> olqList = new ArrayList<> ();
            List<Long> mmList = new ArrayList<> ();
            List<Long> rtsProducerList = new ArrayList<> ();
            List<Long> rtsConsumerList = new ArrayList<> ();
            List<Long> olqAppList = new ArrayList<> ();
            List<Long> imList = new ArrayList<> ();
            List<Long> iqDslList = new ArrayList<> ();
            for (String key : xMap.keySet ()) {
                xList.add (key);
                iqList.add (getValue (iqMap, key));
                olqList.add (getValue (olqMap, key));
                mmList.add (getValue (mmMap, key));
                rtsProducerList.add (getValue (rtsProducerMap, key));
                rtsConsumerList.add (getValue (rtsConsumerMap, key));
                olqAppList.add (getValue (olqMap, key));
                imList.add (getValue (imMap, key));
                iqDslList.add (getValue (iqDslMap, key));
            }
            data.put ("X", xList);
            data.put ("IQ", iqList);
            data.put ("OLQ", olqList);
            data.put ("MM", mmList);
            data.put ("RTS_PRODUCER", rtsProducerList);
            data.put ("RTS_CONSUMER", rtsConsumerList);
            data.put ("OLQ_APP", olqAppList);
            data.put ("IM", imList);
            data.put ("IQ_DSL", iqDslList);
        } catch (Exception e) {
            e.printStackTrace ();
            status = false;
            message = "系统异常：" + e;
        }
        return new MessageResult (status, message, data);
    }

    /**
     * 服务名维度-分结果状态的消费统计
     *
     * @param datetime
     * @param interval
     * @return
     */
    @RequestMapping({"/chart5"})
    @ResponseBody
    public MessageResult chart5(String datetime, long interval) {
        logger.debug ("select datetime=" + datetime + " interval=" + interval);
        boolean status = true;
        String message = "获取数据成功";
        Map<String, List> data = new HashMap<> ();
        try {
            Date dtEnd = getDate (datetime);
            String dtEndStr = ymdhmsFormat.format (dtEnd);
            Date dtStart = new Date (dtEnd.getTime () - interval * 60 * 1000);
            String dtStartStr = ymdhmsFormat.format (dtStart);
            List<McChartsView> list = mcChartsService.chart5 (dtStartStr, dtEndStr);
            Map<String, Integer> xMap = new HashMap<> ();
            Map<String, Long> successMap = new HashMap<> ();
            Map<String, Long> defeatMap = new HashMap<> ();
            for (McChartsView item : list) {
                String serviceName = StringUtils.isNotBlank (item.getServiceName ()) ? item.getServiceName () : UNDEFINED;
                xMap.put (serviceName, 1);
                if ("0".equals (item.getStatus ())) { // 成功状态
                    successMap.put (serviceName, item.getCountNum ());
                } else if ("1".equals (item.getStatus ())) { // 失败状态
                    defeatMap.put (serviceName, item.getCountNum ());
                }
            }
            List<String> xList = new ArrayList<> ();
            List<Long> successList = new ArrayList<> ();
            List<Long> defeatList = new ArrayList<> ();
            for (String key : xMap.keySet ()) {
                xList.add (key);
                successList.add (getValue (successMap, key));
                defeatList.add (getValue (defeatMap, key));
            }
            data.put ("X", xList);
            data.put ("SUCCESS", successList);
            data.put ("DEFEAT", defeatList);
        } catch (Exception e) {
            e.printStackTrace ();
            status = false;
            message = "系统异常：" + e;
        }
        return new MessageResult (status, message, data);
    }

    /**
     * 应用类型维度-分结果状态的消费统计
     *
     * @param datetime
     * @param interval
     * @return
     */
    @RequestMapping({"/chart6"})
    @ResponseBody
    public MessageResult chart6(String datetime, long interval) {
        logger.debug ("select datetime=" + datetime + " interval=" + interval);
        boolean status = true;
        String message = "获取数据成功";
        Map<String, List> data = new HashMap<> ();
        try {
            Date dtEnd = getDate (datetime);
            String dtEndStr = ymdhmsFormat.format (dtEnd);
            Date dtStart = new Date (dtEnd.getTime () - interval * 60 * 1000);
            String dtStartStr = ymdhmsFormat.format (dtStart);
            List<McChartsView> list = mcChartsService.chart6 (dtStartStr, dtEndStr);
            Map<String, Integer> xMap = new HashMap<> ();
            Map<String, Long> successMap = new HashMap<> ();
            Map<String, Long> defeatMap = new HashMap<> ();
            for (McChartsView item : list) {
                xMap.put (item.getAppType (), 1);
                if ("0".equals (item.getStatus ())) { // 成功状态
                    successMap.put (item.getAppType (), item.getCountNum ());
                } else if ("1".equals (item.getStatus ())) { // 失败状态
                    defeatMap.put (item.getAppType (), item.getCountNum ());
                }
            }
            List<String> xList = new ArrayList<> ();
            List<Long> successList = new ArrayList<> ();
            List<Long> defeatList = new ArrayList<> ();
            for (String key : xMap.keySet ()) {
                xList.add (StringUtils.isNotBlank (appTypeMap.get (key)) ? appTypeMap.get (key) : UNDEFINED);
                successList.add (getValue (successMap, key));
                defeatList.add (getValue (defeatMap, key));
            }
            data.put ("X", xList);
            data.put ("SUCCESS", successList);
            data.put ("DEFEAT", defeatList);
        } catch (Exception e) {
            e.printStackTrace ();
            status = false;
            message = "系统异常：" + e;
        }
        return new MessageResult (status, message, data);
    }

    @RequestMapping({"/chart7"})
    @ResponseBody
    public MessageResult chart7(String datetime, long interval) {
        logger.debug ("select datetime=" + datetime + " interval=" + interval);
        boolean status = true;
        String message = "获取数据成功";
        Map<String, List> data = new HashMap<> ();
        try {
            Date dtEnd = getDate (datetime);
            String dtEndStr = ymdhmsFormat.format (dtEnd);
            Date dtStart = new Date (dtEnd.getTime () - interval * 60 * 1000);
            String dtStartStr = ymdhmsFormat.format (dtStart);
            List<McChartsView> list = mcChartsService.chart7 (dtStartStr, dtEndStr);
            List<String> xList = new ArrayList<> ();
            List<Float> maxList = new ArrayList<> ();
            List<Float> avgList = new ArrayList<> ();
            List<Float> minList = new ArrayList<> ();
            for (McChartsView item : list) {
                xList.add (StringUtils.isNotBlank (item.getServiceName ()) ? item.getServiceName () : UNDEFINED);
                maxList.add (item.getMaxTime ());
                avgList.add (item.getAvgTime ());
                minList.add (item.getMinTime ());
            }
            data.put ("X", xList);
            data.put ("MAX", maxList);
            data.put ("AVG", avgList);
            data.put ("MIN", minList);
        } catch (Exception e) {
            e.printStackTrace ();
            status = false;
            message = "系统异常：" + e;
        }
        return new MessageResult (status, message, data);
    }

    @RequestMapping({"/chart8"})
    @ResponseBody
    public MessageResult chart8(String datetime, long interval) {
        logger.debug ("select datetime=" + datetime + " interval=" + interval);
        boolean status = true;
        String message = "获取数据成功";
        Map<String, List> data = new HashMap<> ();
        try {
            Date dtEnd = getDate (datetime);
            String dtEndStr = ymdhmsFormat.format (dtEnd);
            Date dtStart = new Date (dtEnd.getTime () - interval * 60 * 1000);
            String dtStartStr = ymdhmsFormat.format (dtStart);
            List<McChartsView> list = mcChartsService.chart8 (dtStartStr, dtEndStr);
            List<String> xList = new ArrayList<> ();
            List<Float> maxList = new ArrayList<> ();
            List<Float> avgList = new ArrayList<> ();
            List<Float> minList = new ArrayList<> ();
            for (McChartsView item : list) {
                xList.add (StringUtils.isNotBlank (item.getServiceName ()) ? item.getServiceName () : UNDEFINED);
                maxList.add (item.getMaxTime ());
                avgList.add (item.getAvgTime ());
                minList.add (item.getMinTime ());
            }
            data.put ("X", xList);
            data.put ("MAX", maxList);
            data.put ("AVG", avgList);
            data.put ("MIN", minList);
        } catch (Exception e) {
            e.printStackTrace ();
            status = false;
            message = "系统异常：" + e;
        }
        return new MessageResult (status, message, data);
    }

    private Date getDate(String datetime) throws ParseException {
        if (StringUtils.isNotBlank (datetime)) {
            return ymdhmFormat.parse (datetime);
        } else {
            return new Date ();
        }
    }

    private Long getValue(Map<String, Long> map, String key) {
        return map.get (key) != null ? map.get (key) : 0;
    }
}
