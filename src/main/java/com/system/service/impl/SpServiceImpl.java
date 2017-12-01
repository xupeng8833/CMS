package com.system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.system.dao.OpsCustomerDao;
import com.system.dao.SpDao;
import com.system.dao.SpPriceDao;
import com.system.entity.OpsCustomerEntity;
import com.system.entity.SpEntity;
import com.system.entity.SpPriceEntity;
import com.system.service.SpService;

@Service("spService")
public class SpServiceImpl implements SpService {
	@Autowired
	private SpDao spDao;
	@Autowired
	private SpPriceDao spPriceDao;
	@Autowired
	private OpsCustomerDao opsCustomerDao;

	@Override
	public SpEntity queryObject(String spId) {
		return spDao.queryObject(spId);
	}

	@Override
	public List<SpEntity> queryList(Map<String, Object> map) {
		return spDao.queryList(map);
	}

	@Override
	public List<SpPriceEntity> queryListJg(Map<String, Object> map) {
		return spPriceDao.queryList(map);
	}

	@Override
	public List<OpsCustomerEntity> queryListMember(Map<String, Object> map) {
		return opsCustomerDao.queryListMember(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		return spDao.queryTotal(map);
	}

	@Override
	public int queryTotalJg(Map<String, Object> map) {
		return spPriceDao.queryTotal(map);
	}

	@Override
	public int queryTotalMember(Map<String, Object> map) {
		return opsCustomerDao.queryTotalMember(map);
	}

	@Override
	public void save(SpEntity sp) {
		spDao.save(sp);
	}

	@Override
	public void update(SpEntity sp) {
		spDao.update(sp);
	}

	@Override
	public void delete(String spId) {
		spDao.delete(spId);
	}

	@Override
	public void memberDelete(String userId) {
		opsCustomerDao.memberDelete(userId);
	}

	@Override
	public void deleteBatch(String[] spIds) {
		spDao.deleteBatch(spIds);
	}

	@Override
	public void savePrice(SpPriceEntity sp) {
		spPriceDao.save(sp);
	}

	@Override
	public void updatePrice(SpPriceEntity sp) {
		spPriceDao.update(sp);
	}

}
