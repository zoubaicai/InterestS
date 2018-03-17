package com.zbc.service.impl;

import com.zbc.pojo.GroupInfoPO;
import com.zbc.pojo.PagingInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zbc.dao.GroupInfoDAO;
import com.zbc.service.GroupInfoService;
import java.util.List;

@Service("groupInfoService")
public class GroupInfoServiceImpl implements GroupInfoService {

    @Autowired
    private GroupInfoDAO groupInfoDAO;

    @Override
    public int insertSelective(GroupInfoPO record) {
        return groupInfoDAO.insertSelective(record);
    }

    @Override
    public List<GroupInfoPO> listBySubstanceId(Long id) {
        return groupInfoDAO.listBySubstanceId(id);
    }

    @Override
    public List<GroupInfoPO> listByBelongUserId(PagingInfo pagingInfo) {
        return groupInfoDAO.listByBelongUserId(pagingInfo);
    }

    @Override
    public int countByUserId(Long id) {
        return groupInfoDAO.countByUserId(id);
    }

    @Override
    public GroupInfoPO selectByBothId(GroupInfoPO record) {
        GroupInfoPO temp = groupInfoDAO.selectByBothId(record);
        if (null == temp){
            return new GroupInfoPO();
        } else {
            return temp;
        }
    }
}
