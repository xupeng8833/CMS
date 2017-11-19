package com.system.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.system.entity.FeedbackEntity;
import com.system.service.FeedbackService;
import com.system.utils.PageUtils;
import com.system.utils.Query;
import com.system.utils.R;


/**
 * 意见反馈表
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-19 10:11:09
 */
@RestController
@RequestMapping("/sys/feedback")
public class FeedbackController {
	@Autowired
	private FeedbackService feedbackService;
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("sys:feedback:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<FeedbackEntity> feedbackList = feedbackService.queryList(query);
		int total = feedbackService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(feedbackList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{feedbackId}")
	@RequiresPermissions("sys:feedback:info")
	public R info(@PathVariable("feedbackId") Long feedbackId){
		FeedbackEntity feedback = feedbackService.queryObject(feedbackId);
		
		return R.ok().put("feedback", feedback);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:feedback:save")
	public R save(@RequestBody FeedbackEntity feedback){
		feedbackService.save(feedback);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:feedback:update")
	public R update(@RequestBody FeedbackEntity feedback){
		feedback.setReplyType(1l);
		feedbackService.update(feedback);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:feedback:delete")
	public R delete(@RequestBody Long[] feedbackIds){
		feedbackService.deleteBatch(feedbackIds);
		
		return R.ok();
	}
	
}
