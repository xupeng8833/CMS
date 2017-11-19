package com.system.dao;

import com.system.entity.UserEntity;

/**
 * 用户
 * 
 */
public interface UserDao extends BaseDao<UserEntity> {

    UserEntity queryByMobile(String mobile);
}
