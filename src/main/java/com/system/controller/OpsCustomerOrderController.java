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

import com.system.entity.OpsCustomerOrderEntity;
import com.system.service.OpsCustomerOrderService;
import com.system.utils.PageUtils;
import com.system.utils.Query;
import com.system.utils.R;


/**
 * 用户订单表
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-28 14:42:45
 */
@RestController
@RequestMapping("opscustomerorder")
public class OpsCustomerOrderController {
	@Autowired
	private OpsCustomerOrderService opsCustomerOrderService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("opscustomerorder:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);

		List<OpsCustomerOrderEntity> opsCustomerOrderList = opsCustomerOrderService.queryList(query);
		int total = opsCustomerOrderService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(opsCustomerOrderList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{opsCustomerOrderId}")
	@RequiresPermissions("opscustomerorder:info")
	public R info(@PathVariable("opsCustomerOrderId") Long opsCustomerOrderId){
		OpsCustomerOrderEntity opsCustomerOrder = opsCustomerOrderService.queryObject(opsCustomerOrderId);
		
		return R.ok().put("opsCustomerOrder", opsCustomerOrder);
	}
	
	/**
	 * 保存
	 */
	@RequestMapping("/save")
	@RequiresPermissions("opscustomerorder:save")
	public R save(@RequestBody OpsCustomerOrderEntity opsCustomerOrder){
		opsCustomerOrderService.save(opsCustomerOrder);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("opscustomerorder:update")
	public R update(@RequestBody OpsCustomerOrderEntity opsCustomerOrder){
		opsCustomerOrderService.update(opsCustomerOrder);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("opscustomerorder:delete")
	public R delete(@RequestBody Long[] opsCustomerOrderIds){
		opsCustomerOrderService.deleteBatch(opsCustomerOrderIds);
		
		return R.ok();
	}
	
}
