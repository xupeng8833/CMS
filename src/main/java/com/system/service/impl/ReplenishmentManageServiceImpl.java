package com.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.system.dao.ReplenishmentManageDao;
import com.system.entity.ReplenishmentManageEntity;
import com.system.service.ReplenishmentManageService;



@Service("replenishmentManageService")
public class ReplenishmentManageServiceImpl implements ReplenishmentManageService {
	@Autowired
	private ReplenishmentManageDao replenishmentManageDao;
	
	@Override
	public ReplenishmentManageEntity queryObject(Long opsReplenishmentNum){
		return replenishmentManageDao.queryObject(opsReplenishmentNum);
	}
	
	@Override
	public List<ReplenishmentManageEntity> queryList(Map<String, Object> map){
		return replenishmentManageDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return replenishmentManageDao.queryTotal(map);
	}
	
	@Override
	public void save(ReplenishmentManageEntity replenishmentManage){
		replenishmentManageDao.save(replenishmentManage);
	}
	
	@Override
	public void update(ReplenishmentManageEntity replenishmentManage){
		replenishmentManageDao.update(replenishmentManage);
	}
	
	@Override
	public void delete(Long opsReplenishmentNum){
		replenishmentManageDao.delete(opsReplenishmentNum);
	}
	
	@Override
	public void deleteBatch(Long[] opsReplenishmentNums){
		replenishmentManageDao.deleteBatch(opsReplenishmentNums);
	}
	
}
