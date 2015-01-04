package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.core.model.Pager;
import com.zh.web.dao.FranchiseeDao;
import com.zh.web.model.bean.Franchisee;
import com.zh.web.service.FranchiseeService;

@Component("franchiseeService")
public class FranchiseeServiceImpl implements FranchiseeService {

	@Autowired
	private FranchiseeDao franchiseeDao;
	
	@Override
	public Franchisee query(Franchisee franchisee) {
		// TODO Auto-generated method stub
		return franchiseeDao.query(franchisee);
	}

	@Override
	public void update(Franchisee franchisee) {
		// TODO Auto-generated method stub
		franchiseeDao.update(franchisee);
	}

	@Override
	public List<Franchisee> queryList(Franchisee franchisee) {
		// TODO Auto-generated method stub
		return franchiseeDao.queryList(franchisee);
	}

	@Override
	public List<Franchisee> queryList(Franchisee franchisee, Pager page) {
		// TODO Auto-generated method stub
		return franchiseeDao.queryPageList(franchisee, page);
	}

	@Override
	public Integer count(Franchisee franchisee) {
		// TODO Auto-generated method stub
		return franchiseeDao.count(franchisee);
	}

	@Override
	public void delete(Franchisee franchisee) {
		// TODO Auto-generated method stub
		franchiseeDao.delete(franchisee);
	}

	@Override
	public Integer insert(Franchisee franchisee) {
		// TODO Auto-generated method stub
		return franchiseeDao.insert(franchisee);
	}

	public FranchiseeDao getFranchiseeDao() {
		return franchiseeDao;
	}

	public void setFranchiseeDao(FranchiseeDao franchiseeDao) {
		this.franchiseeDao = franchiseeDao;
	}

}
