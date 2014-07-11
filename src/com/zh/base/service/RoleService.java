package com.zh.base.service;

import java.util.List;

import com.zh.base.model.Role;
import com.zh.core.model.Pager;

public interface RoleService {

	/**
	 * 查询信息
	 * @param 
	 * @return
	 */
	public Role query(Role role);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(Role role);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<Role> queryList(Role role);
	
	/**
	 * 查询角色信息，并带出相应的菜单信息
	 * @param role id不允许为空
	 * @return
	 */
	public Role queryRoleToMenu(Role role);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<Role> queryList(Role role , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(Role role);
	
	/**
	 * 删除
	 * @param 
	 */
	public void delete(Role role);
	
	/**
	 * 新增
	 * @param 
	 */
	public void insert(Role role);
}
