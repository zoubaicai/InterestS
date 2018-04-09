package com.zbc.service.impl;

import com.zbc.dao.RecommendDAO;
import com.zbc.pojo.PagingInfo;
import com.zbc.pojo.RecommendPO;
import com.zbc.service.RecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("recommendService")
public class RecommendServiceImpl implements RecommendService {

    @Autowired
    private RecommendDAO recommendDAO;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return recommendDAO.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(RecommendPO record) {
        return recommendDAO.insert(record);
    }

    @Override
    public int insertSelective(RecommendPO record) {
        return recommendDAO.insertSelective(record);
    }

    @Override
    public RecommendPO selectByPrimaryKey(Long id) {
        return recommendDAO.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(RecommendPO record) {
        return recommendDAO.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(RecommendPO record) {
        return recommendDAO.updateByPrimaryKey(record);
    }

    @Override
    public List<RecommendPO> listLatestTwoItem(PagingInfo pagingInfo) {
        return recommendDAO.listLatestTwoItem(pagingInfo);
    }
}
