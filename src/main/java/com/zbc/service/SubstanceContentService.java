package com.zbc.service;

import com.zbc.pojo.SubstanceContentPO;

public interface SubstanceContentService {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table substance_content
     *
     * @mbg.generated
     */
    //int deleteByPrimaryKey(Long id);

    /**
     * 插入一条记录
     * @param record
     * @return
     */
    int insert(SubstanceContentPO record);

    /**
     * 选择插入一条记录
     * @param record
     * @return
     */
    int insertSelective(SubstanceContentPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table substance_content
     *
     * @mbg.generated
     */
    //SubstanceContentPO selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table substance_content
     *
     * @mbg.generated
     */
    int updateByBelongSubstanceIdSelective(SubstanceContentPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table substance_content
     *
     * @mbg.generated
     */
    //int updateByPrimaryKeyWithBLOBs(SubstanceContentPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table substance_content
     *
     * @mbg.generated
     */
    //int updateByPrimaryKey(SubstanceContentPO record);
}
