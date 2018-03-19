package com.zbc.service.impl;

import com.zbc.dao.SubstanceInfoDAO;
import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.SubstanceInfoPO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.zbc.dao.SubstanceContentDAO;
import com.zbc.pojo.SubstanceContentPO;
import com.zbc.service.SubstanceInfoService;

import java.util.List;

@Service("substanceInfoService")
public class SubstanceInfoServiceImpl implements SubstanceInfoService {

    @Autowired
    private SubstanceInfoDAO substanceInfoDAO;

    @Autowired
    // 这个DAO用来插入内容对应的text列，开启事务执行
    private SubstanceContentDAO substanceContentDAO;

    @Override
    public int insert(SubstanceInfoPO record) {
        return substanceInfoDAO.insert(record);
    }

    @Override
    public int insertSelective(SubstanceInfoPO record) {
        return substanceInfoDAO.insertSelective(record);
    }

    // 开启事务，插入info表的时候同时插入到content表一条记录
    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class,timeout = 1,isolation = Isolation.DEFAULT)
    public int insertSelective(SubstanceInfoPO record,String content) {
        int res = substanceInfoDAO.insertSelective(record);
        SubstanceContentPO po = new SubstanceContentPO();
        po.setBelongSubstanceId(record.getId());
        po.setContent(content);
        res += substanceContentDAO.insert(po);
        return res;
    }

    @Override
    public SubstanceInfoPO selectIncludeContent(Long id) {
        SubstanceInfoPO temp = substanceInfoDAO.selectIncludeContent(id);
        if (null == temp){
            return new SubstanceInfoPO();
        } else {
            return temp;
        }
    }

    @Override
    public int countByUserId(Long id) {
        return substanceInfoDAO.countByUserId(id);
    }

    @Override
    public List<SubstanceInfoPO> listByBelongUserId(PagingInfo pagingInfo) {
        return substanceInfoDAO.listByBelongUserId(pagingInfo);
    }
}
