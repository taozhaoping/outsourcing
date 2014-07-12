package com.zh.base.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.base.model.bean.Role;
import com.zh.core.base.model.BaseModel;

public class RoleModel extends BaseModel {

	private List<Role> roleList = new ArrayList<Role>();
	
	private Role role = new Role();


	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
}
