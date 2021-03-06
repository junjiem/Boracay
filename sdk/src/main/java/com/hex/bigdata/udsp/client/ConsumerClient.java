package com.hex.bigdata.udsp.client;

import com.hex.bigdata.udsp.common.api.model.BaseRequest;
import com.hex.bigdata.udsp.common.constant.ConsumerEntity;
import com.hex.bigdata.udsp.common.constant.ConsumerType;
import com.hex.bigdata.udsp.common.constant.EnumTrans;
import com.hex.bigdata.udsp.model.response.AsyncResponse;
import com.hex.bigdata.udsp.model.response.StatusResponse;
import com.hex.bigdata.udsp.model.response.SyncResponse;
import com.hex.bigdata.udsp.model.response.AsyncPackResponse;
import com.hex.bigdata.udsp.model.response.StatusPackResponse;
import com.hex.bigdata.udsp.model.response.SyncPackResponse;
import org.apache.commons.lang3.StringUtils;

public abstract class ConsumerClient {

    /**
     * 请求地址
     */
    private String requestUrl;

    protected ConsumerClient() {
    }

    protected ConsumerClient(String requestUrl) {
        this.requestUrl = requestUrl;
    }


    public String getRequestUrl() {
        return requestUrl;
    }

    public void setRequestUrl(String requestUrl) {
        this.requestUrl = requestUrl;
    }

    /**
     * 检查start业务参数
     */
    protected abstract void checkStartBusinessParams(BaseRequest baseRequest);

    /**
     * 检查基础参数信息
     *
     * @param baseRequest
     */
    protected void checkBasicParams(BaseRequest baseRequest, ConsumerType consumerType, ConsumerEntity consumerEntity) {

        String serviceName = baseRequest.getServiceName();
        String udspUser = baseRequest.getUdspUser();
        String udspPass = baseRequest.getToken();
        String appUser = baseRequest.getAppUser();
        String type = baseRequest.getType();
        String entity = baseRequest.getEntity();
        StringBuffer errorMessage = new StringBuffer();

        if (StringUtils.isBlank(serviceName)) {
            errorMessage.append("serviceName参数为空；");
        }
        if (StringUtils.isBlank(udspUser)) {
            errorMessage.append("udspUser参数为空；");
        }
        if (StringUtils.isBlank(udspPass)) {
            errorMessage.append("udspPass参数为空；");
        }
//        if (StringUtils.isBlank(appUser)) {
//            errorMessage.append("appUser参数为空；");
//        }
        if (StringUtils.isBlank(type)) {
            errorMessage.append("type参数为空；");
        } else {
            if (!consumerType.getValue().equalsIgnoreCase(type)) {
                errorMessage.append("type参数不合法；");
            }
        }
        if (StringUtils.isBlank(entity)) {
            errorMessage.append("entity参数为空；");
        } else {
            if (!consumerEntity.getValue().equalsIgnoreCase(entity)) {
                errorMessage.append("entity参数不合法；");
            }
        }

        if (StringUtils.isNotBlank(errorMessage)) {
            throw new IllegalArgumentException(errorMessage.toString());
        }
    }

    /**
     * 检查status接口业务参数
     *
     * @param consumeId
     */
    protected void checkStatusBusinessParams(String consumeId) {
        if (StringUtils.isBlank(consumeId)) {
            throw new IllegalArgumentException("参数consumeId为空；");
        }
    }

    /**
     * StatusResponse类型转换为StatusPackageResponse类型
     */
    protected StatusPackResponse transStatusResponse(StatusResponse statusResponse) {
        if (statusResponse == null) {
            return null;
        }
        StatusPackResponse packageResponse = new StatusPackResponse();
        packageResponse.setStatus(statusResponse.getStatus());
        packageResponse.setStatusCode(EnumTrans.transStatusCode(statusResponse.getStatusCode()));
        packageResponse.setConsumeId(statusResponse.getConsumeId());
        packageResponse.setConsumeTime(statusResponse.getConsumeTime());
        packageResponse.setMessage(statusResponse.getMessage());
        packageResponse.setErrorCode(EnumTrans.transErrorCode(statusResponse.getErrorCode()));
        return packageResponse;
    }

    /**
     * SyncResponse类型转换为SyncPackResponse类型
     */
    protected SyncPackResponse transSyncPackResponse(SyncResponse syncResponse) {
        if (syncResponse == null) {
            return null;
        }
        SyncPackResponse syncPackResponse = new SyncPackResponse();
        syncPackResponse.setStatus(syncResponse.getStatus());
        syncPackResponse.setStatusCode(EnumTrans.transStatusCode(syncResponse.getStatusCode()));
        syncPackResponse.setConsumeId(syncResponse.getConsumeId());
        syncPackResponse.setConsumeTime(syncResponse.getConsumeTime());
        syncPackResponse.setMessage(syncResponse.getMessage());
        syncPackResponse.setErrorCode(EnumTrans.transErrorCode(syncResponse.getErrorCode()));
        if (syncResponse.getPage() != null) {
            syncPackResponse.setPage(syncResponse.getPage());
        }
        if (syncResponse.getReturnColumns() != null) {
            syncPackResponse.setReturnColumns(syncResponse.getReturnColumns());
        }
        if (syncResponse.getRecords() != null) {
            syncPackResponse.setRecords(syncResponse.getRecords());
        }
        return syncPackResponse;
    }

    /**
     * AsyncResponse类型转换为AsyncPackResponse类型
     */
    protected AsyncPackResponse transAsyncPackResponse(AsyncResponse asyncResponse) {
        if (asyncResponse == null) {
            return null;
        }
        AsyncPackResponse asyncPackResponse = new AsyncPackResponse();
        asyncPackResponse.setStatus(asyncResponse.getStatus());
        asyncPackResponse.setStatusCode(EnumTrans.transStatusCode(asyncResponse.getStatusCode()));
        asyncPackResponse.setConsumeId(asyncResponse.getConsumeId());
        asyncPackResponse.setConsumeTime(asyncResponse.getConsumeTime());
        asyncPackResponse.setMessage(asyncResponse.getMessage());
        asyncPackResponse.setResponseContent(asyncResponse.getResponseContent());
        asyncPackResponse.setErrorCode(EnumTrans.transErrorCode(asyncResponse.getErrorCode()));
        return asyncPackResponse;
    }

}
