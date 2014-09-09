package com.zh.base.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.base.model.bean.Notice;
import com.zh.base.model.bean.Role;
import com.zh.base.model.bean.User;
import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.TechnologicalProcess;

public class MainModel extends BaseModel {

	public User user;
	
	private Role role;
	
	private String newPassWord;
	
	/**
	 * 当前完成工作量
	 */
	private String contactTimeSize;
	
	private String theNextcontactSize;
	
	private List<TechnologicalProcess> technologicalProcessList;
	
	/**
	 * 系统公告
	 */
	private List<Notice> noticeList = new ArrayList<Notice>();
	
	/**
	 * 任务数量
	 */
	private int taskNumber;
	
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

	public List<TechnologicalProcess> getTechnologicalProcessList() {
		return technologicalProcessList;
	}

	public void setTechnologicalProcessList(
			List<TechnologicalProcess> technologicalProcessList) {
		this.technologicalProcessList = technologicalProcessList;
	}

	public int getTaskNumber() {
		return taskNumber;
	}

	public void setTaskNumber(int taskNumber) {
		this.taskNumber = taskNumber;
	}

	public List<Notice> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(List<Notice> noticeList) {
		this.noticeList = noticeList;
	}

	
}
