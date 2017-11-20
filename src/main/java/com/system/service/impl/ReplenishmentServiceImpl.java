package com.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.system.dao.ReplenishmentDao;
import com.system.entity.ReplenishmentEntity;
import com.system.service.ReplenishmentService;



@Service("replenishmentService")
public class ReplenishmentServiceImpl implements ReplenishmentService {
	@Autowired
	private ReplenishmentDao replenishmentDao;
	
	@Override
	public ReplenishmentEntity queryObject(Long id){
		return replenishmentDao.queryObject(id);
	}
	
	@Override
	public List<ReplenishmentEntity> queryList(Map<String, Object> map){
		return replenishmentDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return replenishmentDao.queryTotal(map);
	}
	
	@Override
	public void save(ReplenishmentEntity replenishment){
		replenishmentDao.save(replenishment);
	}
	
	@Override
	public void update(ReplenishmentEntity replenishment){
		replenishmentDao.update(replenishment);
	}
	
	@Override
	public void delete(Long id){
		replenishmentDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		replenishmentDao.deleteBatch(ids);
	}
	
}
