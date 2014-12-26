package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.core.model.Pager;
import com.zh.web.dao.PersonnelDao;
import com.zh.web.model.bean.Personnel;
import com.zh.web.service.PersonnelService;

@Component("personnelService")
public class PersonnelServiceImpl implements PersonnelService {

	@Autowired
	private PersonnelDao personnelDao;
	
	@Override
	public Personnel query(Personnel personnel) {
		// TODO Auto-generated method stub
		return personnelDao.query(personnel);
	}

	@Override
	public void update(Personnel personnel) {
		// TODO Auto-generated method stub
		personnelDao.update(personnel);
	}

	@Override
	public List<Personnel> queryList(Personnel personnel) {
		// TODO Auto-generated method stub
		return personnelDao.queryList(personnel);
	}

	@Override
	public List<Personnel> queryList(Personnel personnel, Pager page) {
		// TODO Auto-generated method stub
		return personnelDao.queryPageList(personnel, page);
	}

	@Override
	public Integer count(Personnel personnel) {
		// TODO Auto-generated method stub
		return personnelDao.count(personnel);
	}

	@Override
	public void delete(Personnel personnel) {
		// TODO Auto-generated method stub
		personnelDao.delete(personnel);
	}

	@Override
	public Integer insert(Personnel personnel) {
		// TODO Auto-generated method stub
		return personnelDao.insert(personnel);
	}

}
