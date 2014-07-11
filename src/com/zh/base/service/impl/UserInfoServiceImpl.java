package com.zh.base.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.base.dao.UserInfoDAO;
import com.zh.base.model.bean.User;
import com.zh.base.service.UserInfoService;
import com.zh.core.common.SqlCommon;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;

@Component("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {
	
	
	@Autowired
	private UserInfoDAO userInfoDAO;
	
	
	public void addUserInfo(User userInfo) {
		userInfoDAO.insert(userInfo);
	}
	
	public void delUserInfo(User userInfo) {
		//逻辑删除(冻结账号使用)
		userInfo.setEnabled("1");
		this.updateUserinfo(userInfo);
	}


	public User loadUserPassWord(User userinfo) {
		if( null == userinfo.getEnabled())
		{
			userinfo.setEnabled(SqlCommon.USER_NOT_DELETE);
		}
		return userInfoDAO.query(userinfo);
	}
	
	public void updateUserinfo(User userinfo) {
			userInfoDAO.update(userinfo);
	}
	public Integer countUserInfo(User userInfo) {
		return userInfoDAO.count(userInfo);
	}

	public List<User> listUserInfo(User userInfo, Pager page) {
		return userInfoDAO.queryPageList(userInfo,page);
	}

	public void setUserInfoDAO(UserInfoDAO userInfoDAO) {
		this.userInfoDAO = userInfoDAO;
	}
	public void deluserInfo(User userInfo) {
		
	}

	public User loadUserInfo(User userInfo) {
		return userInfoDAO.query(userInfo);
	}
}
