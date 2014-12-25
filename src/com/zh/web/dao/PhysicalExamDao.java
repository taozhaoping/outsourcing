package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.PhysicalExam;

@Component("PhysicalExamDao")
public class PhysicalExamDao extends BaseDao<PhysicalExam> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_PhysicalExam");
	}
}
