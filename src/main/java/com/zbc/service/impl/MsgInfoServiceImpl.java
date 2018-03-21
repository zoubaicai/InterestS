package com.zbc.service.impl;

import com.zbc.dao.MsgInfoDAO;
import com.zbc.pojo.MsgInfoPO;
import com.zbc.pojo.PagingInfo;
import com.zbc.service.MsgInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("msgInfoService")
public class MsgInfoServiceImpl implements MsgInfoService {
    @Autowired
    private MsgInfoDAO msgInfoDAO;

    @Override
    public int deleteByPrimaryKey(Long id) {
        return msgInfoDAO.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(MsgInfoPO record) {
        return msgInfoDAO.insert(record);
    }

    @Override
    public int insertSelective(MsgInfoPO record) {
        return msgInfoDAO.insertSelective(record);
    }

    @Override
    public MsgInfoPO selectByPrimaryKey(Long id) {
        MsgInfoPO temp = msgInfoDAO.selectByPrimaryKey(id);
        if (null == temp){
            return new MsgInfoPO();
        } else {
            return temp;
        }
    }

    @Override
    public int updateByPrimaryKeySelective(MsgInfoPO record) {
        return msgInfoDAO.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(MsgInfoPO record) {
        return msgInfoDAO.updateByPrimaryKey(record);
    }

    @Override
    public List<MsgInfoPO> listByBelongUserId(PagingInfo pagingInfo) {
        return msgInfoDAO.listByBelongUserId(pagingInfo);
    }

    @Override
    public int countByBelongUserId(long id) {
        return msgInfoDAO.countByBelongUserId(id);
    }
}
