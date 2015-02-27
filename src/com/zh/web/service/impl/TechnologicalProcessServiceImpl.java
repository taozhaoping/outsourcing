package com.zh.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.base.dao.UserInfoDAO;
import com.zh.base.model.bean.User;
import com.zh.core.model.Pager;
import com.zh.web.dao.TechnologicalProcessDao;
import com.zh.web.model.bean.TechnologicalProcess;
import com.zh.web.service.TechnologicalProcessService;

@Component("technologicalProcessService")
public class TechnologicalProcessServiceImpl implements
		TechnologicalProcessService {
	
	@Autowired
	private TechnologicalProcessDao technologicalProcessDao;
	
	@Autowired
	private UserInfoDAO userInfoDAO;

	@Override
	public TechnologicalProcess query(TechnologicalProcess technologicalProcess) {
		TechnologicalProcess tp = technologicalProcessDao.query(technologicalProcess);
		User user = new User();
		user.setId(Integer.valueOf(tp.getWorkuserid()));
		User reult = userInfoDAO.query(user);
		tp.setWorkUserName(reult.getName());
		return tp;
	}

	@Override
	public void update(TechnologicalProcess technologicalProcess) {
		technologicalProcessDao.update(technologicalProcess);
	}

	@Override
	public List<TechnologicalProcess> queryList(TechnologicalProcess technologicalProcess) {
		// TODO Auto-generated method stub
		//排序-创建时间，降序
		technologicalProcess.setOrderByClause("CREATETIME DESC");
		return technologicalProcessDao.queryList(technologicalProcess);
	}

	@Override
	public List<TechnologicalProcess> queryList(TechnologicalProcess technologicalProcess,
			Pager page) {
		//排序-创建时间，降序
		technologicalProcess.setOrderByClause("CREATETIME DESC");
		List<TechnologicalProcess> retList = technologicalProcessDao.queryPageList(technologicalProcess, page);
		for(TechnologicalProcess tp : retList){
			User user = new User();
			//创建者
			user.setId(Integer.valueOf(tp.getWorkuserid()));
			User reult = userInfoDAO.query(user);
			if(null != reult){
				tp.setWorkUserName(reult.getName());
			}
			//当前审批者
			String approver = tp.getApprover();
			if("-1".equals(approver)){
				tp.setApprover("");
			}
			
			if(null != approver && !"".equals(approver.trim()) && !"-1".equals(approver)){
				user = new User();
				user.setLoginName(approver);
				User ret = userInfoDAO.query(user);
				if(null != ret){
					tp.setApprover(ret.getName());
				}
			}
			
		}
		return retList;
	}

	@Override
	public Integer count(TechnologicalProcess technologicalProcess) {
		// TODO Auto-generated method stub
		return technologicalProcessDao.count(technologicalProcess);
	}

	@Override
	public void delete(TechnologicalProcess technologicalProcess) {
		// TODO Auto-generated method stub
		technologicalProcessDao.delete(technologicalProcess);
	}

	@Override
	public void insert(TechnologicalProcess technologicalProcess) {
		// TODO Auto-generated method stub
		technologicalProcessDao.insert(technologicalProcess);
	}

	@Override
	public List<TechnologicalProcess> queryListByPermission(
			TechnologicalProcess technologicalProcess, Pager page) {
		//排序-创建时间，降序
		technologicalProcess.setOrderByClause("CREATETIME DESC");
		List<TechnologicalProcess> retList = technologicalProcessDao.queryPageListByPermission(technologicalProcess, page);
		for(TechnologicalProcess tp : retList){
			User user = new User();
			//创建者
			user.setId(Integer.valueOf(tp.getWorkuserid()));
			User reult = userInfoDAO.query(user);
			if(null != reult){
				tp.setWorkUserName(reult.getName());
			}
			//当前审批者
			String approver = tp.getApprover();
			if("-1".equals(approver)){
				tp.setApprover("");
			}
			
			if(null != approver && !"".equals(approver.trim()) && !"-1".equals(approver)){
				user = new User();
				user.setLoginName(approver);
				User ret = userInfoDAO.query(user);
				if(null != ret){
					tp.setApprover(ret.getName());
				}
			}
			
		}
		return retList;
	}

	@Override
	public Integer countByPermission(TechnologicalProcess technologicalProcess) {
		return technologicalProcessDao.countByPermission(technologicalProcess);
	}

}
