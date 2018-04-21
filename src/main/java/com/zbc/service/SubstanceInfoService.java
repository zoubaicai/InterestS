package com.zbc.service;

import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.SubstanceInfoPO;

import java.util.List;

public interface SubstanceInfoService {

    int deleteByPrimaryKey(Long id);

    /**
     * 根据id和belongUserId删除指定的条目
     * @param pagingInfo
     * @return
     */
    int deleteByTwoKey(PagingInfo pagingInfo);

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

    /**
     * 根据用户id获得指定 substance 列表
     * @param pagingInfo
     * @return
     */
    List<SubstanceInfoPO> listByBelongUserId(PagingInfo pagingInfo);

    //SubstanceInfoPO selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SubstanceInfoPO record,String content);


    int updateByPrimaryKeySelectiveOnly(SubstanceInfoPO record);
    //int updateByPrimaryKey(SubstanceInfoPO record);

    /**
     * 根据输入的字符串，在 substance_info 中查找相应的匹配项
     * @param pagingInfo
     * @return
     */
    List<SubstanceInfoPO> listBySearchStr(PagingInfo pagingInfo);

    /**
     * 根据搜索字符串，查找数据库中公有多少条数据
     * @param searchStr
     * @return
     */
    int countBySearchStr(String searchStr);

    /**
     * 分页查询，如果有searchStr 就添加模糊搜索
     * @param pagingInfo
     * @return
     */
    List<SubstanceInfoPO> listIncludeContent(PagingInfo pagingInfo);

    /**
     * 根据is_verified 返回行数
     * @param isVerified
     * @return
     */
    int countAll(byte isVerified);

    /**
     * 根据分类进行分页查询
     * @param pagingInfo
     * @return
     */
    List<SubstanceInfoPO> listByClassification(PagingInfo pagingInfo);

    /**
     * 根据分类查询公有多少条记录
     * @param pagingInfo
     * @return
     */
    int countByClassification(PagingInfo pagingInfo);
}
