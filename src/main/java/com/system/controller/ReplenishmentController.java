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

import com.system.entity.ReplenishmentEntity;
import com.system.service.ReplenishmentService;
import com.system.utils.PageUtils;
import com.system.utils.Query;
import com.system.utils.R;


/**
 * 保修信息管理
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-20 23:19:43
 */
@RestController
@RequestMapping("/sys/replenishment")
public class ReplenishmentController {
	@Autowired
	private ReplenishmentService replenishmentService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sys:replenishment:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ReplenishmentEntity> replenishmentList = replenishmentService.queryList(query);
		int total = replenishmentService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(replenishmentList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("sys:replenishment:info")
	public R info(@PathVariable("id") Long id){
		ReplenishmentEntity replenishment = replenishmentService.queryObject(id);
		
		return R.ok().put("replenishment", replenishment);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sys:replenishment:save")
	public R save(@RequestBody ReplenishmentEntity replenishment){
		replenishmentService.save(replenishment);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sys:replenishment:update")
	public R update(@RequestBody ReplenishmentEntity replenishment){
		replenishmentService.update(replenishment);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sys:replenishment:delete")
	public R delete(@RequestBody Long[] ids){
		replenishmentService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
