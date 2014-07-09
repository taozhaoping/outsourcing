package com.zh.base.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.base.model.UserInfo;
import com.zh.core.base.dao.BaseDao;

@Component("userInfoDAO")
public class UserInfoDAO extends BaseDao<UserInfo> {
	
	@Override
	@PostConstruct
	public void init() {
		// TODO Auto-generated method stub
		this.setNamespace("User");
	}

}
