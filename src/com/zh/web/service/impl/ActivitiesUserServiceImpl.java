package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.core.model.Pager;
import com.zh.web.dao.ActivitiesUserDao;
import com.zh.web.model.bean.ActivitiesUser;
import com.zh.web.service.ActivitiesUserService;

@Component("activitiesUserService")
public class ActivitiesUserServiceImpl implements ActivitiesUserService {

	@Autowired
	private ActivitiesUserDao activitiesUserDao;
	
	@Override
	public ActivitiesUser query(ActivitiesUser activitiesUser) {
		// TODO Auto-generated method stub
		return activitiesUserDao.query(activitiesUser);
	}

	@Override
	public void update(ActivitiesUser activitiesUser) {
		// TODO Auto-generated method stub
		activitiesUserDao.update(activitiesUser);
	}

	@Override
	public List<ActivitiesUser> queryList(ActivitiesUser activitiesUser) {
		// TODO Auto-generated method stub
		return activitiesUserDao.queryList(activitiesUser);
	}

	@Override
	public List<ActivitiesUser> queryList(ActivitiesUser activitiesUser,
			Pager page) {
		// TODO Auto-generated method stub
		return activitiesUserDao.queryPageList(activitiesUser, page);
	}

	@Override
	public Integer count(ActivitiesUser activitiesUser) {
		// TODO Auto-generated method stub
		return activitiesUserDao.count(activitiesUser);
	}

	@Override
	public void delete(ActivitiesUser activitiesUser) {
		// TODO Auto-generated method stub
		activitiesUserDao.delete(activitiesUser);
	}

	@Override
	public Integer insert(ActivitiesUser activitiesUser) {
		// TODO Auto-generated method stub
		return activitiesUserDao.insert(activitiesUser);
	}

	public ActivitiesUserDao getActivitiesUserDao() {
		return activitiesUserDao;
	}

	public void setActivitiesUserDao(ActivitiesUserDao activitiesUserDao) {
		this.activitiesUserDao = activitiesUserDao;
	}

}
