package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.FranchiseeRecordVW;

@Component("franchiseeRecordVWDao")
public class FranchiseeRecordVWDao extends BaseDao<FranchiseeRecordVW> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_FranchiseeRecord");
	}

}
