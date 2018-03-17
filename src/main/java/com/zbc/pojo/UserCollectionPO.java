package com.zbc.pojo;

import java.sql.Timestamp;

public class UserCollectionPO {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user_collection.id
     *
     * @mbg.generated
     */
    private Long id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user_collection.target_substance_id
     *
     * @mbg.generated
     */
    private Long targetSubstanceId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user_collection.belong_user_id
     *
     * @mbg.generated
     */
    private Long belongUserId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user_collection.gmt_create
     *
     * @mbg.generated
     */
    private Timestamp gmtCreate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column user_collection.gmt_modified
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
     * This method returns the value of the database column user_collection.id
     *
     * @return the value of user_collection.id
     *
     * @mbg.generated
     */
    public Long getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user_collection.id
     *
     * @param id the value for user_collection.id
     *
     * @mbg.generated
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user_collection.target_substance_id
     *
     * @return the value of user_collection.target_substance_id
     *
     * @mbg.generated
     */
    public Long getTargetSubstanceId() {
        return targetSubstanceId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user_collection.target_substance_id
     *
     * @param targetSubstanceId the value for user_collection.target_substance_id
     *
     * @mbg.generated
     */
    public void setTargetSubstanceId(Long targetSubstanceId) {
        this.targetSubstanceId = targetSubstanceId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user_collection.belong_user_id
     *
     * @return the value of user_collection.belong_user_id
     *
     * @mbg.generated
     */
    public Long getBelongUserId() {
        return belongUserId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user_collection.belong_user_id
     *
     * @param belongUserId the value for user_collection.belong_user_id
     *
     * @mbg.generated
     */
    public void setBelongUserId(Long belongUserId) {
        this.belongUserId = belongUserId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user_collection.gmt_create
     *
     * @return the value of user_collection.gmt_create
     *
     * @mbg.generated
     */
    public Timestamp getGmtCreate() {
        return gmtCreate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user_collection.gmt_create
     *
     * @param gmtCreate the value for user_collection.gmt_create
     *
     * @mbg.generated
     */
    public void setGmtCreate(Timestamp gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column user_collection.gmt_modified
     *
     * @return the value of user_collection.gmt_modified
     *
     * @mbg.generated
     */
    public Timestamp getGmtModified() {
        return gmtModified;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column user_collection.gmt_modified
     *
     * @param gmtModified the value for user_collection.gmt_modified
     *
     * @mbg.generated
     */
    public void setGmtModified(Timestamp gmtModified) {
        this.gmtModified = gmtModified;
    }
}