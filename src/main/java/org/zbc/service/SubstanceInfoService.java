package org.zbc.service;

import org.zbc.pojo.SubstanceInfoPO;

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

    //SubstanceInfoPO selectByPrimaryKey(Long id);

    //int updateByPrimaryKeySelective(SubstanceInfoPO record);

    //int updateByPrimaryKey(SubstanceInfoPO record);
}
