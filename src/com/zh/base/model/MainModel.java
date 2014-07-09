package com.zh.base.model;

import com.zh.core.base.model.BaseModel;

public class MainModel extends BaseModel {

	public UserInfo user;
	
	private String newPassWord;
	
	/**
	 * 当前完成工作量
	 */
	private String contactTimeSize;
	
	private String theNextcontactSize;

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
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
