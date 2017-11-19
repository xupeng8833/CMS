package com.system.service;

import com.system.entity.OrderEntity;

import java.util.List;
import java.util.Map;

/**
 * 订单表
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-19 17:01:01
 */
public interface OrderService {
	
	OrderEntity queryObject(Long id);
	
	List<OrderEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(OrderEntity order);
	
	void update(OrderEntity order);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
