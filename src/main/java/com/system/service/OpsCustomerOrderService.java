package com.system.service;

import com.system.entity.OpsCustomerOrderEntity;

import java.util.List;
import java.util.Map;

/**
 * 用户订单表
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-28 14:42:45
 */
public interface OpsCustomerOrderService {
	
	OpsCustomerOrderEntity queryObject(Long opsCustomerOrderId);
	
	List<OpsCustomerOrderEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(OpsCustomerOrderEntity opsCustomerOrder);
	
	void update(OpsCustomerOrderEntity opsCustomerOrder);
	
	void delete(Long opsCustomerOrderId);
	
	void deleteBatch(Long[] opsCustomerOrderIds);
}
