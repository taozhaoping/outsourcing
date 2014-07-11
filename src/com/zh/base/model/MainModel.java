package com.zh.base.model;

import com.zh.base.model.bean.Role;
import com.zh.base.model.bean.User;
import com.zh.core.base.model.BaseModel;

public class MainModel extends BaseModel {

	public User user;
	
	private Role role;
	
	private String newPassWord;
	
	/**
	 * 当前完成工作量
	 */
	private String contactTimeSize;
	
	private String theNextcontactSize;
	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getNewPassWord() {
		return newPassWord;
	}

	public void setNewPassWord(String newPassWord) {
		this.newPassWord = newPassWord;
	}

	public String getContactTimeSize() {
		return contactTimeSize;
	}

	public void setContactTimeSize(String contactTimeSize) {
		this.contactTimeSize = contactTimeSize;
	}

	public String getTheNextcontactSize() {
		return theNextcontactSize;
	}

	public void setTheNextcontactSize(String theNextcontactSize) {
		this.theNextcontactSize = theNextcontactSize;
	}

}
