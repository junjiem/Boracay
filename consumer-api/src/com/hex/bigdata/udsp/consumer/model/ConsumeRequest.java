package com.hex.bigdata.udsp.consumer.model;

import com.hex.bigdata.udsp.common.constant.ErrorCode;
import com.hex.bigdata.udsp.common.model.QueueIsFullResult;
import com.hex.bigdata.udsp.mc.model.Current;
import com.hex.bigdata.udsp.rc.model.RcService;
import com.hex.bigdata.udsp.rc.model.RcUserService;

public class ConsumeRequest {

    private Request request;
    private Current mcCurrent;
    private ErrorCode error;
    private String message;
    private RcService rcService;
    private RcUserService rcUserService;
    private QueueIsFullResult queueIsFullResult;

    public ConsumeRequest() {
    }

    public ConsumeRequest(Request request) {
        this.request = request;
    }

    public Request getRequest() {
        return request;
    }

    public void setRequest(Request request) {
        this.request = request;
    }

    public Current getMcCurrent() {
        return mcCurrent;
    }

    public void setMcCurrent(Current mcCurrent) {
        this.mcCurrent = mcCurrent;
    }

    public ErrorCode getError() {
        return error;
    }

    public void setError(ErrorCode error) {
        this.error = error;
    }

    public RcUserService getRcUserService() {
        return rcUserService;
    }

    public void setRcUserService(RcUserService rcUserService) {
        this.rcUserService = rcUserService;
    }

    public QueueIsFullResult getQueueIsFullResult() {
        return queueIsFullResult;
    }

    public void setQueueIsFullResult(QueueIsFullResult queueIsFullResult) {
        this.queueIsFullResult = queueIsFullResult;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public RcService getRcService() {
        return rcService;
    }

    public void setRcService(RcService rcService) {
        this.rcService = rcService;
    }
}
