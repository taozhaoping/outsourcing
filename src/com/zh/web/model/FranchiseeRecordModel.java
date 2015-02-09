package com.zh.web.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.Franchisee;
import com.zh.web.model.bean.FranchiseeRecord;
import com.zh.web.model.bean.FranchiseeRecordVW;
import com.zh.web.model.bean.MailList;

/**
 * 通讯记录
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public class FranchiseeRecordModel extends BaseModel {

	private FranchiseeRecord franchiseeRecord = new FranchiseeRecord();
	
	private List<FranchiseeRecord> franchiseeRecordList = new ArrayList<FranchiseeRecord>();
	
	private MailList mailList = new MailList();
	
	private List<MailList> mailListList = new ArrayList<MailList>();
	
	/**
	 * 基础信息
	 */
	Franchisee franchisee = new Franchisee();
	
	private FranchiseeRecordVW franchiseeRecordVW = new FranchiseeRecordVW();
	
	private List<FranchiseeRecordVW> franchiseeRecordVWList = new ArrayList<FranchiseeRecordVW>();
	
	private String FormId;

	public FranchiseeRecord getFranchiseeRecord() {
		return franchiseeRecord;
	}

	public void setFranchiseeRecord(FranchiseeRecord franchiseeRecord) {
		this.franchiseeRecord = franchiseeRecord;
	}

	public List<FranchiseeRecord> getFranchiseeRecordList() {
		return franchiseeRecordList;
	}

	public void setFranchiseeRecordList(List<FranchiseeRecord> franchiseeRecordList) {
		this.franchiseeRecordList = franchiseeRecordList;
	}



	public Franchisee getFranchisee() {
		return franchisee;
	}

	public void setFranchisee(Franchisee franchisee) {
		this.franchisee = franchisee;
	}

	public FranchiseeRecordVW getFranchiseeRecordVW() {
		return franchiseeRecordVW;
	}

	public void setFranchiseeRecordVW(FranchiseeRecordVW franchiseeRecordVW) {
		this.franchiseeRecordVW = franchiseeRecordVW;
	}

	public List<FranchiseeRecordVW> getFranchiseeRecordVWList() {
		return franchiseeRecordVWList;
	}

	public void setFranchiseeRecordVWList(
			List<FranchiseeRecordVW> franchiseeRecordVWList) {
		this.franchiseeRecordVWList = franchiseeRecordVWList;
	}

	public String getFormId() {
		return FormId;
	}

	public void setFormId(String formId) {
		FormId = formId;
	}

	public MailList getMailList() {
		return mailList;
	}

	public void setMailList(MailList mailList) {
		this.mailList = mailList;
	}

	public List<MailList> getMailListList() {
		return mailListList;
	}

	public void setMailListList(List<MailList> mailListList) {
		this.mailListList = mailListList;
	}
	
}
