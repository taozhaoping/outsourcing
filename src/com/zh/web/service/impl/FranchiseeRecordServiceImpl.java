package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.zh.core.model.Pager;
import com.zh.core.util.DateUtil;
import com.zh.web.dao.FranchiseeRecordDao;
import com.zh.web.dao.FranchiseeRecordVWDao;
import com.zh.web.model.bean.FranchiseeRecord;
import com.zh.web.model.bean.FranchiseeRecordVW;
import com.zh.web.service.FranchiseeRecordService;

@Component("franchiseeRecordService")
public class FranchiseeRecordServiceImpl implements FranchiseeRecordService {

	@Autowired
	private FranchiseeRecordDao franchiseeRecordDao;
	
	@Autowired
	private FranchiseeRecordVWDao 	franchiseeRecordVWDao;
	
	@Override
	public FranchiseeRecord query(FranchiseeRecord franchiseeRecord) {
		// TODO Auto-generated method stub
		return franchiseeRecordDao.query(franchiseeRecord);
	}

	@Override
	public List<FranchiseeRecord> queryList(FranchiseeRecord franchiseeRecord) {
		// TODO Auto-generated method stub
		franchiseeRecord.setOrderByClause("createdate");
		return franchiseeRecordDao.queryList(franchiseeRecord);
	}

	@Override
	public List<FranchiseeRecord> queryList(FranchiseeRecord franchiseeRecord, Pager page) {
		// TODO Auto-generated method stub
		franchiseeRecord.setOrderByClause("createdate");
		return franchiseeRecordDao.queryPageList(franchiseeRecord, page);
	}

	@Override
	public Integer count(FranchiseeRecord franchiseeRecord) {
		// TODO Auto-generated method stub
		return franchiseeRecordDao.count(franchiseeRecord);
	}

	@Override
	public Integer insert(FranchiseeRecord franchiseeRecord) {
		// TODO Auto-generated method stub
		String update = DateUtil.getStringDate();
		franchiseeRecord.setCreatedate(update);
		return franchiseeRecordDao.insert(franchiseeRecord);
	}

	@Override
	public List<FranchiseeRecordVW> queryVWList(FranchiseeRecordVW franchiseeRecordVW,
			Pager page) {
		// TODO Auto-generated method stub
		return franchiseeRecordVWDao.selectPageList("list_VW", franchiseeRecordVW,page);
	}

	@Override
	public Integer countVW(FranchiseeRecordVW franchiseeRecordVW) {
		// TODO Auto-generated method stub
		return franchiseeRecordVWDao.count("count_VW",franchiseeRecordVW);
	}

}
