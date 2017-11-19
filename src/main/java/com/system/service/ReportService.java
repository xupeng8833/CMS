package com.system.service;

import com.system.entity.ReportEntity;

import java.util.List;
import java.util.Map;

/**
 * 保修信息管理
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-19 22:44:37
 */
public interface ReportService {
	
	ReportEntity queryObject(Long id);
	
	List<ReportEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ReportEntity report);
	
	void update(ReportEntity report);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
