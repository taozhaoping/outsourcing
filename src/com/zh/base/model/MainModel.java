package com.zh.base.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.base.model.bean.Notice;
import com.zh.base.model.bean.Role;
import com.zh.base.model.bean.User;
import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.ContactRecordVW;
import com.zh.web.model.bean.FranchiseeRecordVW;
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
	
	private Notice notice;
	
	/**
	 * 系统公告
	 */
	private List<Notice> noticeList = new ArrayList<Notice>();
	
	/**
	 * 待联系外教
	 */
	private List<ContactRecordVW> contactRecordVWList = new ArrayList<ContactRecordVW>();
	
	/**
	 * 待联系加盟商
	 */
	private List<FranchiseeRecordVW> franchiseeRecordVWList = new ArrayList<FranchiseeRecordVW>();
	
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

	public Notice getNotice() {
		return notice;
	}

	public void setNotice(Notice notice) {
		this.notice = notice;
	}

	public List<ContactRecordVW> getContactRecordVWList() {
		return contactRecordVWList;
	}

	public void setContactRecordVWList(List<ContactRecordVW> contactRecordVWList) {
		this.contactRecordVWList = contactRecordVWList;
	}

	public List<FranchiseeRecordVW> getFranchiseeRecordVWList() {
		return franchiseeRecordVWList;
	}

	public void setFranchiseeRecordVWList(
			List<FranchiseeRecordVW> franchiseeRecordVWList) {
		this.franchiseeRecordVWList = franchiseeRecordVWList;
	}
}
