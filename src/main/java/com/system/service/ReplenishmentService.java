package com.system.service;

import com.system.entity.ReplenishmentEntity;

import java.util.List;
import java.util.Map;

/**
 * 保修信息管理
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-20 23:19:43
 */
public interface ReplenishmentService {
	
	ReplenishmentEntity queryObject(Long id);
	
	List<ReplenishmentEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ReplenishmentEntity replenishment);
	
	void update(ReplenishmentEntity replenishment);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
