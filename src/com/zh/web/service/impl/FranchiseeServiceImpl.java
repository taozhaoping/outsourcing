package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.base.util.Tools;
import com.zh.core.model.Pager;
import com.zh.web.dao.ChangeDao;
import com.zh.web.dao.FranchiseeBODao;
import com.zh.web.dao.FranchiseeDao;
import com.zh.web.model.bean.Change;
import com.zh.web.model.bean.Franchisee;
import com.zh.web.model.bean.FranchiseeBO;
import com.zh.web.service.FranchiseeService;

@Component("franchiseeService")
public class FranchiseeServiceImpl implements FranchiseeService {

	@Autowired
	private FranchiseeDao franchiseeDao;

	@Autowired
	private FranchiseeBODao franchiseeBODao;
	
	@Autowired
	private ChangeDao changeDao;
	
	@Override
	public Franchisee query(Franchisee franchisee) {
		return franchiseeDao.query(franchisee);
	}

	@Override
	public void update(Franchisee franchisee) {
		franchiseeDao.update(franchisee);
	}

	@Override
	public List<Franchisee> queryList(Franchisee franchisee) {
		return franchiseeDao.queryList(franchisee);
	}

	@Override
	public List<Franchisee> queryList(Franchisee franchisee, Pager page) {
		return franchiseeDao.queryPageList(franchisee, page);
	}

	@Override
	public Integer count(Franchisee franchisee) {
		return franchiseeDao.count(franchisee);
	}

	@Override
	public void delete(Franchisee franchisee) {
		franchiseeDao.delete(franchisee);
	}

	@Override
	public Integer insert(Franchisee franchisee) {
		return franchiseeDao.insert(franchisee);
	}

	@Override
	public FranchiseeBO insert(FranchiseeBO franchiseeBo) {
		Franchisee franchisee = franchiseeBo.getFranchisee();
		Change change = franchiseeBo.getChange();
		//插入
		franchiseeDao.insert(franchisee);
		//保存加盟上的编号
		change.setRes1(franchisee.getId().toString());
		//加盟流程的变更号
		Long seqNumber = changeDao.getSequence("SEQ_FRANCHISEE_CHANGE_NUMBER");
		String changeNumber = "FC" + Tools.numFormat(seqNumber, "000000000");
		change.setChangeNumber(changeNumber);
		changeDao.insert(change);
		franchiseeBo.setFranchisee(franchisee);
		franchiseeBo.setChange(change);
		return franchiseeBo;
	}

	@Override
	public List<FranchiseeBO> queryList(FranchiseeBO franchiseeBo) {
		return franchiseeBODao.queryList(franchiseeBo);
	}

	@Override
	public List<FranchiseeBO> queryList(FranchiseeBO franchiseeBo, Pager page) {
		return franchiseeBODao.queryPageList(franchiseeBo, page);
	}

	@Override
	public Integer count(FranchiseeBO franchiseeBo) {
		return franchiseeBODao.count(franchiseeBo);
	}

}
