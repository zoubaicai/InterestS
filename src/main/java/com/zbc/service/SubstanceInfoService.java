package com.zbc.service;

import com.zbc.pojo.SubstanceInfoPO;

public interface SubstanceInfoService {

    //int deleteByPrimaryKey(Long id);


    /**
     * 插入一条记录
     * @param record
     * @return
     */
    int insert(SubstanceInfoPO record);

    /**
     * 选择插入
     * @param record
     * @return
     */
    int insertSelective(SubstanceInfoPO record);

    /**
     * 同时插入两个表中各一条记录
     * @param record
     * @param content
     * @return
     */
    int insertSelective(SubstanceInfoPO record,String content);

    /**
     *
     * @param id
     * @return
     */
    SubstanceInfoPO selectIncludeContent(Long id);

    /**
     * 根据用户id查询该用户多少条substance
     * @param id
     * @return
     */
    int countByUserId(Long id);

    //SubstanceInfoPO selectByPrimaryKey(Long id);

    //int updateByPrimaryKeySelective(SubstanceInfoPO record);

    //int updateByPrimaryKey(SubstanceInfoPO record);
}
