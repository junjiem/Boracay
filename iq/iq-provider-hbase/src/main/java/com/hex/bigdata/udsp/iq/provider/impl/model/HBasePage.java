package com.hex.bigdata.udsp.iq.provider.impl.model;

import java.util.List;
import java.util.Map;

/**
 * HBase查询的分页类
 *
 */
public class HBasePage {
    private List<Map<String, String>> records; // 每页记录集合

    private int pageSize = 10; // 每页显示条数
    private int pageIndex = 1; // 当前页

    private long totalCount; // 总记录数
    private long totalPage; // 总页数

    private String startRow; // 开始rowkey
    private String stopRow; // 结束rowkey

    public HBasePage() {
        super();
    }

    public HBasePage(int pageSize, int pageIndex, String startRow, String stopRow) {
        this.pageSize = pageSize;
        this.pageIndex = pageIndex;
        this.startRow = startRow;
        this.stopRow = stopRow;
    }

    public HBasePage(List<Map<String, String>> records, int pageSize, int pageIndex, long totalCount) {
        this.records = records;
        this.pageSize = pageSize;
        this.pageIndex = pageIndex;
        this.totalCount = totalCount;
    }

    public long getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(long totalPage) {
        this.totalPage = totalPage;
    }

    public List<Map<String, String>> getRecords() {
        return records;
    }

    public void setRecords(List<Map<String, String>> records) {
        this.records = records;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
        this.totalPage = totalCount % pageSize == 0 ? totalCount / pageSize
                : (totalCount / pageSize + 1);
    }

    public String getStartRow() {
        return startRow;
    }

    public void setStartRow(String startRow) {
        this.startRow = startRow;
    }

    public String getStopRow() {
        return stopRow;
    }

    public void setStopRow(String stopRow) {
        this.stopRow = stopRow;
    }
}
