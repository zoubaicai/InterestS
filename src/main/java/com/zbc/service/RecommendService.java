package com.zbc.service;

import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.RecommendPO;

import java.util.List;

public interface RecommendService {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recommend
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recommend
     *
     * @mbg.generated
     */
    int insert(RecommendPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recommend
     *
     * @mbg.generated
     */
    int insertSelective(RecommendPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recommend
     *
     * @mbg.generated
     */
    RecommendPO selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recommend
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(RecommendPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table recommend
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(RecommendPO record);

    /**
     * 找出最新的两个作为主页的推荐
     * @param pagingInfo
     * @return
     */
    List<RecommendPO> listLatestTwoItem(PagingInfo pagingInfo);
}