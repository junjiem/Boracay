package com.hex.bigdata.udsp.mc.controller;

import com.hex.bigdata.udsp.common.util.JSONUtil;
import com.hex.bigdata.udsp.mc.dto.CurrentView;
import com.hex.bigdata.udsp.mc.model.Current;
import com.hex.bigdata.udsp.mc.service.CurrentService;
import com.hex.bigdata.udsp.mc.service.RunQueueService;
import com.hex.bigdata.udsp.mc.service.WaitQueueService;
import com.hex.goframe.controller.BaseController;
import com.hex.goframe.model.MessageResult;
import com.hex.goframe.model.Page;
import com.hex.goframe.model.PageListResult;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by junjiem on 2017-3-1.
 */
@RequestMapping("/mc/current")
@Controller
public class CurrentController extends BaseController {
    private static Logger logger = LogManager.getLogger(CurrentController.class);

    @Autowired
    private CurrentService currentService;
    @Autowired
    private RunQueueService runQueueService;
    @Autowired
    private WaitQueueService waitQueueService;

    @RequestMapping({"/page"})
    @ResponseBody
    public PageListResult page(CurrentView mcCurrentView, Page page) {
        logger.debug("select search=" + JSONUtil.parseObj2JSON(mcCurrentView) + " page=" + JSONUtil.parseObj2JSON(page));
        PageListResult result = null;
        try {
            result = currentService.select(mcCurrentView, page);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("系统异常：" + e);
        }
        return result;
    }

    @RequestMapping({"/select"})
    @ResponseBody
    public PageListResult select(CurrentView mcCurrentView) {
        logger.debug("select search=" + JSONUtil.parseObj2JSON(mcCurrentView));
        List<Current> list = null;
        try {
            list = currentService.select(mcCurrentView);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("系统异常：" + e);
        }
        return new PageListResult(list);
    }

    @RequestMapping({"/select/{pkId}"})
    @ResponseBody
    public MessageResult selectByPkId(@PathVariable("pkId") String pkId) {
        boolean status = true;
        String message = "查询成功";
        Current mcCurrent = null;
        if (StringUtils.isBlank(pkId)) {
            status = false;
            message = "请求参数为空";
        } else {
            try {
                //mcCurrent = mcCurrentService.select(pkId);
                mcCurrent = currentService.select(pkId);
            } catch (Exception e) {
                e.printStackTrace();
                status = false;
                message = "系统异常：" + e;
            }
        }
        if (status) {
            logger.debug(message);
        } else {
            logger.error(message);
        }
        return new MessageResult(status, message, mcCurrent);
    }

    /**
     * 缓冲队列分页查询
     *
     * @param mcCurrentView
     * @param page
     * @return
     */
    @RequestMapping({"/waitQueuePage"})
    @ResponseBody
    public PageListResult waitQueuePage(CurrentView mcCurrentView, Page page) {
        logger.debug("select search=" + JSONUtil.parseObj2JSON(mcCurrentView) + " page=" + JSONUtil.parseObj2JSON(page));
        PageListResult result = null;
        try {
            result = currentService.selectWait(mcCurrentView, page);
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("系统异常：" + e);
        }
        return result;
    }

    /**
     * 缓冲队列单个任务查询
     *
     * @param pkId
     * @return
     */
    @RequestMapping({"/waitQueueSelectByPkId/{pkId}"})
    @ResponseBody
    public MessageResult waitQueueSelectByPkId(@PathVariable("pkId") String pkId) {
        boolean status = true;
        String message = "查询成功";
        Current mcCurrent = null;
        if (StringUtils.isBlank(pkId)) {
            status = false;
            message = "请求参数为空";
        } else {
            try {
                mcCurrent = currentService.selectWait(pkId);
            } catch (Exception e) {
                e.printStackTrace();
                status = false;
                message = "系统异常：" + e;
            }
        }
        if (status) {
            logger.debug(message);
        } else {
            logger.error(message);
        }
        return new MessageResult(status, message, mcCurrent);
    }

    /**
     * 清空运行队列
     *
     * @return
     */
    @RequestMapping("/emptyRunCache")
    @ResponseBody
    public MessageResult emptyRunCache() {
        boolean status = false;
        String message = "清空运行队列失败";
        if (runQueueService.emptyCache()) {
            status = true;
            message = "清空运行队列成功";
        }
        return new MessageResult(status, message);
    }

    /**
     * 清空等待队列
     *
     * @return
     */
    @RequestMapping("/emptyWaitCache")
    @ResponseBody
    public MessageResult emptyWaitCache() {
        boolean status = false;
        String message = "清空等待队列失败";
        if (waitQueueService.emptyCache()) {
            status = true;
            message = "清空等待队列成功";
        }
        return new MessageResult(status, message);
    }

}
