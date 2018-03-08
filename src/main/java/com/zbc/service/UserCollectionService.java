package com.zbc.service;

import com.zbc.pojo.UserCollectionPO;

import java.util.List;

public interface UserCollectionService {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_collection
     *
     * @mbg.generated
     */
   // int deleteByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_collection
     *
     * @mbg.generated
     */
  //  int insert(UserCollectionPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_collection
     *
     * @mbg.generated
     */
    int insertSelective(UserCollectionPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_collection
     *
     * @mbg.generated
     */
  //  UserCollectionPO selectByPrimaryKey(Long id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_collection
     *
     * @mbg.generated
     */
  //  int updateByPrimaryKeySelective(UserCollectionPO record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_collection
     *
     * @mbg.generated
     */
  //  int updateByPrimaryKey(UserCollectionPO record);

    /**
     * 根据用户id查询该用户有多少条collection记录,并返回一个list包含所有
     * @param id
     * @return
     */
    List<UserCollectionPO> listByUserId(Long id);

    /**
     * 根据用户id查询该用户有多少条collection记录
     * @param id
     * @return
     */
    int countByUserId(Long id);

    /**
     * 根据用户id和substance id返回是否有收藏记录
     * @param record
     * @return
     */
    UserCollectionPO selectByBothId(UserCollectionPO record);
}
