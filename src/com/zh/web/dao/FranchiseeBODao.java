package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.FranchiseeBO;

@Component("franchiseeBODao")
public class FranchiseeBODao extends BaseDao<FranchiseeBO> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_FranchiseeBO");
	}

}
