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

import com.system.entity.ReplenishmentManageEntity;
import com.system.service.ReplenishmentManageService;
import com.system.utils.PageUtils;
import com.system.utils.Query;
import com.system.utils.R;


/**
 * 补货管理
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-28 16:51:24
 */
@RestController
@RequestMapping("replenishmentmanage")
public class ReplenishmentManageController {
	@Autowired
	private ReplenishmentManageService replenishmentManageService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("replenishmentmanage:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<ReplenishmentManageEntity> replenishmentManageList = replenishmentManageService.queryList(query);
		int total = replenishmentManageService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(replenishmentManageList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{opsReplenishmentNum}")
	@RequiresPermissions("replenishmentmanage:info")
	public R info(@PathVariable("opsReplenishmentNum") Long opsReplenishmentNum){
		ReplenishmentManageEntity replenishmentManage = replenishmentManageService.queryObject(opsReplenishmentNum);
		
		return R.ok().put("replenishmentManage", replenishmentManage);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("replenishmentmanage:save")
	public R save(@RequestBody ReplenishmentManageEntity replenishmentManage){
		replenishmentManageService.save(replenishmentManage);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("replenishmentmanage:update")
	public R update(@RequestBody ReplenishmentManageEntity replenishmentManage){
		replenishmentManageService.update(replenishmentManage);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("replenishmentmanage:delete")
	public R delete(@RequestBody Long[] opsReplenishmentNums){
		replenishmentManageService.deleteBatch(opsReplenishmentNums);
		
		return R.ok();
	}
	
}
