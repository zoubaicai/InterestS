package com.zbc.service.impl;

import com.zbc.dao.SubstanceInfoDAO;
import com.zbc.dao.SubstanceLocationDAO;
import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.SubstanceInfoPO;
import com.zbc.pojo.SubstanceLocationPO;
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

    @Autowired
    // 这个DAO用来额外插入地址信息到location表
    private SubstanceLocationDAO substanceLocationDAO;

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
        SubstanceLocationPO po2 = new SubstanceLocationPO();
        po2.setBelongSubstanceId(record.getId());
        String[] locationInfo = record.getLocale().split(",");
        po2.setLocationText(locationInfo[0]);
        po2.setLongitude(Double.parseDouble(locationInfo[1]));
        po2.setLatitude(Double.parseDouble(locationInfo[2]));
        res += substanceLocationDAO.insertSelective(po2);
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

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class,timeout = 1,isolation = Isolation.DEFAULT)
    public int updateByPrimaryKeySelective(SubstanceInfoPO record,String content) {
        int res = substanceInfoDAO.updateByPrimaryKeySelective(record);
        SubstanceContentPO po = new SubstanceContentPO();
        po.setBelongSubstanceId(record.getId());
        po.setContent(content);
        res += substanceContentDAO.updateByBelongSubstanceIdSelective(po);
        SubstanceLocationPO po2 = new SubstanceLocationPO();
        po2.setBelongSubstanceId(record.getId());
        String[] locationInfo = record.getLocale().split(",");
        po2.setLocationText(locationInfo[0]);
        po2.setLongitude(Double.parseDouble(locationInfo[1]));
        po2.setLatitude(Double.parseDouble(locationInfo[2]));
        res += substanceLocationDAO.updateByPrimaryKeySelective(po2);
        return res;
    }

    @Override
    public int updateByPrimaryKeySelectiveOnly(SubstanceInfoPO record) {
        return substanceInfoDAO.updateByPrimaryKeySelective(record);
    }


    @Override
    public List<SubstanceInfoPO> listBySearchStr(PagingInfo pagingInfo) {
        return substanceInfoDAO.listBySearchStr(pagingInfo);
    }

    @Override
    public int countBySearchStr(String searchStr) {
        return substanceInfoDAO.countBySearchStr(searchStr);
    }

    @Override
    public List<SubstanceInfoPO> listIncludeContent(PagingInfo pagingInfo) {
        return substanceInfoDAO.listIncludeContent(pagingInfo);
    }

    @Override
    public int countAll(byte isVerified) {
        return substanceInfoDAO.countAll(isVerified);
    }

    @Override
    public List<SubstanceInfoPO> listByClassification(PagingInfo pagingInfo) {
        return substanceInfoDAO.listByClassification(pagingInfo);
    }

    @Override
    public int countByClassification(PagingInfo pagingInfo) {
        return substanceInfoDAO.countByClassification(pagingInfo);
    }
}
