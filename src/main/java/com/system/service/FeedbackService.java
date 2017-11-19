package com.system.service;

import com.system.entity.FeedbackEntity;

import java.util.List;
import java.util.Map;

/**
 * 意见反馈表
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-19 10:11:09
 */
public interface FeedbackService {
	
	FeedbackEntity queryObject(Long feedbackId);
	
	List<FeedbackEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(FeedbackEntity feedback);
	
	void update(FeedbackEntity feedback);
	
	void delete(Long feedbackId);
	
	void deleteBatch(Long[] feedbackIds);
}
