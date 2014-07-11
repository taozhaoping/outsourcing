package com.zh.base.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.base.dao.RoleDao;
import com.zh.base.model.Role;
import com.zh.base.service.RoleService;
import com.zh.core.model.Pager;

@Component("roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;
	
	@Override
	public Role query(Role role) {
		// TODO Auto-generated method stub
		return roleDao.query(role);
	}

	@Override
	public void update(Role role) {
		// TODO Auto-generated method stub
		roleDao.update(role);
	}

	@Override
	public List<Role> queryList(Role role) {
		// TODO Auto-generated method stub
		return roleDao.queryList(role);
	}

	@Override
	public List<Role> queryList(Role role, Pager page) {
		// TODO Auto-generated method stub
		return roleDao.queryPageList(role, page);
	}

	@Override
	public Integer count(Role role) {
		// TODO Auto-generated method stub
		return roleDao.count(role);
	}

	@Override
	public void delete(Role role) {
		// TODO Auto-generated method stub
		roleDao.delete(role);
	}

	@Override
	public void insert(Role role) {
		// TODO Auto-generated method stub
		roleDao.insert(role);
	}

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public Role queryAuthoritiesToMenu(Role role) {
		// TODO Auto-generated method stub
		return roleDao.queryAuthoritiesToMenu(role);
	}

}
