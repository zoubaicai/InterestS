package org.zbc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zbc.dao.SubstanceContentDAO;
import org.zbc.pojo.SubstanceContentPO;
import org.zbc.service.SubstanceContentService;

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
}
