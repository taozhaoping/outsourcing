package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.base.dao.UserInfoDAO;
import com.zh.base.model.bean.User;
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
	
	@Autowired
	private UserInfoDAO userInfoDAO;
	
	@Override
	public Franchisee query(Franchisee franchisee) {
		return franchiseeDao.query(franchisee);
	}

	@Override
	public Change query(Change change) {
		Change retChange = changeDao.query(change);
		//设置创建者名称
		User user = new User();
		user.setId(retChange.getOwner());
		User reult = userInfoDAO.query(user);
		retChange.setOwnerName(reult.getName());
		return retChange;
	}

	@Override
	public void update(Franchisee franchisee) {
		franchiseeDao.update(franchisee);
	}

	@Override
	public List<Franchisee> queryList(Franchisee franchisee) {
		franchisee.setOrderByClause("CREATEDATE DESC");
		return franchiseeDao.queryList(franchisee);
	}

	@Override
	public List<Franchisee> queryList(Franchisee franchisee, Pager page) {
		franchisee.setOrderByClause("CREATEDATE DESC");
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
		franchiseeBo.setOrderByClause("CHANGE_NUMBER DESC");
		List<FranchiseeBO> retList = franchiseeBODao.queryList(franchiseeBo);
		for(FranchiseeBO fc : retList){
			User user = new User();
			//创建者
			user.setId(fc.getOwner());
			User reult = userInfoDAO.query(user);
			if(null != reult){
				fc.setOwnerName(reult.getName());
			}
			//当前审批者
			String approver = fc.getApprover();
			if("-1".equals(approver)){
				fc.setApprover("");
			}
			
			if(null != approver && !"".equals(approver.trim()) && !"-1".equals(approver)){
				user = new User();
				user.setLoginName(approver);
				User ret = userInfoDAO.query(user);
				if(null != ret){
					fc.setApproverName(ret.getName());
				}
			}
		}
		return retList;
	}

	@Override
	public List<FranchiseeBO> queryList(FranchiseeBO franchiseeBo, Pager page) {
		franchiseeBo.setOrderByClause("CHANGE_NUMBER DESC");
		List<FranchiseeBO> retList = franchiseeBODao.queryPageList(franchiseeBo, page);
		for(FranchiseeBO fc : retList){
			User user = new User();
			//创建者
			user.setId(fc.getOwner());
			User reult = userInfoDAO.query(user);
			if(null != reult){
				fc.setOwnerName(reult.getName());
			}
			//当前审批者
			String approver = fc.getApprover();
			if("-1".equals(approver)){
				fc.setApprover("");
			}
			if(null != approver && !"".equals(approver.trim()) && !"-1".equals(approver)){
				user = new User();
				user.setLoginName(approver);
				User ret = userInfoDAO.query(user);
				if(null != ret){
					fc.setApproverName(ret.getName());
				}
			}
		}
		return retList;
	}

	@Override
	public Integer count(FranchiseeBO franchiseeBo) {
		return franchiseeBODao.count(franchiseeBo);
	}

	@Override
	public void update(Change change) {
		changeDao.update(change);
	}

	@Override
	public void update(FranchiseeBO franchiseeBo) {
		Change change = franchiseeBo.getChange();
		Franchisee franchisee = franchiseeBo.getFranchisee();
		
		changeDao.update(change);
		franchiseeDao.update(franchisee);
	}

}
