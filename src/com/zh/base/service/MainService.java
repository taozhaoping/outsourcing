package com.zh.base.service;

import com.zh.base.model.MainModel;

/**
 * 主界面接口
 * @author Administrator
 *
 */
public interface MainService {

	/**
	 * 初始化用户员工信息
	 * @param mainModel
	 */
	public void initEmployeeInfo(MainModel mainModel);
	
	/**
	 * 初始化用户角色信息和菜单信息
	 * @param mainModel
	 */
	public void initRoleMenuInfo(MainModel mainModel);
	
	/**
	 * 初始化个人所在公司信息
	 * @param mainModel
	 */
	public void initEnterprise(MainModel mainModel);
}
