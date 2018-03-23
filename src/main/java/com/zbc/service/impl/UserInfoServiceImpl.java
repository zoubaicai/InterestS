package com.zbc.service.impl;

import com.zbc.pojo.PagingInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zbc.dao.UserInfoDAO;
import com.zbc.pojo.UserInfoPO;
import com.zbc.service.UserInfoService;
import com.zbc.util.ParamsUtils;

import java.util.List;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private UserInfoDAO userInfoDAO;

    @Override
    public UserInfoPO selectByPrimaryKey(Long id) {
        if (!ParamsUtils.greaterThanZero(id)){
            return new UserInfoPO();
        }
        return userInfoDAO.selectByPrimaryKey(id);
    }

    @Override
    public UserInfoPO selectByEmail(String email) {
        if (!ParamsUtils.isMailAddress(email)){
            return new UserInfoPO();
        }
        UserInfoPO temp = userInfoDAO.selectByEmail(email);
        if (null == temp){
            return new UserInfoPO();
        } else {
            return temp;
        }
    }

    @Override
    public UserInfoPO selectByUserInfo(UserInfoPO record) {
        UserInfoPO temp = userInfoDAO.selectByUserInfo(record);
        if (null == temp){
            return new UserInfoPO();
        } else {
            return temp;
        }
    }

    @Override
    public UserInfoPO selectByCodeAndEmail(UserInfoPO record) {
        UserInfoPO temp = userInfoDAO.selectByCodeAndEmail(record);
        if (null == temp){
            return new UserInfoPO();
        } else {
            return temp;
        }
    }

    @Override
    public int updateByPrimaryKeySelective(UserInfoPO record) {
        if (!ParamsUtils.greaterThanZero(record.getId())){
            return 0;
        }
        return userInfoDAO.updateByPrimaryKeySelective(record);
    }

    @Override
    public int insertSelective(UserInfoPO record) {
        if (null != record.getId()){
            throw new IllegalArgumentException("user id is created automatic.");
        }
        return userInfoDAO.insertSelective(record);
    }

    @Override
    public List<UserInfoPO> listUserInfo(PagingInfo pagingInfo) {
        return userInfoDAO.listUserInfo(pagingInfo);
    }

    @Override
    public int countAll() {
        return userInfoDAO.countAll();
    }

}
