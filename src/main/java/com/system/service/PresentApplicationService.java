package com.system.service;

import com.system.entity.PresentApplicationEntity;

import java.util.List;
import java.util.Map;

/**
 * 提现结算申请表
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-22 09:33:39
 */
public interface PresentApplicationService {
	
	PresentApplicationEntity queryObject(Long id);
	
	List<PresentApplicationEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PresentApplicationEntity presentApplication);
	
	void update(PresentApplicationEntity presentApplication);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
