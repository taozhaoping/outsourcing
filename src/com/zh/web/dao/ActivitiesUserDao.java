package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.ActivitiesUser;

@Component("activitiesUserDao")
public class ActivitiesUserDao extends BaseDao<ActivitiesUser> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_ActivitiesUser");
	}
}
