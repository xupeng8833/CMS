package com.system.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.system.entity.SysUserEntity;
import com.system.utils.ShiroUtils;

/**
 * Controller公共组件
 * 
 */
public abstract class AbstractController {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	protected SysUserEntity getUser() {
		return ShiroUtils.getUserEntity();
	}

	protected Long getUserId() {
		return getUser().getUserId();
	}
}
