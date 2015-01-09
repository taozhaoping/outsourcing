package com.zh.web.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.Franchisee;
import com.zh.web.model.bean.MailList;

public class FranchiseeModel extends BaseModel {

	private Franchisee franchisee = new Franchisee();
	
	private MailList mailList = new MailList();
	
	private List<MailList> mailListList = new ArrayList<MailList>();
	
	private List<Franchisee> franchiseeList = new ArrayList<Franchisee>();

	public Franchisee getFranchisee() {
		return franchisee;
	}

	public void setFranchisee(Franchisee franchisee) {
		this.franchisee = franchisee;
	}

	public List<Franchisee> getFranchiseeList() {
		return franchiseeList;
	}

	public void setFranchiseeList(List<Franchisee> franchiseeList) {
		this.franchiseeList = franchiseeList;
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
