package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.Personnel;

@Component("personnelDao")
public class PersonnelDao extends BaseDao<Personnel> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_Personnel");
	}
}
