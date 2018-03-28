package com.zbc.service;

import com.zbc.pojo.MsgInfoPO;
import com.zbc.pojo.PagingInfo;

import java.util.List;

public interface MsgInfoService {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_info
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_info
     *
     * @mbg.generated
     */
    int insert(MsgInfoPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_info
     *
     * @mbg.generated
     */
    int insertSelective(MsgInfoPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_info
     *
     * @mbg.generated
     */
    MsgInfoPO selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_info
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(MsgInfoPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table msg_info
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(MsgInfoPO record);

    /**
     * 根据所属用户id，进行分页查询
     * @param pagingInfo
     * @return
     */
    List<MsgInfoPO> listByBelongUserId(PagingInfo pagingInfo);

    /**
     * 根据所属用户id，查询一共有多少条记录
     * @param id
     * @return
     */
    int countByBelongUserId(long id);
}