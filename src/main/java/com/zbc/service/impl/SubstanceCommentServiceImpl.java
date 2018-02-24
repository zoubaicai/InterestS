package com.zbc.service.impl;

import com.zbc.dao.SubstanceCommentDAO;
import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.SubstanceCommentPO;
import com.zbc.service.SubstanceCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("substanceCommentService")
public class SubstanceCommentServiceImpl implements SubstanceCommentService {

    @Autowired
    private SubstanceCommentDAO substanceCommentDAO;

    @Override
    public int insertSelective(SubstanceCommentPO record) {
        return substanceCommentDAO.insertSelective(record);
    }

    @Override
    public List<SubstanceCommentPO> listBySubstanceId(PagingInfo pi) {
        return listBySubstanceId(pi);
    }
}
