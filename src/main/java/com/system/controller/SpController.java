package com.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.druid.util.StringUtils;
import com.system.entity.OpsCustomerEntity;
import com.system.entity.SpEntity;
import com.system.entity.SpPriceEntity;
import com.system.service.SpService;
import com.system.utils.PageUtils;
import com.system.utils.Query;
import com.system.utils.R;

/**
 * 商品
 * 
 * @author xp
 * @email 962270789@qq.com
 * @date 2017-11-28 20:59:52
 */
@RestController
@RequestMapping("sp")
public class SpController {
	@Autowired
	private SpService spService;

	/**
	 * 商品搜索
	 */
	@RequestMapping("/list")
	@RequiresPermissions("sp:list")
	public R list(@RequestParam Map<String, Object> params) {
		// 查询列表数据
		Query query = new Query(params);
		List<SpEntity> spList = spService.queryList(query);
		int total = spService.queryTotal(query);

		PageUtils pageUtil = new PageUtils(spList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 价格搜索
	 */
	@RequestMapping("/jglist")
	@RequiresPermissions("sp:jglist")
	public R jglist(@RequestParam Map<String, Object> params) {
		// 查询列表数据
		Query query = new Query(params);

		List<SpPriceEntity> spList = spService.queryListJg(params);
		int total = spService.queryTotalJg(params);

		PageUtils pageUtil = new PageUtils(spList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 选择人员
	 */
	@RequestMapping("/memberlist")
	@RequiresPermissions("sp:memberlist")
	public R memberlist(@RequestParam Map<String, Object> params) {
		// 查询列表数据
		Query query = new Query(params);

		List<OpsCustomerEntity> spList = spService.queryListMember(params);
		int total = spService.queryTotalMember(params);

		PageUtils pageUtil = new PageUtils(spList, total, query.getLimit(), query.getPage());

		return R.ok().put("page", pageUtil);
	}

	/**
	 * 信息
	 */
	@RequestMapping("/info/{spId}")
	@RequiresPermissions("sp:info")
	public R info(@PathVariable("spType") String spType, @PathVariable("spNm") String spNm,
			@PathVariable("sp_storeid") String sp_storeid, @PathVariable("spPn") String spPn) {
		SpEntity sp = spService.queryObject(spType);

		return R.ok().put("sp", sp);
	}

	/**
	 * 添加商品,编辑商品 spFlg: 1:添加 2:编辑
	 */
	@RequestMapping("/save")
	@RequiresPermissions("sp:save")
	public R save(@RequestBody SpEntity sp) {
		// 添加商品
		if (StringUtils.isEmpty(sp.getSpId())) {
			spService.save(sp);
		}
		// 编辑商品
		else {
			spService.update(sp);
		}

		return R.ok();
	}

	/**
	 * 添加价格规则,编辑价格规则 spFlg: 1:添加 2:编辑
	 */
	@RequestMapping("/savePrice")
	@RequiresPermissions("sp:savePrice")
	public R savePrice(@RequestBody SpPriceEntity sp, @PathVariable("spFlg") String spFlg) {
		// 添加商品
		if (StringUtils.equals(spFlg, "1")) {
			spService.savePrice(sp);
		}
		// 编辑商品
		else if (StringUtils.equals(spFlg, "0")) {
			spService.updatePrice(sp);
		}

		return R.ok();
	}

	/**
	 * 更新
	 */
	@RequestMapping("/update")
	@RequiresPermissions("sp:update")
	public R update(@RequestBody SpEntity sp) {
		spService.update(sp);

		return R.ok();
	}

	/**
	 * 商品冻结
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("sp:delete")
	public R delete(@RequestBody String spIds) {
		spService.delete(spIds);

		return R.ok();
	}

	/**
	 * 人员冻结
	 */
	@RequestMapping("/memberDelete")
	@RequiresPermissions("sp:memberDelete")
	public R memberDelete(@RequestBody String spIds) {
		spService.memberDelete(spIds);

		return R.ok();
	}

}
