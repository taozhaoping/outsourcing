package com.zh.base.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.base.dao.UserInfoDAO;
import com.zh.base.model.bean.Enterprise;
import com.zh.base.model.bean.User;
import com.zh.base.service.UserInfoService;
import com.zh.core.common.SqlCommon;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;

@Component("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {
	
	
	@Autowired
	private UserInfoDAO userInfoDAO;

	@Override
	public User query(User user) {
		// TODO Auto-generated method stub
		return userInfoDAO.query(user);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		userInfoDAO.update(user);
	}

	@Override
	public List<User> queryList(User user) {
		// TODO Auto-generated method stub
		return userInfoDAO.queryList(user);
	}

	@Override
	public List<User> queryList(User user, Pager page) {
		// TODO Auto-generated method stub
		return userInfoDAO.queryPageList(user, page);
	}

	@Override
	public Integer count(User user) {
		// TODO Auto-generated method stub
		return userInfoDAO.count(user);
	}

	@Override
	public void delete(User user) {
		// TODO Auto-generated method stub
		userInfoDAO.delete(user);
	}

	@Override
	public void insert(User user) {
		// TODO Auto-generated method stub
		
	}

}
