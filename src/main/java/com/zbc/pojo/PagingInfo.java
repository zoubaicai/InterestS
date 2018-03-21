package com.zbc.pojo;

public class PagingInfo {

    private Long id;

    private int offset;

    private int rows;

    private String searchStr;

    private byte verifyFlag;

    public byte getVerifyFlag() {
        return verifyFlag;
    }

    public void setVerifyFlag(byte verifyFlag) {
        this.verifyFlag = verifyFlag;
    }

    public String getSearchStr() {
        return searchStr;
    }

    public void setSearchStr(String searchStr) {
        this.searchStr = searchStr;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }
}
