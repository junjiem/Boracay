package com.hex.bigdata.udsp.consumer.util;

import com.hex.bigdata.udsp.common.constant.ErrorCode;
import com.hex.bigdata.udsp.common.constant.Status;
import com.hex.bigdata.udsp.common.constant.StatusCode;
import com.hex.bigdata.udsp.common.util.CreateFileUtil;
import com.hex.bigdata.udsp.common.util.FTPHelper;
import com.hex.bigdata.udsp.common.util.JSONUtil;
import com.hex.bigdata.udsp.common.util.MD5Util;
import com.hex.bigdata.udsp.consumer.model.Request;
import com.hex.bigdata.udsp.consumer.model.Response;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by JunjieM on 2018-9-7.
 */
public class Util {

    private static final String CONSUME_RTS_DATASTREAM = "dataStream";

    /**
     * JSON字符串转Request对象
     *
     * @param json
     * @return
     */
    public static Request jsonToRequest(String json) {
        Map<String, Class> classMap = new HashMap<> ();
        classMap.put (CONSUME_RTS_DATASTREAM, Map.class);
        return JSONUtil.parseJSON2Obj (json, Request.class, classMap);
    }

    /**
     * 上传文件到FTP服务器并返回结果
     *
     * @param fileName
     * @param userName
     * @return
     */
    public static Response uploadFtp(String fileName, String userName) {
        String dataFileName = CreateFileUtil.getDataFileName (fileName);
        String flgFileName = CreateFileUtil.getFlgFileName (fileName);
        String localDataFilePath = CreateFileUtil.getLocalDataFilePath (fileName);
        String localFlgFilePath = CreateFileUtil.getLocalFlgFilePath (fileName);
        String ftpFileDir = CreateFileUtil.getFtpFileDir (userName);
        String ftpDataFilePath = ftpFileDir + "/" + dataFileName;
        // 写数据文件和标记文件到本地，并上传至FTP服务器
        FTPHelper ftpHelper = new FTPHelper ();
        try {
            ftpHelper.connectFTPServer ();
            ftpHelper.uploadFile (localDataFilePath, dataFileName, ftpFileDir);
            ftpHelper.uploadFile (localFlgFilePath, flgFileName, ftpFileDir);
            //String filePath = "ftp://" + FTPClientConfig.getHostname() + ":" + FTPClientConfig.getPort() + ftpFilePath;
            String filePath = ftpDataFilePath;
            Response response = new Response ();
            response.setStatus (Status.SUCCESS.getValue ());
            response.setStatusCode (StatusCode.SUCCESS.getValue ());
            //response.setMessage (localDataFilePath);
            response.setResponseContent (filePath);
            return response;
        } catch (Exception e) {
            e.printStackTrace ();
            return errorResponse (ErrorCode.ERROR_000007, "FTP上传失败！" + e.getMessage ());
        } finally {
            try {
                ftpHelper.closeFTPClient ();
            } catch (Exception e) {
                e.printStackTrace ();
            }
        }
    }

    /**
     * 获取错误的Response
     *
     * @param errorCode
     * @param message
     * @return
     */
    public static Response errorResponse(ErrorCode errorCode, String message) {
        Response response = new Response ();
        response.setStatus (Status.DEFEAT.getValue ());
        response.setStatusCode (StatusCode.DEFEAT.getValue ());
        response.setErrorCode (errorCode.getValue ());
        response.setMessage (errorCode.getName () + ":" + message);
        return response;
    }

    /**
     * 获取缓存ID
     *
     * @param request
     * @return
     */
    public static String getCacheId(Request request) {
        Map<String, Object> map = new HashMap<> ();
        map.put ("appType", request.getAppType ());
        map.put ("appId", request.getAppId ());
        map.put ("type", request.getType ());
        map.put ("entity", request.getEntity ());
        map.put ("page", request.getPage ());
        map.put ("sql", request.getSql ());
        map.put ("data", request.getData ());
        return MD5Util.MD5_16 (JSONUtil.parseMap2JSON (map));
    }
}
