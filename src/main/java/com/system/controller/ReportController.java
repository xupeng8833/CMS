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

import com.system.entity.ReportEntity;
import com.system.service.ReportService;
import com.system.utils.PageUtils;
import com.system.utils.Query;
import com.system.utils.R;


/**
 * 保修信息管理
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-19 22:44:37
 */
@RestController
@RequestMapping("/sys/report")
public class ReportController {
	@Autowired
	private ReportService reportService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:report:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ReportEntity> reportList = reportService.queryList(query);
		int total = reportService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(reportList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sys:report:info")
	public R info(@PathVariable("id") Long id){
		ReportEntity report = reportService.queryObject(id);
		
		return R.ok().put("report", report);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:report:save")
	public R save(@RequestBody ReportEntity report){
		reportService.save(report);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:report:update")
	public R update(@RequestBody ReportEntity report){
		reportService.update(report);
		
		return R.ok();
	}
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:report:delete")
	public R delete(@RequestBody Long[] ids){
		reportService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
