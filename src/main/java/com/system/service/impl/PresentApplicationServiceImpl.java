package com.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.system.dao.PresentApplicationDao;
import com.system.entity.PresentApplicationEntity;
import com.system.service.PresentApplicationService;



@Service("presentApplicationService")
public class PresentApplicationServiceImpl implements PresentApplicationService {
	@Autowired
	private PresentApplicationDao presentApplicationDao;
	
	@Override
	public PresentApplicationEntity queryObject(Long id){
		return presentApplicationDao.queryObject(id);
	}
	
	@Override
	public List<PresentApplicationEntity> queryList(Map<String, Object> map){
		return presentApplicationDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return presentApplicationDao.queryTotal(map);
	}
	
	@Override
	public void save(PresentApplicationEntity presentApplication){
		presentApplicationDao.save(presentApplication);
	}
	
	@Override
	public void update(PresentApplicationEntity presentApplication){
		presentApplicationDao.update(presentApplication);
	}
	
	@Override
	public void delete(Long id){
		presentApplicationDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		presentApplicationDao.deleteBatch(ids);
	}
	
}
