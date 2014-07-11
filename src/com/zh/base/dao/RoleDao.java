package com.zh.base.dao;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import com.zh.base.model.Role;
import com.zh.core.base.dao.BaseDao;

@Component("roleDao")
public class RoleDao extends BaseDao<Role> {

	@Override
	@PostConstruct
	public void init() {
		// TODO Auto-generated method stub
		this.setNamespace("M_ROLE");
	}
	
	/**
	 * 获取角色信息和菜单信息
	 * @param role
	 * @return
	 */
	public Role queryRoleToMenu(Role role)
	{
		return this.query("RoleToMenu", role);
	}

}
