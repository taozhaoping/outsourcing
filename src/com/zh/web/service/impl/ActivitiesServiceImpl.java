package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.base.util.DateUtil;
import com.zh.core.model.Pager;
import com.zh.web.dao.ActivitiesDao;
import com.zh.web.model.bean.Activities;
import com.zh.web.service.ActivitiesService;

@Component("activitiesService")
public class ActivitiesServiceImpl implements ActivitiesService {

	@Autowired
	private ActivitiesDao activitiesDao;
	
	@Override
	public Activities query(Activities activities) {
		// TODO Auto-generated method stub
		return activitiesDao.query(activities);
	}

	@Override
	public void update(Activities activities) {
		activitiesDao.update(activities);
	}

	@Override
	public List<Activities> queryList(Activities activities) {
		// TODO Auto-generated method stub
		return activitiesDao.queryList(activities);
	}

	@Override
	public List<Activities> queryList(Activities activities, Pager page) {
		// TODO Auto-generated method stub
		return activitiesDao.queryPageList(activities, page);
	}

	@Override
	public Integer count(Activities activities) {
		// TODO Auto-generated method stub
		return activitiesDao.count(activities);
	}

	@Override
	public void delete(Activities activities) {
		// TODO Auto-generated method stub
		activitiesDao.update(activities);
	}

	@Override
	public Integer insert(Activities activities) {
		return (Integer)activitiesDao.insert(activities);
	}

	public ActivitiesDao getActivitiesDao() {
		return activitiesDao;
	}

	public void setActivitiesDao(ActivitiesDao activitiesDao) {
		this.activitiesDao = activitiesDao;
	}

}
