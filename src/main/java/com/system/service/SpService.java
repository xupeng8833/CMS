package com.system.service;

import com.system.entity.OpsCustomerEntity;
import com.system.entity.SpEntity;
import com.system.entity.SpPriceEntity;

import java.util.List;
import java.util.Map;

/**
 * 商品
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-28 20:59:52
 */
public interface SpService {

	SpEntity queryObject(String spId);

	List<SpEntity> queryList(Map<String, Object> map);

	List<SpPriceEntity> queryListJg(Map<String, Object> map);
	
	List<OpsCustomerEntity> queryListMember(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);

	int queryTotalJg(Map<String, Object> map);
	
	int queryTotalMember(Map<String, Object> map);

	void save(SpEntity sp);

	void update(SpEntity sp);

	void delete(String spId);
	
	void memberDelete(String userId);

	void deleteBatch(String[] spIds);

	void savePrice(SpPriceEntity sp);

	void updatePrice(SpPriceEntity sp);
}
