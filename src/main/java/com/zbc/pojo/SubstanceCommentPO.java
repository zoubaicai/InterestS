package com.zbc.pojo;

import java.sql.Timestamp;

public class SubstanceCommentPO {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column substance_comment.id
     *
     * @mbg.generated
     */
    private Long id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column substance_comment.belong_substance_id
     *
     * @mbg.generated
     */
    private Long belongSubstanceId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column substance_comment.belong_user_id
     *
     * @mbg.generated
     */
    private Long belongUserId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column substance_comment.comment_content
     *
     * @mbg.generated
     */
    private String commentContent;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column substance_comment.gmt_create
     *
     * @mbg.generated
     */
    private Timestamp gmtCreate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column substance_comment.gmt_modified
     *
     * @mbg.generated
     */
    private Timestamp gmtModified;

    /**
     * 对应的用户信息
     */
    private UserInfoPO userInfoPO;

    public UserInfoPO getUserInfoPO() {
        return userInfoPO;
    }

    public void setUserInfoPO(UserInfoPO userInfoPO) {
        this.userInfoPO = userInfoPO;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column substance_comment.id
     *
     * @return the value of substance_comment.id
     *
     * @mbg.generated
     */
    public Long getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column substance_comment.id
     *
     * @param id the value for substance_comment.id
     *
     * @mbg.generated
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column substance_comment.belong_substance_id
     *
     * @return the value of substance_comment.belong_substance_id
     *
     * @mbg.generated
     */
    public Long getBelongSubstanceId() {
        return belongSubstanceId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column substance_comment.belong_substance_id
     *
     * @param belongSubstanceId the value for substance_comment.belong_substance_id
     *
     * @mbg.generated
     */
    public void setBelongSubstanceId(Long belongSubstanceId) {
        this.belongSubstanceId = belongSubstanceId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column substance_comment.belong_user_id
     *
     * @return the value of substance_comment.belong_user_id
     *
     * @mbg.generated
     */
    public Long getBelongUserId() {
        return belongUserId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column substance_comment.belong_user_id
     *
     * @param belongUserId the value for substance_comment.belong_user_id
     *
     * @mbg.generated
     */
    public void setBelongUserId(Long belongUserId) {
        this.belongUserId = belongUserId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column substance_comment.comment_content
     *
     * @return the value of substance_comment.comment_content
     *
     * @mbg.generated
     */
    public String getCommentContent() {
        return commentContent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column substance_comment.comment_content
     *
     * @param commentContent the value for substance_comment.comment_content
     *
     * @mbg.generated
     */
    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column substance_comment.gmt_create
     *
     * @return the value of substance_comment.gmt_create
     *
     * @mbg.generated
     */
    public Timestamp getGmtCreate() {
        return gmtCreate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column substance_comment.gmt_create
     *
     * @param gmtCreate the value for substance_comment.gmt_create
     *
     * @mbg.generated
     */
    public void setGmtCreate(Timestamp gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column substance_comment.gmt_modified
     *
     * @return the value of substance_comment.gmt_modified
     *
     * @mbg.generated
     */
    public Timestamp getGmtModified() {
        return gmtModified;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column substance_comment.gmt_modified
     *
     * @param gmtModified the value for substance_comment.gmt_modified
     *
     * @mbg.generated
     */
    public void setGmtModified(Timestamp gmtModified) {
        this.gmtModified = gmtModified;
    }
}