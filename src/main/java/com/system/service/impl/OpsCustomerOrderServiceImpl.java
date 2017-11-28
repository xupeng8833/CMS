package com.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.system.dao.OpsCustomerOrderDao;
import com.system.entity.OpsCustomerOrderEntity;
import com.system.service.OpsCustomerOrderService;



@Service("opsCustomerOrderService")
public class OpsCustomerOrderServiceImpl implements OpsCustomerOrderService {
	@Autowired
	private OpsCustomerOrderDao opsCustomerOrderDao;
	
	@Override
	public OpsCustomerOrderEntity queryObject(Long opsCustomerOrderId){
		return opsCustomerOrderDao.queryObject(opsCustomerOrderId);
	}
	
	@Override
	public List<OpsCustomerOrderEntity> queryList(Map<String, Object> map){
		return opsCustomerOrderDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return opsCustomerOrderDao.queryTotal(map);
	}
	
	@Override
	public void save(OpsCustomerOrderEntity opsCustomerOrder){
		opsCustomerOrderDao.save(opsCustomerOrder);
	}
	
	@Override
	public void update(OpsCustomerOrderEntity opsCustomerOrder){
		opsCustomerOrderDao.update(opsCustomerOrder);
	}
	
	@Override
	public void delete(Long opsCustomerOrderId){
		opsCustomerOrderDao.delete(opsCustomerOrderId);
	}
	
	@Override
	public void deleteBatch(Long[] opsCustomerOrderIds){
		opsCustomerOrderDao.deleteBatch(opsCustomerOrderIds);
	}
	
}
