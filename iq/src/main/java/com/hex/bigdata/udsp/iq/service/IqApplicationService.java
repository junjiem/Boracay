package com.hex.bigdata.udsp.iq.service;

import com.hex.bigdata.udsp.common.constant.ComExcelEnums;
import com.hex.bigdata.udsp.common.model.ComExcelParam;
import com.hex.bigdata.udsp.common.model.ComExcelProperties;
import com.hex.bigdata.udsp.common.model.ComUploadExcelContent;
import com.hex.bigdata.udsp.common.service.ComPropertiesService;
import com.hex.bigdata.udsp.common.util.CreateFileUtil;
import com.hex.bigdata.udsp.common.util.ExcelCopyUtils;
import com.hex.bigdata.udsp.common.util.ExcelUploadhelper;
import com.hex.bigdata.udsp.iq.dao.IqApplicationMapper;
import com.hex.bigdata.udsp.iq.dao.IqMetadataMapper;
import com.hex.bigdata.udsp.iq.dto.IqApplicationPropsView;
import com.hex.bigdata.udsp.iq.dto.IqApplicationView;
import com.hex.bigdata.udsp.iq.dto.IqIndexDto;
import com.hex.bigdata.udsp.iq.model.*;
import com.hex.goframe.model.Page;
import com.hex.goframe.service.BaseService;
import com.hex.goframe.util.DateUtil;
import com.hex.goframe.util.FileUtil;
import com.hex.goframe.util.Util;
import org.apache.commons.lang.StringUtils;
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
import java.lang.reflect.Field;
import java.util.*;

/**
 * Created by junjiem on 2017-2-23.
 */
@Service
public class IqApplicationService extends BaseService {
    @Autowired
    private IqApplicationMapper iqApplicationMapper;
    @Autowired
    private IqAppQueryColService iqAppQueryColService;
    @Autowired
    private IqAppReturnColService iqAppReturnColService;
    @Autowired
    private IqAppOrderColService iqAppOrderColService;
    @Autowired
    private IqMetadataMapper iqMetadataMapper;
    @Autowired
    private ComPropertiesService comPropertiesService;

    @Transactional
    public String insert(IqApplication iqApplication) {
        String pkId = Util.uuid ();
        iqApplication.setPkId (pkId);
        if (iqApplicationMapper.insert (iqApplication.getPkId (), iqApplication)) {
            return pkId;
        }
        return "";
    }

    @Transactional
    public String insert(IqApplicationPropsView iqApplicationPropsView) {
        IqApplication iqApplication = iqApplicationPropsView.getIqApplication ();
        String pkId = this.insert (iqApplication);
        if (StringUtils.isNotBlank (pkId)) {
            iqAppQueryColService.insertList (pkId, iqApplicationPropsView.getIqAppQueryColList ());
            iqAppReturnColService.insertList (pkId, iqApplicationPropsView.getIqAppReturnColList ());
            iqAppOrderColService.insertList (pkId, iqApplicationPropsView.getIqAppOrderColList ());
            comPropertiesService.insertList (pkId, iqApplicationPropsView.getComPropertiesList ());
            return pkId;
        }
        return "";
    }

    @Transactional
    public boolean update(IqApplication iqApplication) {
        return iqApplicationMapper.update (iqApplication.getPkId (), iqApplication);
    }

    @Transactional
    public boolean update(IqApplicationPropsView iqApplicationPropsView) {
        IqApplication iqApplication = iqApplicationPropsView.getIqApplication ();
        String pkId = iqApplication.getPkId ();
        if (!iqApplicationMapper.update (pkId, iqApplication)) {
            return false;
        }
        if (!iqAppQueryColService.deleteByAppId (pkId)) {
            return false;
        }
        if (!iqAppReturnColService.deleteByAppId (pkId)) {
            return false;
        }
        if (!iqAppOrderColService.deleteByAppId (pkId)) {
            return false;
        }
        if (!comPropertiesService.deleteList (pkId)) {
            return false;
        }
        iqAppQueryColService.insertList (pkId, iqApplicationPropsView.getIqAppQueryColList ());
        iqAppReturnColService.insertList (pkId, iqApplicationPropsView.getIqAppReturnColList ());
        iqAppOrderColService.insertList (pkId, iqApplicationPropsView.getIqAppOrderColList ());
        comPropertiesService.insertList (pkId, iqApplicationPropsView.getComPropertiesList ());
        return true;
    }

    @Transactional
    public boolean delete(String pkId) {
        return iqApplicationMapper.delete (pkId);
    }

    @Transactional
    public boolean delete(IqApplication[] iqApplications) {
        boolean status = true;
        for (IqApplication iqApplication : iqApplications) {
            String pkId = iqApplication.getPkId ();
            if (!this.delete (pkId)) {
                status = false;
                break;
            }
        }
        return status;
    }

    public IqApplication select(String pkId) {
        return iqApplicationMapper.select (pkId);
    }

    public List<IqApplicationView> select(IqApplicationView iqApplicationView, Page page) {
        return iqApplicationMapper.select (iqApplicationView, page);
    }

    public List<IqApplicationView> select(IqApplicationView iqApplicationView) {
        return iqApplicationMapper.select (iqApplicationView);
    }

    public List<IqApplication> selectAll() {
        return iqApplicationMapper.selectAll ();
    }

    public boolean checkName(String name) {
        return iqApplicationMapper.selectByName (name) != null;
    }

    public IqApplication selectByName(String name) {
        return iqApplicationMapper.selectByName (name);
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
            dataSourceContent.setClassName ("com.hex.bigdata.udsp.iq.model.IqApplication");
            List<ComExcelParam> comExcelParams = new ArrayList<> ();
            comExcelParams.add (new ComExcelParam (2, 1, "name"));
            comExcelParams.add (new ComExcelParam (2, 3, "mdId"));
            comExcelParams.add (new ComExcelParam (2, 5, "note"));
            comExcelParams.add (new ComExcelParam (3, 1, "describe"));

            dataSourceContent.setComExcelParams (comExcelParams);
            List<ComExcelProperties> comExcelPropertiesList = new ArrayList<> ();
            comExcelPropertiesList.add (new ComExcelProperties ("查询字段",
                    "com.hex.bigdata.udsp.iq.model.IqAppQueryCol",
                    11, 0, 1, ComExcelEnums.IqApplicationQueryCoumn.getAllNums ()));
            comExcelPropertiesList.add (new ComExcelProperties ("返回字段",
                    "com.hex.bigdata.udsp.iq.model.IqAppReturnCol",
                    10, 0, 2, ComExcelEnums.IqApplicationReturnCol.getAllNums ()));
            comExcelPropertiesList.add (new ComExcelProperties ("排序字段",
                    "com.hex.bigdata.udsp.iq.model.IqAppOrderCol",
                    10, 0, 3, ComExcelEnums.IqApplicationOrderCol.getAllNums ()));

            dataSourceContent.setComExcelPropertiesList (comExcelPropertiesList);
            dataSourceContent.setType ("fixed");

            in = new FileInputStream (uploadFile);
            HSSFWorkbook hfb = new HSSFWorkbook (in);
            HSSFSheet sheet;

            for (int i = 0, activeIndex = hfb.getNumberOfSheets (); i < activeIndex; i++) {
                sheet = hfb.getSheetAt (i);
                Map<String, List> uploadExcelModel = ExcelUploadhelper.getUploadExcelModel (sheet, dataSourceContent);
                List<IqApplication> iqApplications = (List<IqApplication>) uploadExcelModel.get ("com.hex.bigdata.udsp.iq.model.IqApplication");
                IqApplication iqApplication = iqApplications.get (0);
                if (iqApplicationMapper.selectByName (iqApplication.getName ()) != null) {
                    resultMap.put ("status", "false");
                    resultMap.put ("message", "第" + (i + 1) + "个名称已存在！");
                    break;
                }
                IqMetadata iqMetadata = iqMetadataMapper.selectByName (iqApplication.getMdId ());
                if (iqMetadata == null) {
                    resultMap.put ("status", "false");
                    resultMap.put ("message", "第" + (i + 1) + "个应用对应元数据名称不存在！");
                    break;
                }
                //更新元数据
                iqApplication.setMdId (iqMetadata.getPkId ());
                String pkId = insert (iqApplication);
                List<IqAppQueryCol> queryColumnList = (List<IqAppQueryCol>) uploadExcelModel.get ("com.hex.bigdata.udsp.iq.model.IqAppQueryCol");
                List<IqAppOrderCol> iqAppOrderColList = (List<IqAppOrderCol>) uploadExcelModel.get ("com.hex.bigdata.udsp.iq.model.IqAppOrderCol");
                List<IqAppReturnCol> iqAppReturnColList = (List<IqAppReturnCol>) uploadExcelModel.get ("com.hex.bigdata.udsp.iq.model.IqAppReturnCol");
                boolean insertReturn = iqAppReturnColList.size () == 0 || iqAppReturnColService.insertList (pkId, iqAppReturnColList);
                boolean insertQuery = queryColumnList.size () == 0 || iqAppQueryColService.insertList (pkId, queryColumnList);
                boolean insertOrder = iqAppOrderColList.size () == 0 || iqAppOrderColService.insertList (pkId, iqAppOrderColList);
                if (insertQuery && insertReturn && insertOrder) {
                    resultMap.put ("status", "true");
                } else {
                    resultMap.put ("status", "false");
                    resultMap.put ("message", "第" + (i + 1) + "个保存失败！");
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

    public String createExcel(IqApplication[] iqApplications) {
        HSSFWorkbook workbook = new HSSFWorkbook (); // 创建表格
        // 模板文件位置
        String templateFile = ExcelCopyUtils.templatePath + FileUtil.getFileSeparator () + "downLoadTemplate_iqApplication.xls";
        // 下载地址
        String dirPath = CreateFileUtil.getLocalDirPath ();
        dirPath += FileUtil.getFileSeparator () + "download_iqApplication_excel_" + DateUtil.format (new Date (), "yyyyMMddHHmmss") + ".xls";
        // 获取模板文件第一个Sheet对象
        POIFSFileSystem sourceFile = null;
        HSSFWorkbook sourceWork = null;
        HSSFSheet sourceSheet = null;
        try {
            sourceFile = new POIFSFileSystem (new FileInputStream (templateFile));
            sourceWork = new HSSFWorkbook (sourceFile);
            sourceSheet = sourceWork.getSheetAt (0);
        } catch (IOException e) {
            e.printStackTrace ();
        }
        List<ComExcelParam> comExcelParams = new ArrayList<> ();
        comExcelParams.add (new ComExcelParam (2, 1, "name"));
        comExcelParams.add (new ComExcelParam (2, 3, "mdId"));
        comExcelParams.add (new ComExcelParam (2, 5, "note"));
        comExcelParams.add (new ComExcelParam (3, 1, "describe"));
        for (IqApplication iqApplication : iqApplications) {
            this.setWorkbookSheet (workbook, sourceSheet, comExcelParams, iqApplication);
        }
        FileOutputStream stream = null;
        try {
            stream = new FileOutputStream (dirPath);
            workbook.write (new FileOutputStream (dirPath));
            return dirPath;
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
        return null;
    }

    public HSSFWorkbook setWorkbookSheet(HSSFWorkbook workbook, Map<String, String> map, String appId) {
        String templateFile = ExcelCopyUtils.templatePath + FileUtil.getFileSeparator () + "downLoadTemplate_allServiceInfo.xls";
        // 获取模板文件第一个Sheet对象
        POIFSFileSystem sourceFile = null;
        HSSFWorkbook sourceWork = null;
        HSSFSheet sourceSheet = null;
        try {
            sourceFile = new POIFSFileSystem (new FileInputStream (templateFile));
            sourceWork = new HSSFWorkbook (sourceFile);
            // 交互查询模板为第1个sheet
            sourceSheet = sourceWork.getSheetAt (0);
        } catch (IOException e) {
            e.printStackTrace ();
        }

        IqApplication iqApplication = this.select (appId);

        List<ComExcelParam> comExcelParams = new ArrayList<ComExcelParam> ();
        comExcelParams.add (new ComExcelParam (2, 1, "serviceName"));
        comExcelParams.add (new ComExcelParam (2, 3, "serviceDescribe"));
        comExcelParams.add (new ComExcelParam (3, 1, "maxSyncNum"));
        comExcelParams.add (new ComExcelParam (3, 3, "maxAsyncNum"));
        comExcelParams.add (new ComExcelParam (3, 5, "maxSyncWaitNum"));
        comExcelParams.add (new ComExcelParam (3, 7, "maxAsyncWaitNum"));
        comExcelParams.add (new ComExcelParam (4, 1, "userId"));
        comExcelParams.add (new ComExcelParam (4, 3, "userName"));

        HSSFSheet sheet = workbook.createSheet (map.get ("serviceName"));

        //将前面样式内容复制到下载表中
        int i = 0; // 必须放外面
        for (; i < 11; i++) {
            try {
                ExcelCopyUtils.copyRow (sheet.createRow (i), sourceSheet.getRow (i), sheet.createDrawingPatriarch (), workbook);
            } catch (Exception e) {
                e.printStackTrace ();
            }
        }

        for (ComExcelParam comExcelParam : comExcelParams) {
            try {
                ExcelCopyUtils.setCellValue (sheet, comExcelParam.getRowNum (), comExcelParam.getCellNum (), map.get (comExcelParam.getName ()));
            } catch (Exception e) {
                e.printStackTrace ();
            }
        }

        this.setWorkbookSheetPart (sheet, iqApplication, sourceSheet, workbook, new IqIndexDto (i, 20, 32));

        return workbook;
    }

    public void setWorkbookSheet(HSSFWorkbook workbook, HSSFSheet sourceSheet, List<ComExcelParam> comExcelParams, IqApplication iqApplication) {

        iqApplication = iqApplicationMapper.select (iqApplication.getPkId ());
        HSSFSheet sheet = workbook.createSheet (iqApplication.getName ());

        //将前面样式内容复制到下载表中
        int i = 0; // 必须放外面
        for (; i < 11; i++) {
            try {
                ExcelCopyUtils.copyRow (sheet.createRow (i), sourceSheet.getRow (i), sheet.createDrawingPatriarch (), workbook);
            } catch (Exception e) {
                e.printStackTrace ();
            }
        }

        //设置元数据名
        iqApplication.setMdId (iqMetadataMapper.select (iqApplication.getMdId ()).getName ());
        for (ComExcelParam comExcelParam : comExcelParams) {
            try {
                Field field = iqApplication.getClass ().getDeclaredField (comExcelParam.getName ());
                field.setAccessible (true);
                ExcelCopyUtils.setCellValue (sheet, comExcelParam.getRowNum (), comExcelParam.getCellNum (),
                        field.get (iqApplication) == null ? "" : field.get (iqApplication).toString ());
            } catch (Exception e) {
                e.printStackTrace ();
            }
        }

        IqIndexDto iqIndexDto = new IqIndexDto (i, 16, 24);
        this.setWorkbookSheetPart (sheet, iqApplication, sourceSheet, workbook, iqIndexDto);
    }

    public void setWorkbookSheetPart(HSSFSheet sheet, IqApplication iqApplication, HSSFSheet sourceSheet, HSSFWorkbook workbook, IqIndexDto iqIndexDto) {
        HSSFRow row;
        HSSFCell cell;
        int rowIndex = iqIndexDto.getRowIndex ();
        List<IqAppQueryCol> iqAppQueryCols = iqAppQueryColService.selectByAppId (iqApplication.getPkId ());
        if (iqAppQueryCols.size () > 0) {
            for (IqAppQueryCol iqAppQueryCol : iqAppQueryCols) {
                row = sheet.createRow (rowIndex);
                cell = row.createCell (0);
                cell.setCellValue (iqAppQueryCol.getSeq ());
                cell = row.createCell (1);
                cell.setCellValue (iqAppQueryCol.getName ());
                cell = row.createCell (2);
                cell.setCellValue (iqAppQueryCol.getDescribe ());
                cell = row.createCell (3);
                cell.setCellValue (iqAppQueryCol.getOperator ());
                cell = row.createCell (4);
                cell.setCellValue (iqAppQueryCol.getType ());
                cell = row.createCell (5);
                cell.setCellValue (iqAppQueryCol.getLength ());
                cell = row.createCell (6);
                cell.setCellValue (iqAppQueryCol.getDefaultVal ());
                cell = row.createCell (7);
                cell.setCellValue (iqAppQueryCol.getLabel ());
                cell = row.createCell (8);
                cell.setCellValue (iqAppQueryCol.getIsNeed ().equals ("1") ? "否" : "是");
                cell = row.createCell (9);
                cell.setCellValue (iqAppQueryCol.getIsOfferOut ().equals ("1") ? "否" : "是");
                cell = row.createCell (10);
                cell.setCellValue (iqAppQueryCol.getNote ());
                rowIndex++;
            }
        }
        try {
            ExcelCopyUtils.copyRow (sheet.createRow (rowIndex++), sourceSheet.getRow (iqIndexDto.getReturnTitleIndex ()), sheet.createDrawingPatriarch (), workbook);
            ExcelCopyUtils.copyRow (sheet.createRow (rowIndex++), sourceSheet.getRow (iqIndexDto.getReturnTitleIndex () + 1), sheet.createDrawingPatriarch (), workbook);
        } catch (Exception e) {
            e.printStackTrace ();
        }
        List<IqAppReturnCol> iqAppReturnCols = iqAppReturnColService.selectByAppId (iqApplication.getPkId ());
        if (iqAppReturnCols.size () > 0) {
            for (IqAppReturnCol iqAppReturnCol : iqAppReturnCols) {
                row = sheet.createRow (rowIndex);
                cell = row.createCell (0);
                cell.setCellValue (iqAppReturnCol.getSeq ());
                cell = row.createCell (1);
                cell.setCellValue (iqAppReturnCol.getName ());
                cell = row.createCell (2);
                cell.setCellValue (iqAppReturnCol.getDescribe ());
                cell = row.createCell (3);
                cell.setCellValue (iqAppReturnCol.getType ());
                cell = row.createCell (4);
                cell.setCellValue (iqAppReturnCol.getLength ());
                cell = row.createCell (5);
                cell.setCellValue (iqAppReturnCol.getStats ());
                cell = row.createCell (6);
                cell.setCellValue (iqAppReturnCol.getLabel ());
                cell = row.createCell (7);
                cell.setCellValue (iqAppReturnCol.getNote ());
                rowIndex++;
            }
        }

        try {
            ExcelCopyUtils.copyRow (sheet.createRow (rowIndex++), sourceSheet.getRow (iqIndexDto.getOrderTitleIndex ()), sheet.createDrawingPatriarch (), workbook);
            ExcelCopyUtils.copyRow (sheet.createRow (rowIndex++), sourceSheet.getRow (iqIndexDto.getOrderTitleIndex () + 1), sheet.createDrawingPatriarch (), workbook);
        } catch (Exception e) {
            e.printStackTrace ();
        }
        List<IqAppOrderCol> iqAppOrderCols = iqAppOrderColService.selectByAppId (iqApplication.getPkId ());
        if (iqAppOrderCols.size () > 0) {
            for (IqAppOrderCol iqAppOrderCol : iqAppOrderCols) {
                row = sheet.createRow (rowIndex);
                cell = row.createCell (0);
                cell.setCellValue (iqAppOrderCol.getSeq ());
                cell = row.createCell (1);
                cell.setCellValue (iqAppOrderCol.getName ());
                cell = row.createCell (2);
                cell.setCellValue (iqAppOrderCol.getDescribe ());
                cell = row.createCell (3);
                cell.setCellValue (iqAppOrderCol.getType ());
                cell = row.createCell (4);
                cell.setCellValue (iqAppOrderCol.getOrderType ());
                cell = row.createCell (5);
                cell.setCellValue (iqAppOrderCol.getNote ());
                rowIndex++;
            }
        }
    }

}
