package com.hex.bigdata.udsp.rc.service;

import com.hex.bigdata.udsp.common.constant.ComExcelEnums;
import com.hex.bigdata.udsp.common.constant.ServiceType;
import com.hex.bigdata.udsp.common.model.ComProperties;
import com.hex.bigdata.udsp.common.model.ComUploadExcelContent;
import com.hex.bigdata.udsp.common.service.ComPropertiesService;
import com.hex.bigdata.udsp.common.util.CreateFileUtil;
import com.hex.bigdata.udsp.common.util.ExcelCopyUtils;
import com.hex.bigdata.udsp.common.util.ExcelUploadhelper;
import com.hex.bigdata.udsp.im.service.ImModelService;
import com.hex.bigdata.udsp.iq.service.IqApplicationService;
import com.hex.bigdata.udsp.mm.service.MmApplicationService;
import com.hex.bigdata.udsp.olq.service.OlqApplicationService;
import com.hex.bigdata.udsp.olq.service.OlqService;
import com.hex.bigdata.udsp.rc.dao.RcUserServiceForUserIdAndServiceIdMapper;
import com.hex.bigdata.udsp.rc.dao.RcUserServiceMapper;
import com.hex.bigdata.udsp.rc.dto.RcUserServiceBatchDto;
import com.hex.bigdata.udsp.rc.dto.RcUserServiceDto;
import com.hex.bigdata.udsp.rc.dto.RcUserServiceView;
import com.hex.bigdata.udsp.rc.model.RcService;
import com.hex.bigdata.udsp.rc.model.RcUserService;
import com.hex.bigdata.udsp.rts.service.RtsConsumerService;
import com.hex.bigdata.udsp.rts.service.RtsProducerService;
import com.hex.goframe.model.GFUser;
import com.hex.goframe.model.Page;
import com.hex.goframe.service.BaseService;
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
public class RcUserServiceService extends BaseService {
    /**
     * 实时流-元数据Dao层服务
     */
    @Autowired
    private RcUserServiceMapper rcUserServiceMapper;
    @Autowired
    private RcServiceService rcServiceService;
    @Autowired
    private RcUserServiceForUserIdAndServiceIdMapper rcUserServiceForUserIdAndServiceIdMapper;
    @Autowired
    private RtsProducerService rtsProducerService;
    @Autowired
    private RtsConsumerService rtsConsumerService;
    @Autowired
    private IqApplicationService iqApplicationService;
    @Autowired
    private OlqService olqService;
    @Autowired
    private MmApplicationService mmApplicationService;
    @Autowired
    private OlqApplicationService olqApplicationService;
    @Autowired
    private ComPropertiesService comPropertiesService;
    @Autowired
    private ImModelService imModelService;

    @Transactional
    public String insert(RcUserServiceDto rcUserServiceDto) {
        RcUserService rcUserService = rcUserServiceDto.getRcUserService ();
        String pkId = this.insert (rcUserService);
        if (org.apache.commons.lang.StringUtils.isBlank (pkId)) {
            return "";
        }
        comPropertiesService.insertList (pkId, rcUserServiceDto.getAlarmProperties ());
        return pkId;
    }

    @Transactional
    public String insert(RcUserService rcUserService) {
        String pkId = Util.uuid ();
        rcUserService.setPkId (pkId);
        if (rcUserServiceMapper.insert (pkId, rcUserService)) {
            /*
            同时按照不同ID保存到内存中
             */
            String id = rcUserService.getUserId () + "|" + rcUserService.getServiceId ();
            rcUserServiceForUserIdAndServiceIdMapper.insert (id, rcUserService);
            return pkId;
        }
        return "";
    }

    @Transactional
    public boolean update(RcUserServiceDto rcUserServiceDto) {
        RcUserService rcUserService = rcUserServiceDto.getRcUserService ();
        List<ComProperties> alarmProperties = rcUserServiceDto.getAlarmProperties ();
        String pkId = rcUserService.getPkId ();
        if (!update (rcUserService)) return false;
        return comPropertiesService.deleteList (pkId)
                && comPropertiesService.insertList (pkId, alarmProperties);
    }

    /**
     * 根据主键更新对象实体
     *
     * @param rcUserService
     * @return
     */
    @Transactional
    public boolean update(RcUserService rcUserService) {
        if (rcUserServiceMapper.update (rcUserService.getPkId (), rcUserService)) {
            /*
            同时按照不同ID在内存中更新
             */
            String id = rcUserService.getUserId () + "|" + rcUserService.getServiceId ();
            rcUserServiceForUserIdAndServiceIdMapper.update (id, rcUserService);
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
        RcUserService rcUserService = select (pkId);
        if (rcUserServiceMapper.delete (pkId)) {
            /*
            同时按照不同ID在内存中删除
             */
            String id = rcUserService.getUserId () + "|" + rcUserService.getServiceId ();
            rcUserServiceForUserIdAndServiceIdMapper.delete (id);
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
    public RcUserService select(String pkId) {
        return rcUserServiceMapper.select (pkId);
    }

    /**
     * 分页多条件查询
     *
     * @param rcUserServiceView 查询参数
     * @param page              分页参数
     * @return
     */
    public List<RcUserServiceView> select(RcUserServiceView rcUserServiceView, Page page) {
        return rcUserServiceMapper.selectPage (rcUserServiceView, page);
    }

    /**
     * 批量删除
     *
     * @param rcServices
     * @return
     */
    @Transactional
    public boolean delete(RcUserService[] rcServices) {
        boolean flag = true;
        for (RcUserService rcService : rcServices) {
            String pkId = rcService.getPkId ();
            if (!delete (pkId)) {
                flag = false;
                break;
            }
        }
        return flag;
    }

    /**
     * 批量新增
     *
     * @param rcUserServiceBatchDto
     * @return
     */
    @Transactional
    public boolean insertBatch(RcUserServiceBatchDto rcUserServiceBatchDto) {
        RcUserServiceView rcUserServiceView = rcUserServiceBatchDto.getRcUserServiceView ();
        List<ComProperties> alarmProperties = rcUserServiceBatchDto.getAlarmProperties ();
        String userIds = rcUserServiceView.getUserIds ();
        String serviceIds = rcUserServiceView.getServiceIds ();
        String[] serviceIdArray = serviceIds.split (",");
        String[] userIdArray = userIds.split (",");
        //批量循环插入
        for (String serviceId : serviceIdArray) {
            for (String userId : userIdArray) {
                RcUserService service = new RcUserService ();
                service.setServiceId (serviceId);
                service.setIpSection (rcUserServiceView.getIpSection ());
                service.setMaxSyncNum (rcUserServiceView.getMaxSyncNum ());
                service.setMaxAsyncNum (rcUserServiceView.getMaxSyncNum ());
                service.setMaxSyncExecuteTimeout (rcUserServiceView.getMaxSyncExecuteTimeout ());
                service.setMaxAsyncExecuteTimeout (rcUserServiceView.getMaxAsyncExecuteTimeout ());
                service.setMaxSyncWaitNum (rcUserServiceView.getMaxSyncWaitNum ());
                service.setMaxSyncWaitTimeout (rcUserServiceView.getMaxSyncWaitTimeout ());
                service.setMaxAsyncWaitNum (rcUserServiceView.getMaxAsyncWaitNum ());
                service.setMaxAsyncWaitTimeout (rcUserServiceView.getMaxAsyncWaitTimeout ());
                service.setAlarmType (rcUserServiceView.getAlarmType ());
                service.setUserId (userId);
                String pkId = this.insert (service);
                comPropertiesService.insertList (pkId, alarmProperties);
            }
        }
        return true;
    }

    /**
     * 批量检查用户和服务关系是否存在
     *
     * @param userIds
     * @param serviceIds
     * @return
     */
    public boolean checkExistsBatch(String userIds, String serviceIds) {
        String[] userIdArray = userIds.split (",");
        String[] serviceArray = serviceIds.split (",");
        for (String serviceId : serviceArray) {
            for (String userId : userIdArray) {
                if (checkExists (userId, serviceId)) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 检查用户Id和服务Id关联关系是否存在
     *
     * @param userId
     * @param serviceId
     * @return
     */
    public boolean checkExists(String userId, String serviceId) {
        List<RcUserService> rcUserServices = this.rcUserServiceMapper.selectRelation (userId, serviceId);
        return rcUserServices != null && rcUserServices.size () > 0;
    }

    /**
     * 查询详细的用户服务关系信息
     *
     * @param id
     * @return
     */
    public RcUserServiceView selectFullResultMap(String id) {
        return this.rcUserServiceMapper.selectFullResultMap (id);
    }

    /**
     * 通过条件查询用户信息
     * 服务Id、用户姓名、分页参数
     *
     * @param rcUserServiceView
     * @param page
     * @return
     */

    public List<GFUser> selectNotRelationUsers(RcUserServiceView rcUserServiceView, Page page) {
        return this.rcUserServiceMapper.selectNotRelationUsers (rcUserServiceView, page);
    }

    /**
     * 通过条件查询用户信息
     * 服务Id、用户姓名、分页参数
     *
     * @param rcUserServiceView
     * @return
     */
    public List<GFUser> selectRelationUsers(RcUserServiceView rcUserServiceView) {
        return this.rcUserServiceMapper.selectRelationUsers (rcUserServiceView);
    }

    /**
     * 通过userId和serviceId获取服务信息
     * <p/>
     * （内存中有则从内存获取）
     *
     * @return
     */
    public RcUserService selectByUserIdAndServiceId(String userId, String serviceId) {
        String id = userId + "|" + serviceId;
        return rcUserServiceForUserIdAndServiceIdMapper.select (id);
    }

    /**
     * 根据服务注册外键批量删除数据
     *
     * @param serviceId
     * @return
     */
    public boolean deleteServiceId(String serviceId) {
        return this.rcUserServiceMapper.deleteServiceId (serviceId);
    }

    /**
     * 根据服务注册外键查找对应授权服务
     *
     * @param serviceId
     * @return
     */
    public List selectRelationByServiceId(String serviceId) {
        return rcUserServiceMapper.selectRelationByServiceId (serviceId);
    }

    /**
     * 数据源excel文件导入
     *
     * @param uploadFilePath
     * @return
     */
    public Map<String, String> uploadExcel(String uploadFilePath) {
        Map resultMap = new HashMap<String, String> (2);
        File uploadFile = new File (uploadFilePath);
        FileInputStream in = null;
        try {
            ComUploadExcelContent dataSourceContent = new ComUploadExcelContent ();
            dataSourceContent.setClassName ("com.hex.bigdata.udsp.rc.model.RcUserService");

            dataSourceContent.setType ("unFixed");
            //添加表格解析内容
            dataSourceContent.setExcelProperties (ComExcelEnums.RcUserService.getAllNums ());

            in = new FileInputStream (uploadFile);
            HSSFWorkbook hfb = new HSSFWorkbook (in);
            HSSFSheet sheet;
            sheet = hfb.getSheetAt (0);

            Map<String, List> uploadExcelModel = ExcelUploadhelper.getUploadExcelModel (sheet, dataSourceContent);
            List<RcUserService> rcServices = (List<RcUserService>) uploadExcelModel.get ("com.hex.bigdata.udsp.rc.model.RcUserService");
            String inseResult;
            int i = 0;
            for (RcUserService rcService : rcServices) {
                i++;
                if (rcServiceService.selectByName (rcService.getServiceId ()) == null) {
                    resultMap.put ("status", "false");
                    resultMap.put ("message", "第" + i + "个对应服务不存在！");
                    break;
                }
                rcService.setServiceId (rcServiceService.selectByName (rcService.getServiceId ()).getPkId ());
                rcService.setAlarmType ("NONE"); // 默认无告警
                inseResult = insert (rcService);
                if (inseResult != null) {
                    resultMap.put ("status", "true");
                } else {
                    resultMap.put ("status", "false");
                    resultMap.put ("message", "上传失败！");
                    break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace ();
            resultMap.put ("status", "false");
            resultMap.put ("message", "程序内部异常：" + e.getMessage ());
        } finally {
            if (in != null) {
                try {
                    in.close ();
                } catch (IOException e) {
                    e.printStackTrace ();
                }
            }
        }
        return resultMap;
    }

    public String createExcel(RcUserService[] rcServices) {
        HSSFWorkbook workbook = new HSSFWorkbook ();
        HSSFWorkbook sourceWork = null;
        HSSFSheet sourceSheet = null;
        HSSFSheet sheet = null;
        HSSFRow row;
        HSSFCell cell;
        String seprator = FileUtil.getFileSeparator ();
        String dirPath = FileUtil.getWebPath ("/");
        //模板文件位置
        String templateFile = ExcelCopyUtils.templatePath + seprator + "downLoadTemplate_rcAuther.xls";
        // 判断是否存在，不存在则创建
        dirPath += seprator + "TEMP_DOWNLOAD";
        File file = new File (dirPath);
        // 判断文件是否存在
        if (!file.exists ()) {
            FileUtil.mkdir (dirPath);
        }
        dirPath += seprator + "download_rcAuther_excel_" + DateUtil.format (new Date (), "yyyyMMddHHmmss") + ".xls";
        // 获取模板文件第一个Sheet对象
        POIFSFileSystem sourceFile = null;

        try {
            sourceFile = new POIFSFileSystem (new FileInputStream (templateFile));
            sourceWork = new HSSFWorkbook (sourceFile);
            sourceSheet = sourceWork.getSheetAt (0);
            sheet = workbook.createSheet ();
            ExcelCopyUtils.copyRow (sheet.createRow (0), sourceSheet.getRow (0), sheet.createDrawingPatriarch (), workbook);
        } catch (Exception e) {
            e.printStackTrace ();
        }

        int i = 1;
        for (RcUserService rcService : rcServices) {
            //设置内容
            RcUserService rcService1 = rcUserServiceMapper.select (rcService.getPkId ());
            //将pkid替换成name
            rcService1.setServiceId (rcServiceService.select (rcService1.getServiceId ()).getName ());
            row = sheet.createRow (i);
            cell = row.createCell (0);
            cell.setCellValue (i);
            cell = row.createCell (1);
            cell.setCellValue (rcService1.getServiceId ());
            cell = row.createCell (2);
            cell.setCellValue (rcService1.getUserId ());
            cell = row.createCell (3);
            cell.setCellValue (rcService1.getIpSection ());
            cell = row.createCell (4);
            cell.setCellValue (rcService1.getMaxSyncNum ());
            cell = row.createCell (5);
            cell.setCellValue (rcService1.getMaxAsyncNum ());
            cell = row.createCell (6);
            cell.setCellValue (rcService1.getMaxSyncWaitNum ());
            cell = row.createCell (7);
            cell.setCellValue (rcService1.getMaxAsyncWaitNum ());
            cell = row.createCell (8);
            cell.setCellValue (rcService1.getMaxSyncWaitTimeout ());
            cell = row.createCell (9);
            cell.setCellValue (rcService1.getMaxAsyncWaitTimeout ());
            cell = row.createCell (10);
            cell.setCellValue (rcService1.getMaxSyncExecuteTimeout ());
            cell = row.createCell (11);
            cell.setCellValue (rcService1.getMaxAsyncExecuteTimeout ());
            i++;
        }
        if (workbook != null) {
            try {
                FileOutputStream stream = new FileOutputStream (dirPath);
                workbook.write (new FileOutputStream (dirPath));
                stream.close ();
                return dirPath;
            } catch (IOException e) {
                e.printStackTrace ();
            }
        }
        return null;
    }

    /**
     * 根据服务名称获取对应的用户
     *
     * @param rcUserServiceView
     * @return
     */
    public List<GFUser> selectUsersByServiceName(RcUserServiceView rcUserServiceView) {
        String serviceName = rcUserServiceView.getServiceName ();
        if (StringUtils.isBlank (serviceName)) {
            return null;
        }
        RcService rcService = rcServiceService.selectByName (serviceName);
        if (rcService == null) {
            return null;
        }
        rcUserServiceView.setServiceIds (rcService.getPkId ());
        return this.selectRelationUsers (rcUserServiceView);
    }

    /**
     * 根据用户登录名获取对应的服务
     *
     * @param rcUserServiceView
     * @return
     */
    public List<RcUserServiceView> selectServicesByUserId(RcUserServiceView rcUserServiceView) {
        String userName = rcUserServiceView.getUserId ();
        if (StringUtils.isBlank (userName)) {
            return null;
        }
        return this.rcUserServiceMapper.selectServicesByUserId (rcUserServiceView.getUserId ());
    }

    public String downStreamInfoDownload(RcUserService[] rcServices) {
        // 下载地址生成
        String downloadFile = CreateFileUtil.getLocalDirPath () + FileUtil.getFileSeparator ()
                + "downStreamService_excel_" + DateUtil.format (new Date (), "yyyyMMddHHmmss") + ".xls";
        HSSFWorkbook workbook = new HSSFWorkbook (); // 创建表格
        for (RcUserService item : rcServices) {
            RcUserServiceView rcUserServiceView = this.selectFullResultMap (item.getPkId ());
            String type = rcUserServiceView.getServiceType ();
            String appId = rcUserServiceView.getServiceAppId ();
            Map<String, String> map = new HashMap<> ();
            map.put ("serviceName", rcUserServiceView.getServiceName ());
            map.put ("serviceDescribe", rcUserServiceView.getServiceDescribe ());
            map.put ("maxSyncNum", String.valueOf (rcUserServiceView.getMaxSyncNum ()));
            map.put ("maxAsyncNum", String.valueOf (rcUserServiceView.getMaxAsyncNum ()));
            map.put ("maxSyncWaitNum", String.valueOf (rcUserServiceView.getMaxSyncWaitNum ()));
            map.put ("maxAsyncWaitNum", String.valueOf (rcUserServiceView.getMaxAsyncWaitNum ()));
            map.put ("userId", rcUserServiceView.getUserId ());
            map.put ("userName", rcUserServiceView.getUserName ());
            if (ServiceType.IQ.getValue ().equals (type)) {
                workbook = iqApplicationService.setWorkbookSheet (workbook, map, appId);
            } else if (ServiceType.OLQ.getValue ().equals (type)) {
                workbook = olqService.setWorkbookSheet (workbook, map);
            } else if (ServiceType.MM.getValue ().equals (type)) {
                workbook = mmApplicationService.setWorkbookSheet (workbook, map, appId);
            } else if (ServiceType.RTS_PRODUCER.getValue ().equals (type)) {
                workbook = rtsProducerService.setWorkbookSheet (workbook, map, appId);
            } else if (ServiceType.RTS_CONSUMER.getValue ().equals (type)) {
                workbook = rtsConsumerService.setWorkbookSheet (workbook, map, appId);
            } else if (ServiceType.OLQ_APP.getValue ().equals (type)) {
                workbook = olqApplicationService.setWorkbookSheet (workbook, map, appId);
            } else if (ServiceType.IM.getValue ().equals (type)) {
                workbook = imModelService.setWorkbookSheet (workbook, map, appId);
            }
        }
        if (workbook != null) {
            FileOutputStream stream = null;
            try {
                stream = new FileOutputStream (downloadFile);
                workbook.write (new FileOutputStream (downloadFile));
            } catch (IOException e) {
                e.printStackTrace ();
            } finally {
                if (stream != null) {
                    try {
                        stream.close ();
                    } catch (IOException e) {
                        e.printStackTrace ();
                    }
                }
            }
        }
        return downloadFile;
    }
}
