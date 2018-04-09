package com.zbc.pojo;

import java.sql.Timestamp;

public class RecommendPO {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column recommend.id
     *
     * @mbg.generated
     */
    private Long id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column recommend.recommend_id
     *
     * @mbg.generated
     */
    private Long recommendId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column recommend.gmt_create
     *
     * @mbg.generated
     */
    private Timestamp gmtCreate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column recommend.gmt_modified
     *
     * @mbg.generated
     */
    private Timestamp gmtModified;

    private SubstanceInfoPO substanceInfoPO;

    public SubstanceInfoPO getSubstanceInfoPO() {
        return substanceInfoPO;
    }

    public void setSubstanceInfoPO(SubstanceInfoPO substanceInfoPO) {
        this.substanceInfoPO = substanceInfoPO;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommend.id
     *
     * @return the value of recommend.id
     *
     * @mbg.generated
     */
    public Long getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommend.id
     *
     * @param id the value for recommend.id
     *
     * @mbg.generated
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommend.recommend_id
     *
     * @return the value of recommend.recommend_id
     *
     * @mbg.generated
     */
    public Long getRecommendId() {
        return recommendId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommend.recommend_id
     *
     * @param recommendId the value for recommend.recommend_id
     *
     * @mbg.generated
     */
    public void setRecommendId(Long recommendId) {
        this.recommendId = recommendId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommend.gmt_create
     *
     * @return the value of recommend.gmt_create
     *
     * @mbg.generated
     */
    public Timestamp getGmtCreate() {
        return gmtCreate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommend.gmt_create
     *
     * @param gmtCreate the value for recommend.gmt_create
     *
     * @mbg.generated
     */
    public void setGmtCreate(Timestamp gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column recommend.gmt_modified
     *
     * @return the value of recommend.gmt_modified
     *
     * @mbg.generated
     */
    public Timestamp getGmtModified() {
        return gmtModified;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column recommend.gmt_modified
     *
     * @param gmtModified the value for recommend.gmt_modified
     *
     * @mbg.generated
     */
    public void setGmtModified(Timestamp gmtModified) {
        this.gmtModified = gmtModified;
    }
}