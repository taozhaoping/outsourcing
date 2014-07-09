package com.zh.base.model;

import com.zh.core.model.IDataObject;

/**
 * 系统用户表
 * @author Administrator
 *
 */
public class UserInfo implements IDataObject{
	
	/**
	 * tbl_user用户表ＩＤ
	 */
	private Long id;
	/**
	 * 用户名
	 */
	private String userName;
	/**
	 * 用户名密码
	 */
	private String userPassword;

	/**
	 * 逻辑删除
	 */
	private String isDelete;
	
	/**
	 * 角色ID
	 */
	private Integer roleID;
	
	private String roleName;
	
	/**
	 * 类型：0 超级管理员 1，（公司级别）管理员，2员工，
	 */
	private String userType;
	
	/**
	 * 员工信息ID
	 */
	private Integer employeeID;
	
	private String employeeName;
	
	private Integer enterpriseID;
	
	private String enterpriseName;
	


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Integer getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(Integer employeeID) {
		this.employeeID = employeeID;
	}

	public Integer getRoleID() {
		return roleID;
	}

	public void setRoleID(Integer roleID) {
		this.roleID = roleID;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public Integer getEnterpriseID() {
		return enterpriseID;
	}

	public void setEnterpriseID(Integer enterpriseID) {
		this.enterpriseID = enterpriseID;
	}

	public String getEnterpriseName() {
		return enterpriseName;
	}

	public void setEnterpriseName(String enterpriseName) {
		this.enterpriseName = enterpriseName;
	}

	
}
