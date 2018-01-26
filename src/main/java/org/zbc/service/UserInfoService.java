package org.zbc.service;

import org.zbc.pojo.UserInfoPO;

public interface UserInfoService {
    /**
     * 根据id获得用户信息
     * @param id
     * @return
     */
    UserInfoPO selectByPrimaryKey(Long id);

    /**
     * 通过邮箱查询用户信息
     * @param email
     * @return
     */
    UserInfoPO selectByEmail(String email);

    /**
     * 通过邮箱和密码查询用户
     * @param record
     * @return
     */
    UserInfoPO selectByUserInfo(UserInfoPO record);

    /**
     * 通过邮箱和注册代码查询用户
     * @param record
     * @return
     */
    UserInfoPO selectByCodeAndEmail(UserInfoPO record);

    /**
     * 根据对象包含的内容更新用户信息，属性为空表示不更新
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(UserInfoPO record);

    /**
     * 根据对象属性是否为空，插入一条用户信息
     * @param record
     * @return
     */
    int insertSelective(UserInfoPO record);

}
