package com.hex.bigdata.udsp.rc.service;

import com.hex.bigdata.udsp.common.constant.ComExcelEnums;
import com.hex.bigdata.udsp.common.constant.CommonConstant;
import com.hex.bigdata.udsp.common.constant.DatasourceModel;
import com.hex.bigdata.udsp.common.model.ComDatasource;
import com.hex.bigdata.udsp.common.model.ComUploadExcelContent;
import com.hex.bigdata.udsp.common.service.ComDatasourceService;
import com.hex.bigdata.udsp.common.util.CreateFileUtil;
import com.hex.bigdata.udsp.common.util.ExcelCopyUtils;
import com.hex.bigdata.udsp.common.util.ExcelUploadhelper;
import com.hex.bigdata.udsp.im.model.ImModel;
import com.hex.bigdata.udsp.im.service.ImModelService;
import com.hex.bigdata.udsp.iq.model.IqApplication;
import com.hex.bigdata.udsp.iq.service.IqApplicationService;
import com.hex.bigdata.udsp.mm.dao.MmApplicationMapper;
import com.hex.bigdata.udsp.mm.model.MmApplication;
import com.hex.bigdata.udsp.mm.service.MmApplicationService;
import com.hex.bigdata.udsp.olq.model.OlqApplication;
import com.hex.bigdata.udsp.olq.service.OlqApplicationService;
import com.hex.bigdata.udsp.rc.dao.RcServiceForAppTypeAndAppIdMapper;
import com.hex.bigdata.udsp.rc.dao.RcServiceForServiceNameMapper;
import com.hex.bigdata.udsp.rc.dao.RcServiceMapper;
import com.hex.bigdata.udsp.rc.dto.RcServiceView;
import com.hex.bigdata.udsp.rc.model.RcService;
import com.hex.bigdata.udsp.rc.model.RcUserService;
import com.hex.bigdata.udsp.rc.util.RcConstant;
import com.hex.bigdata.udsp.rts.dao.RtsConsumerMapper;
import com.hex.bigdata.udsp.rts.dao.RtsProducerMapper;
import com.hex.bigdata.udsp.rts.model.RtsConsumer;
import com.hex.bigdata.udsp.rts.model.RtsProducer;
import com.hex.bigdata.udsp.rts.service.RtsConsumerService;
import com.hex.bigdata.udsp.rts.service.RtsProducerService;
import com.hex.goframe.model.MessageResult;
import com.hex.goframe.model.Page;
import com.hex.goframe.util.DateUtil;
import com.hex.goframe.util.FileUtil;
import com.hex.goframe.util.Util;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA
 * Author: tomnic.wang
 * DATE:2017/3/8
 * TIME:15:11
 */
@Service
public class RcServiceService {
    @Autowired
    private RcServiceMapper rcServiceMapper;
    @Autowired
    private RtsProducerService rtsProducerService;
    @Autowired
    private RtsConsumerService rtsConsumerService;
    @Autowired
    private ComDatasourceService comDatasourceService;
    @Autowired
    private IqApplicationService iqApplicationService;
    @Autowired
    private RcServiceForServiceNameMapper rcServiceForServiceNameMapper;
    @Autowired
    private RcServiceForAppTypeAndAppIdMapper rcServiceForAppTypeAndAppIdMapper;

    @Autowired
    private MmApplicationService mmApplicationService;
    @Autowired
    private MmApplicationMapper mmApplicationMapper;
    @Autowired
    private RtsProducerMapper rtsProducerMapper;
    @Autowired
    private RtsConsumerMapper rtsConsumerMapper;
    @Autowired
    private OlqApplicationService olqApplicationService;
    @Autowired
    private ImModelService imModelService;


    /**
     * 服务授权
     */
    @Autowired
    private RcUserServiceService rcUserServiceService;

    @Transactional
    public String insert(RcService rcService) {
        String pkId = Util.uuid();
        rcService.setPkId(pkId);
        if (StringUtils.isBlank(rcService.getStatus()))
            rcService.setStatus(CommonConstant.SERVICE_STATUS_ENABLED);
        if (rcServiceMapper.insert(pkId, rcService)) {
            /*
            同时按照不同ID保存到内存中
             */
            String id1 = rcService.getName();
            rcServiceForServiceNameMapper.insert(id1, rcService);
            String id2 = rcService.getType() + "|" + rcService.getAppId();
            rcServiceForAppTypeAndAppIdMapper.insert(id2, rcService);

            return pkId;
        }
        return "";
    }

    /**
     * 根据主键更新对象实体
     *
     * @param rcService
     * @return
     */
    @Transactional
    public boolean update(RcService rcService) {
        if (rcServiceMapper.update(rcService.getPkId(), rcService)) {
            /*
            同时按照不同ID在内存中更新
             */
            String id1 = rcService.getName();
            rcServiceForServiceNameMapper.update(id1, rcService);
            String id2 = rcService.getType() + "|" + rcService.getAppId();
            rcServiceForAppTypeAndAppIdMapper.update(id2, rcService);
            return true;
        }
        return false;
    }

    /**
     * 根据主键进行删除
     *
     * @param pkId
     * @return
     */
    @Transactional
    public boolean delete(String pkId) {
        RcService rcService = select(pkId);
        if (rcServiceMapper.delete(pkId)) {
            /*
            同时按照不同ID在内存中删除
             */
            String id1 = rcService.getName();
            rcServiceForServiceNameMapper.delete(id1);
            String id2 = rcService.getType() + "|" + rcService.getAppId();
            rcServiceForAppTypeAndAppIdMapper.delete(id2);

            return true;
        }
        return false;
    }

    /**
     * 根据主键进行查询
     *
     * @param pkId
     * @return
     */
    public RcService select(String pkId) {
        return rcServiceMapper.select(pkId);
    }

    /**
     * 分页多条件查询
     *
     * @param rtsMatedataView 查询参数
     * @param page            分页参数
     * @return
     */
    public List<RcServiceView> select(RcServiceView rtsMatedataView, Page page) {
        return rcServiceMapper.selectPage(rtsMatedataView, page);
    }

    /**
     * 检查名称是否唯一
     *
     * @param name 服务名称
     * @return 存在返回true，不存在返回false
     */
    public boolean checekUniqueName(String name) {
        RcService rtsMatedata = this.rcServiceMapper.selectByName(name);
        return rtsMatedata != null;
    }

    /**
     * 通过名获取服务信息
     *
     * @param name
     * @return
     */
    public RcService selectByName(String name) {
        return this.rcServiceMapper.selectByName(name);
    }

    /**
     * 通过服务名获取服务信息（查询出启用状态的服务）
     * <p/>
     * （内存中有则从内存获取）
     *
     * @param name
     * @return
     */
    public RcService selectByServiceName(String name) {
        return this.rcServiceForServiceNameMapper.select(name);
    }

    /**
     * 通过应用类型和应用ID获取服务信息
     * <p/>
     * （内存中有则从内存获取）
     *
     * @return
     */
    public RcService selectByAppTypeAndAppId(String appType, String appId) {
        String id = appType + "|" + appId;
        return this.rcServiceForAppTypeAndAppIdMapper.select(id);
    }

    /**
     * 批量删除
     *
     * @param rcServices
     * @return
     */
    @Transactional
    public boolean delete(RcService[] rcServices) {
        boolean flag = true;
        for (RcService rcService : rcServices) {
            String pkId = rcService.getPkId();
            if (!delete(pkId)) {
                flag = false;
                break;
            }
            //批量删除服务注册数据时，同时删除服务授权数据(逻辑删除)
            rcUserServiceService.deleteServiceId(pkId);
        }
        return flag;
    }

    /**
     * 根据类型查询应用信息列表
     *
     * @param type
     * @return
     */
    public List selectApps(String type) {
        List searchList = null;
        if (RcConstant.UDSP_SERVICE_TYPE_IQ.equals(type)) {
            searchList = this.iqApplicationService.selectAll();
        } else if (RcConstant.UDSP_SERVICE_TYPE_OLQ.equals(type)) {
            searchList = comDatasourceService.selectByModel(DatasourceModel.OLQ.getValue());
        } else if (RcConstant.UDSP_SERVICE_TYPE_MM.equals(type)) {
            searchList = mmApplicationService.selectAll();
        } else if (RcConstant.UDSP_SERVICE_TYPE_RTS_PRODUCER.equals(type)) {
            searchList = this.rtsProducerService.selectAll();
        } else if (RcConstant.UDSP_SERVICE_TYPE_RTS_CONSUMER.equals(type)) {
            searchList = this.rtsConsumerService.selectAll();
        } else if (RcConstant.UDSP_SERVICE_TYPE_OLQ_APP.equals(type)) {
            searchList = this.olqApplicationService.selectAll();
        } else if (RcConstant.UDSP_SERVICE_TYPE_IM.equals(type)) {
            searchList = this.imModelService.selectAll();
        }
        return searchList;
    }

    /**
     * 根据类型和主键查询应用信息
     *
     * @param type
     * @param appId
     * @return
     */
    public Object selectAppName(String type, String appId) {
        Object app = null;
        if (RcConstant.UDSP_SERVICE_TYPE_IQ.equals(type)) {
            app = this.iqApplicationService.select(appId);
        } else if (RcConstant.UDSP_SERVICE_TYPE_OLQ.equals(type)) {
            app = comDatasourceService.select(appId);
        } else if (RcConstant.UDSP_SERVICE_TYPE_MM.equals(type)) {
            app = mmApplicationService.select(appId);
        } else if (RcConstant.UDSP_SERVICE_TYPE_RTS_PRODUCER.equals(type)) {
            app = this.rtsProducerService.select(appId);
        } else if (RcConstant.UDSP_SERVICE_TYPE_RTS_CONSUMER.equals(type)) {
            app = this.rtsConsumerService.select(appId);
        } else if (RcConstant.UDSP_SERVICE_TYPE_OLQ_APP.equals(type)) {
            app = this.olqApplicationService.select(appId);
        } else if (RcConstant.UDSP_SERVICE_TYPE_IM.equals(type)) {
            app = this.imModelService.select(appId);
        }
        return app;
    }

    /**
     * 根据服务类型查询服务
     *
     * @param serviceType 服务类型
     * @return
     */
    public List selectByType(String serviceType) {
        return this.rcServiceMapper.selectByType(serviceType);
    }

    /**
     * 根据服务类型查询服务名称
     *
     * @return
     */
    public RcService selectAuthInfo(String pkId) {
        return rcServiceMapper.selectAuthInfo(pkId);
    }

    /**
     * 根据服务名称ID查询是否有服务授权信息
     *
     * @return
     */
    public MessageResult selectRcUserService(RcService[] rcServices) {
        StringBuffer message = new StringBuffer("");
        boolean checkFlg = true;
        for (RcService rcService : rcServices) {
            List<RcUserService> rcUserServices = rcUserServiceService.selectRelationByServiceId(rcService.getPkId());
            if (rcUserServices != null && rcUserServices.size() > 0) {
                checkFlg = false;
                message.append(rcService.getName()).append(",");
            }
        }
        if (!checkFlg) {
            message.deleteCharAt(message.length() - 1).append("等服务有对应的服务授权信息，不予删除！");
        }
        return new MessageResult(checkFlg, message.toString());
    }

    /**
     * 根据应用名称和应用类型查找服务注册信息
     *
     * @param type
     * @param appId
     * @return
     */
    public boolean checkAppUsed(String type, String appId) {
        return this.rcServiceMapper.selectByAppTypeAndAppId(type, appId) != null;
    }

    /**
     * 根据应用名称和应用类型查找启用的服务注册信息
     *
     * @param type
     * @param appId
     * @return
     */
    public boolean checkAppUsedAndStart(String type, String appId) {
        return this.rcServiceMapper.selectStartByAppTypeAndAppId(type, appId) != null;
    }

    /**
     * 改变服务状态
     *
     * @param rcServices
     * @param status
     * @return
     */
    @Transactional
    public boolean statusChange(RcService[] rcServices, String status) {
        for (RcService rcService : rcServices) {
            String pkId = rcService.getPkId();
            rcService = this.select(pkId);
            rcService.setStatus(status);
            if (rcServiceMapper.update(pkId, rcService)) {
                /*
                同时按照不同ID在内存中更新
                 */
                String id1 = rcService.getName();
                rcServiceForServiceNameMapper.update(id1, rcService);
                String id2 = rcService.getType() + "|" + rcService.getAppId();
                rcServiceForAppTypeAndAppIdMapper.update(id2, rcService);
            }
        }
        return true;
    }

    /**
     * 数据源excel文件导入
     *
     * @param uploadFilePath
     * @return
     */
    public Map<String, String> uploadExcel(String uploadFilePath) {
        Map resultMap = new HashMap<String, String>(2);
        File uploadFile = new File(uploadFilePath);
        FileInputStream in = null;
        try {
            ComUploadExcelContent dataSourceContent = new ComUploadExcelContent();
            dataSourceContent.setClassName("com.hex.bigdata.udsp.rc.model.RcService");

            dataSourceContent.setType("unFixed");
            //添加表格解析内容
            dataSourceContent.setExcelProperties(ComExcelEnums.RcService.getAllNums());

            in = new FileInputStream(uploadFile);
            HSSFWorkbook hfb = new HSSFWorkbook(in);
            HSSFSheet sheet;
            sheet = hfb.getSheetAt(0);

            Map<String, List> uploadExcelModel = ExcelUploadhelper.getUploadExcelModel(sheet, dataSourceContent);
            List<RcService> rcServices = (List<RcService>) uploadExcelModel.get("com.hex.bigdata.udsp.rc.model.RcService");
            String inseResult;
            String type;
            String appName;
            String appId = null;
            int i = 1;
            for (RcService rcService : rcServices) {
                if (rcServiceMapper.selectByName(rcService.getName()) != null) {
                    resultMap.put("status", "false");
                    resultMap.put("message", "第" + i + "个名称重复！");
                    break;
                }
                //跟新应用id
                type = rcService.getType();
                appName = rcService.getAppId(); // 上传时将应用名称设置到了rcService的appId，所以这里的appId其实就是appName
                /*
                通过type和appName获取appId
                 */
                if (RcConstant.UDSP_SERVICE_TYPE_IQ.equals(type)) { // 交互查询
                    IqApplication iqApplication = iqApplicationService.selectByName(appName);
                    if (iqApplication == null) {
                        resultMap.put("status", "false");
                        resultMap.put("message", "第" + i + "个应用名称不存在！");
                        break;
                    }
                    appId = iqApplication.getPkId();
                } else if (RcConstant.UDSP_SERVICE_TYPE_OLQ.equals(type)) { // 联机查询
                    ComDatasource comDatasource = comDatasourceService.selectByModelAndName("OLQ", appName);
                    if (comDatasource == null) {
                        resultMap.put("status", "false");
                        resultMap.put("message", "第" + i + "个应用名称不存在！");
                        break;
                    }
                    appId = comDatasource.getPkId();
                } else if (RcConstant.UDSP_SERVICE_TYPE_MM.equals(type)) { // 模型管理
                    MmApplication mmApplication = mmApplicationMapper.selectByName(appName);
                    if (mmApplication == null) {
                        resultMap.put("status", "false");
                        resultMap.put("message", "第" + i + "个应用名称不存在！");
                        break;
                    }
                    appId = mmApplication.getPkId();
                } else if (RcConstant.UDSP_SERVICE_TYPE_RTS_PRODUCER.equals(type)) { // 实时流-生产者
                    RtsProducer rtsProducer = rtsProducerMapper.selectByName(appName);
                    if (rtsProducer == null) {
                        resultMap.put("status", "false");
                        resultMap.put("message", "第" + i + "个应用名称不存在！");
                        break;
                    }
                    appId = rtsProducer.getPkId();
                } else if (RcConstant.UDSP_SERVICE_TYPE_RTS_CONSUMER.equals(type)) { // 实时流-消费者
                    RtsConsumer rtsConsumer = rtsConsumerMapper.selectByName(appName);
                    if (rtsConsumer == null) {
                        resultMap.put("status", "false");
                        resultMap.put("message", "第" + i + "个应用名称不存在！");
                        break;
                    }
                    appId = rtsConsumer.getPkId();
                } else if (RcConstant.UDSP_SERVICE_TYPE_OLQ_APP.equals(type)) { // 联机查询应用
                    OlqApplication olqApplication = olqApplicationService.selectByName(appName);
                    if (olqApplication == null) {
                        resultMap.put("status", "false");
                        resultMap.put("message", "第" + i + "个应用名称不存在！");
                        break;
                    }
                    appId = olqApplication.getPkId();
                } else if (RcConstant.UDSP_SERVICE_TYPE_IM.equals(type)) { // 交互建模
                    ImModel imModel = imModelService.selectByName(appName);
                    if (imModel == null) {
                        resultMap.put("status", "false");
                        resultMap.put("message", "第" + i + "个应用名称不存在！");
                        break;
                    }
                    appId = imModel.getPkId();
                }
                rcService.setAppId(appId);

                //如果服务状态为空则
                if (StringUtils.isBlank(rcService.getStatus())) {
                    rcService.setStatus(CommonConstant.SERVICE_STATUS_ENABLED);
                } else if (CommonConstant.SERVICE_STATUS_ENABLED_TEXT.equals(rcService.getStatus())) {
                    rcService.setStatus(CommonConstant.SERVICE_STATUS_ENABLED);
                } else if (CommonConstant.SERVICE_STATUS_DISABLED_TEXT.equals(rcService.getStatus())) {
                    rcService.setStatus(CommonConstant.SERVICE_STATUS_DISABLED);
                } else {
                    resultMap.put("status", "false");
                    resultMap.put("message", "第" + i + "个服务状态填写不正确！");
                    break;
                }

                inseResult = insert(rcService);
                if (inseResult != null) {
                    resultMap.put("status", "true");
                } else {
                    resultMap.put("status", "false");
                    resultMap.put("message", "第" + i + "个保存失败！");
                    break;
                }
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
            resultMap.put("status", "false");
            resultMap.put("message", "程序内部异常：" + e.getMessage());
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return resultMap;
    }

    public String createExcel(RcService[] rcServices) {
        HSSFWorkbook workbook = null;
        HSSFWorkbook sourceWork;
        HSSFSheet sourceSheet = null;
        HSSFSheet sheet = null;
        HSSFRow row;
        HSSFCell cell;
        String seprator = FileUtil.getFileSeparator();
        //模板文件位置
        String templateFile = ExcelCopyUtils.templatePath + seprator + "downLoadTemplate_rcService.xls";
        // 下载地址
        String dirPath = CreateFileUtil.getLocalDirPath();
        dirPath += seprator + "download_rcService_excel_" + DateUtil.format(new Date(), "yyyyMMddHHmmss") + ".xls";
        // 获取模板文件第一个Sheet对象
        POIFSFileSystem sourceFile = null;

        try {
            sourceFile = new POIFSFileSystem(new FileInputStream(
                    templateFile));
            sourceWork = new HSSFWorkbook(sourceFile);
            sourceSheet = sourceWork.getSheetAt(0);
            //创建表格
            workbook = new HSSFWorkbook();
            sheet = workbook.createSheet();
            ExcelCopyUtils.copyRow(sheet.createRow(0), sourceSheet.getRow(0), sheet.createDrawingPatriarch(), workbook);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int i = 1;
        String type;
        String appId;
        String appName = null;
        for (RcService rcService : rcServices) {
            rcService = rcServiceMapper.select(rcService.getPkId());
            type = rcService.getType();
            appId = rcService.getAppId();

            /*
            通过type和appId获取appName
             */
            if (RcConstant.UDSP_SERVICE_TYPE_IQ.equals(type)) { // 交互查询
                appName = iqApplicationService.select(appId).getName();
            } else if (RcConstant.UDSP_SERVICE_TYPE_OLQ.equals(type)) { // 联机查询
                appName = comDatasourceService.select(appId).getName();
            } else if (RcConstant.UDSP_SERVICE_TYPE_MM.equals(type)) { // 模型管理
                appName = mmApplicationMapper.select(appId).getName();
            } else if (RcConstant.UDSP_SERVICE_TYPE_RTS_PRODUCER.equals(type)) { // 实时流-生产者
                appName = rtsProducerMapper.select(appId).getName();
            } else if (RcConstant.UDSP_SERVICE_TYPE_RTS_CONSUMER.equals(type)) { // 实时流-消费者
                appName = rtsConsumerMapper.select(appId).getName();
            } else if (RcConstant.UDSP_SERVICE_TYPE_OLQ_APP.equals(type)) { // 联机查询应用
                appName = olqApplicationService.select(appId).getName();
            } else if (RcConstant.UDSP_SERVICE_TYPE_IM.equals(type)) { // 交互建模
                appName = imModelService.select(appId).getName();
            }

            row = sheet.createRow(i);
            cell = row.createCell(0);
            cell.setCellValue(i);
            cell = row.createCell(1);
            cell.setCellValue(rcService.getName());
            cell = row.createCell(2);
            cell.setCellValue(rcService.getType());
            cell = row.createCell(3);
            cell.setCellValue(appName);
            cell = row.createCell(4);
            cell.setCellValue(rcService.getDescribe());
            cell = row.createCell(5);
            if (CommonConstant.SERVICE_STATUS_ENABLED.equals(rcService.getStatus())) {
                cell.setCellValue(CommonConstant.SERVICE_STATUS_ENABLED_TEXT);
            } else {
                cell.setCellValue(CommonConstant.SERVICE_STATUS_DISABLED_TEXT);
            }

            i++;
        }
        if (workbook != null) {
            try {
                FileOutputStream stream = new FileOutputStream(dirPath);
                workbook.write(new FileOutputStream(dirPath));
                stream.close();
                return dirPath;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
