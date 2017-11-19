package com.system.dao;

import com.system.entity.TokenEntity;

/**
 * 用户Token
 * 
 */
public interface TokenDao extends BaseDao<TokenEntity> {
    
    TokenEntity queryByUserId(Long userId);

    TokenEntity queryByToken(String token);
	
}
