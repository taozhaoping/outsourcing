package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.Activities;

@Component("activitiesDao")
public class ActivitiesDao extends BaseDao<Activities> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_activities");
	}
}
