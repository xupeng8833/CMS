package com.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.system.dao.FeedbackDao;
import com.system.entity.FeedbackEntity;
import com.system.service.FeedbackService;



@Service("feedbackService")
public class FeedbackServiceImpl implements FeedbackService {
	@Autowired
	private FeedbackDao feedbackDao;
	
	@Override
	public FeedbackEntity queryObject(Long feedbackId){
		return feedbackDao.queryObject(feedbackId);
	}
	
	@Override
	public List<FeedbackEntity> queryList(Map<String, Object> map){
		return feedbackDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return feedbackDao.queryTotal(map);
	}
	
	@Override
	public void save(FeedbackEntity feedback){
		feedbackDao.save(feedback);
	}
	
	@Override
	public void update(FeedbackEntity feedback){
		feedbackDao.update(feedback);
	}
	
	@Override
	public void delete(Long feedbackId){
		feedbackDao.delete(feedbackId);
	}
	
	@Override
	public void deleteBatch(Long[] feedbackIds){
		feedbackDao.deleteBatch(feedbackIds);
	}
	
}
