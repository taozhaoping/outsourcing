package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.FranchiseeRecord;

@Component("franchiseeRecordDao")
public class FranchiseeRecordDao extends BaseDao<FranchiseeRecord> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_FranchiseeRecord");
	}

}
