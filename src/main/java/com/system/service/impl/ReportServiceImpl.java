package com.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.system.dao.ReportDao;
import com.system.entity.ReportEntity;
import com.system.service.ReportService;



@Service("reportService")
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportDao reportDao;
	
	@Override
	public ReportEntity queryObject(Long id){
		return reportDao.queryObject(id);
	}
	
	@Override
	public List<ReportEntity> queryList(Map<String, Object> map){
		return reportDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return reportDao.queryTotal(map);
	}
	
	@Override
	public void save(ReportEntity report){
		reportDao.save(report);
	}
	
	@Override
	public void update(ReportEntity report){
		reportDao.update(report);
	}
	
	@Override
	public void delete(Long id){
		reportDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		reportDao.deleteBatch(ids);
	}
	
}
