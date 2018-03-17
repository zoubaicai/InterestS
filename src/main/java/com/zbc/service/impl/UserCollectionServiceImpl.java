package com.zbc.service.impl;

import com.zbc.dao.UserCollectionDAO;
import com.zbc.pojo.PagingInfo;
import com.zbc.service.UserCollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zbc.pojo.UserCollectionPO;

import java.util.List;

@Service("userCollectionService")
public class UserCollectionServiceImpl implements UserCollectionService {

    @Autowired
    private UserCollectionDAO userCollectionDAO;

    @Override
    public int insertSelective(UserCollectionPO record) {
        return userCollectionDAO.insertSelective(record);
    }

    @Override
    public List<UserCollectionPO> listByUserId(Long id) {
        return userCollectionDAO.listByUserId(id);
    }

    @Override
    public int countByUserId(Long id) {
        return userCollectionDAO.countByUserId(id);
    }

    @Override
    public UserCollectionPO selectByBothId(UserCollectionPO record) {
        UserCollectionPO temp = userCollectionDAO.selectByBothId(record);
        if (null == temp){
            return new UserCollectionPO();
        } else {
            return temp;
        }
    }

    @Override
    public List<UserCollectionPO> listByBelongUserId(PagingInfo pagingInfo) {
        return userCollectionDAO.listByBelongUserId(pagingInfo);
    }
}
