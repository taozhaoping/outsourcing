package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.base.dao.UserInfoDAO;
import com.zh.base.model.bean.User;
import com.zh.core.model.Pager;
import com.zh.web.dao.EntryProcessDao;
import com.zh.web.model.bean.EntryProcess;
import com.zh.web.service.EntryProcessService;

@Component("entryProcessService")
public class EntryProcessServiceImpl implements EntryProcessService {
	
	@Autowired
	private EntryProcessDao entryProcessDao;
	
	@Autowired
	private UserInfoDAO userInfoDAO;

	@Override
	public EntryProcess query(EntryProcess entryProcess) {
		return entryProcessDao.query(entryProcess);
	}

	@Override
	public void update(EntryProcess entryProcess) {
		entryProcessDao.update(entryProcess);
	}

	@Override
	public List<EntryProcess> queryList(EntryProcess entryProcess) {
		// TODO Auto-generated method stub
		//排序-创建时间，降序
		entryProcess.setOrderByClause("CREATETIME DESC");
		return entryProcessDao.queryList(entryProcess);
	}

	@Override
	public List<EntryProcess> queryList(EntryProcess entryProcess,
			Pager page) {
		//排序-创建时间，降序
		entryProcess.setOrderByClause("CREATETIME DESC");
		List<EntryProcess> retList = entryProcessDao.queryPageList(entryProcess, page);
		for(EntryProcess ep : retList){
			User user = new User();
			//创建者
			user.setId(Integer.valueOf(ep.getWorkuserid()));
			User reult = userInfoDAO.query(user);
			if(null != reult){
				ep.setWorkUserName(reult.getName());
			}
			//当前审批者
			String approver = ep.getApprover();
			if("-1".equals(approver)){
				ep.setApprover("");
			}
			
			if(null != approver && !"".equals(approver.trim()) && !"-1".equals(approver)){
				user = new User();
				user.setLoginName(approver);
				User ret = userInfoDAO.query(user);
				if(null != ret){
					ep.setApprover(ret.getName());
				}
			}
		}
		
		return retList;
	}

	@Override
	public Integer count(EntryProcess entryProcess) {
		// TODO Auto-generated method stub
		return entryProcessDao.count(entryProcess);
	}

	@Override
	public void delete(EntryProcess entryProcess) {
		// TODO Auto-generated method stub
		entryProcessDao.delete(entryProcess);
	}

	@Override
	public void insert(EntryProcess entryProcess) {
		// TODO Auto-generated method stub
		entryProcessDao.insert(entryProcess);
	}

}
