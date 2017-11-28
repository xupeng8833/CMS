package com.system.service;

import com.system.entity.ReplenishmentManageEntity;

import java.util.List;
import java.util.Map;

/**
 * 补货管理
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-28 16:51:24
 */
public interface ReplenishmentManageService {
	
	ReplenishmentManageEntity queryObject(Long opsReplenishmentNum);
	
	List<ReplenishmentManageEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ReplenishmentManageEntity replenishmentManage);
	
	void update(ReplenishmentManageEntity replenishmentManage);
	
	void delete(Long opsReplenishmentNum);
	
	void deleteBatch(Long[] opsReplenishmentNums);
}
