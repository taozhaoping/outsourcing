package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.Certificates;
import com.zh.web.model.bean.ContactRecord;
import com.zh.web.model.bean.ContactRecordVW;

@Component("contactRecordVWDao")
public class ContactRecordVWDao extends BaseDao<ContactRecordVW> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_ContactRecord");
	}

}
