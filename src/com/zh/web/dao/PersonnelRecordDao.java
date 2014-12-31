package com.zh.web.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.core.base.dao.BaseDao;
import com.zh.web.model.bean.PersonnelRecord;

@Component("personnelRecordDao")
public class PersonnelRecordDao extends BaseDao<PersonnelRecord> {

	@Override
	@PostConstruct
	public void init() {
		this.setNamespace("M_PersonnelRecord");
	}
}
