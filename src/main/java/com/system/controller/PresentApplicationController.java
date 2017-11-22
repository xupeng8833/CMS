package com.system.controller;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.system.entity.PresentApplicationEntity;
import com.system.service.PresentApplicationService;
import com.system.utils.PageUtils;
import com.system.utils.Query;
import com.system.utils.R;


/**
 * 提现结算申请表
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-22 09:33:39
 */
@RestController
@RequestMapping("/sys/presentapplication")
public class PresentApplicationController {
	@Autowired
	private PresentApplicationService presentApplicationService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:presentapplication:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<PresentApplicationEntity> presentApplicationList = presentApplicationService.queryList(query);
		int total = presentApplicationService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(presentApplicationList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sys:presentapplication:info")
	public R info(@PathVariable("id") Long id){
		PresentApplicationEntity presentApplication = presentApplicationService.queryObject(id);
		
		return R.ok().put("presentApplication", presentApplication);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:presentapplication:save")
	public R save(@RequestBody PresentApplicationEntity presentApplication){
		presentApplicationService.save(presentApplication);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:presentapplication:update")
	public R update(@RequestBody PresentApplicationEntity presentApplication){
		presentApplicationService.update(presentApplication);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:presentapplication:delete")
	public R delete(@RequestBody Long[] ids){
		presentApplicationService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
