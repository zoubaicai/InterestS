package com.zbc.service.impl;

import com.zbc.dao.SubstanceLocationDAO;
import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.SubstanceLocationPO;
import com.zbc.service.SubstanceLocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("substanceLocationService")
public class SubstanceLocationServiceImpl implements SubstanceLocationService {

    @Autowired
    private SubstanceLocationDAO substanceLocationDAO;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return substanceLocationDAO.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SubstanceLocationPO record) {
        return substanceLocationDAO.insert(record);
    }

    @Override
    public int insertSelective(SubstanceLocationPO record) {
        return substanceLocationDAO.insertSelective(record);
    }

    @Override
    public SubstanceLocationPO selectByPrimaryKey(Long id) {
        return substanceLocationDAO.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SubstanceLocationPO record) {
        return substanceLocationDAO.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SubstanceLocationPO record) {
        return substanceLocationDAO.updateByPrimaryKey(record);
    }

    @Override
    public List<SubstanceLocationPO> listByDistance(PagingInfo pagingInfo) {
        return substanceLocationDAO.listByDistance(pagingInfo);
    }
}
