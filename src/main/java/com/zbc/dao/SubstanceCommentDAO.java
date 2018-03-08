package com.zbc.dao;

import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.SubstanceCommentPO;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface SubstanceCommentDAO {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table substance_comment
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table substance_comment
     *
     * @mbg.generated
     */
    int insert(SubstanceCommentPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table substance_comment
     *
     * @mbg.generated
     */
    int insertSelective(SubstanceCommentPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table substance_comment
     *
     * @mbg.generated
     */
    SubstanceCommentPO selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table substance_comment
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(SubstanceCommentPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table substance_comment
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(SubstanceCommentPO record);

    /**
     * 根据substanceId得到该内容有多少评论
     * @param pi
     * @return
     */
    List<SubstanceCommentPO> listBySubstanceId(PagingInfo pi);

    /**
     * 根据id获取总共有多少条评论
     * @param id
     * @return
     */
    int countByPrimaryKey(Long id);
}