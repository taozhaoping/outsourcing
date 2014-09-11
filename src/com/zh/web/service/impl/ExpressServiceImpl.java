package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.base.util.DateUtil;
import com.zh.core.model.Pager;
import com.zh.web.dao.ExpressDao;
import com.zh.web.model.bean.Express;
import com.zh.web.service.ExpressService;

@Component("expressService")
public class ExpressServiceImpl implements ExpressService {

	@Autowired
	private ExpressDao expressDao;
	
	@Override
	public Express query(Express express) {
		// TODO Auto-generated method stub
		return expressDao.query(express);
	}

	@Override
	public void update(Express express) {
		expressDao.update(express);
	}

	@Override
	public List<Express> queryList(Express express) {
		// TODO Auto-generated method stub
		return expressDao.queryList(express);
	}

	@Override
	public List<Express> queryList(Express express, Pager page) {
		// TODO Auto-generated method stub
		return expressDao.queryPageList(express, page);
	}

	@Override
	public Integer count(Express express) {
		// TODO Auto-generated method stub
		return expressDao.count(express);
	}

	@Override
	public void delete(Express express) {
		// TODO Auto-generated method stub
		expressDao.delete(express);
	}

	@Override
	public void insert(Express express) {
		expressDao.insert(express);
	}

}
