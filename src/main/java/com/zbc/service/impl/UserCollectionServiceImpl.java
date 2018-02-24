package com.zbc.service.impl;

import com.zbc.dao.UserCollectionDAO;
import com.zbc.service.UserCollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zbc.pojo.UserCollectionPO;

@Service("userCollectionService")
public class UserCollectionServiceImpl implements UserCollectionService {

    @Autowired
    private UserCollectionDAO userCollectionDAO;

    @Override
    public UserCollectionPO listByUserId(Long id) {
        return userCollectionDAO.listByUserId(id);
    }

    @Override
    public int countByUserId(Long id) {
        return userCollectionDAO.countByUserId(id);
    }
}
