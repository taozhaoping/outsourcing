package com.zh.base.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.base.dao.UserInfoDAO;
import com.zh.base.model.UserInfo;
import com.zh.base.service.UserInfoService;
import com.zh.core.common.SqlCommon;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;

@Component("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {
	
	
	@Autowired
	private UserInfoDAO userInfoDAO;
	
	
	public void addUserInfo(UserInfo userInfo) {
		//获取序列号
		Long id = userInfoDAO.getSequence(SEQUENCE_NAME);
		userInfo.setId(id);
		userInfoDAO.insert(userInfo);
	}
	
	public void delUserInfo(UserInfo userInfo) {
		//逻辑删除(冻结账号使用)
		userInfo.setIsDelete("1");
		this.updateUserinfo(userInfo);
	}


	public UserInfo loadUserPassWord(UserInfo userinfo) {
		if( null == userinfo.getIsDelete())
		{
			userinfo.setIsDelete(SqlCommon.USER_NOT_DELETE);
		}
		return userInfoDAO.query(userinfo);
	}
	
	public void updateUserinfo(UserInfo userinfo) {
		try {
			userInfoDAO.update(userinfo);
		} catch (Exception e) {
			throw new ProjectException("COM.SCHOOL.ERROR.SQLEXCEPTION" ,e);
		}
		
	}
	public Integer countUserInfo(UserInfo userInfo) {
		return userInfoDAO.count(userInfo);
	}

	public List<UserInfo> listUserInfo(UserInfo userInfo, Pager page) {
		return userInfoDAO.queryPageList(userInfo,page);
	}

	public void setUserInfoDAO(UserInfoDAO userInfoDAO) {
		this.userInfoDAO = userInfoDAO;
	}
	public void deluserInfo(UserInfo userInfo) {
		
	}

	public UserInfo loadUserInfo(UserInfo userInfo) {
		return userInfoDAO.query(userInfo);
	}
}
