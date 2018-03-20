package com.zbc.service.impl;

import com.zbc.dao.SubstanceContentDAO;
import com.zbc.pojo.SubstanceContentPO;
import com.zbc.service.SubstanceContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("substanceContentService")
public class SubstanceContentServiceImpl implements SubstanceContentService {
    @Autowired
    private SubstanceContentDAO substanceContentDAO;

    @Override
    public int insert(SubstanceContentPO record) {
        return substanceContentDAO.insert(record);
    }

    @Override
    public int insertSelective(SubstanceContentPO record) {
        return substanceContentDAO.insertSelective(record);
    }

    @Override
    public int updateByBelongSubstanceIdSelective(SubstanceContentPO record) {
        return substanceContentDAO.updateByBelongSubstanceIdSelective(record);
    }
}
