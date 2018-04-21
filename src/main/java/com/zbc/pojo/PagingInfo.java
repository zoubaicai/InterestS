package com.zbc.pojo;

public class PagingInfo {

    private Long id;

    private Long belongUserId;

    private int offset;

    private int rows;

    private String searchStr;

    private byte verifyFlag;

    private double longitude;

    private double latitude;

    private int classFlag;

    public Long getBelongUserId() {
        return belongUserId;
    }

    public void setBelongUserId(Long belongUserId) {
        this.belongUserId = belongUserId;
    }

    public int getClassFlag() {
        return classFlag;
    }

    public void setClassFlag(int classFlag) {
        this.classFlag = classFlag;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

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
