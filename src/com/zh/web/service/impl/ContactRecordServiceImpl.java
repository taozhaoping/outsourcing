package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.zh.core.model.Pager;
import com.zh.core.util.DateUtil;
import com.zh.web.dao.ContactRecordDao;
import com.zh.web.dao.ContactRecordVWDao;
import com.zh.web.model.bean.ContactRecord;
import com.zh.web.model.bean.ContactRecordVW;
import com.zh.web.service.ContactRecordService;

@Component("contactRecordService")
public class ContactRecordServiceImpl implements ContactRecordService {

	@Autowired
	private ContactRecordDao contactRecordDao;
	
	@Autowired
	private ContactRecordVWDao 	contactRecordVWDao;
	
	@Override
	public ContactRecord query(ContactRecord contactRecord) {
		// TODO Auto-generated method stub
		return contactRecordDao.query(contactRecord);
	}

	@Override
	public List<ContactRecord> queryList(ContactRecord contactRecord) {
		// TODO Auto-generated method stub
		contactRecord.setOrderByClause("createdate");
		return contactRecordDao.queryList(contactRecord);
	}

	@Override
	public List<ContactRecord> queryList(ContactRecord contactRecord, Pager page) {
		// TODO Auto-generated method stub
		contactRecord.setOrderByClause("createdate");
		return contactRecordDao.queryPageList(contactRecord, page);
	}

	@Override
	public Integer count(ContactRecord contactRecord) {
		// TODO Auto-generated method stub
		return contactRecordDao.count(contactRecord);
	}

	@Override
	public Integer insert(ContactRecord contactRecord) {
		// TODO Auto-generated method stub
		String update = DateUtil.getStringDate();
		contactRecord.setCreatedate(update);
		return contactRecordDao.insert(contactRecord);
	}

	@Override
	public List<ContactRecordVW> queryVWList(ContactRecordVW contactRecordVW,
			Pager page) {
		// TODO Auto-generated method stub
		return contactRecordVWDao.selectPageList("list_VW", contactRecordVW,page);
	}

	@Override
	public Integer countVW(ContactRecordVW contactRecordVW) {
		// TODO Auto-generated method stub
		return contactRecordVWDao.count("count_VW",contactRecordVW);
	}

}
