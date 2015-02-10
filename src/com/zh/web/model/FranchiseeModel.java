package com.zh.web.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.Change;
import com.zh.web.model.bean.Franchisee;
import com.zh.web.model.bean.FranchiseeBO;
import com.zh.web.model.bean.MailList;

public class FranchiseeModel extends BaseModel {

	/**
	 * 表单基本信息bean
	 */
	private Change change = new Change();
	
	/**
	 * 加盟商信息
	 */
	private Franchisee franchisee = new Franchisee();
	
	
	/**
	 * 加盟流程信息
	 */
	private FranchiseeBO franchiseeBO = new FranchiseeBO();  
	
	/**
	 * 通讯录
	 */
	private MailList mailList = new MailList();
	
	
	/***
	 * 流程实例id
	 */
	private String processInstanceId;
	
	/***
	 * 是否有批准权限 0 没有 1 有
	 */
	private String hasApprove;
	
	/***
	 * 是否具有发起流程的权限 0 没有 1 有
	 */
	private String hasSubmitAuth;
	
	/**
	 * 审核结果
	 */
	private List<String> auditRet;
	
	private List<MailList> mailListList = new ArrayList<MailList>();
	
	private List<Franchisee> franchiseeList = new ArrayList<Franchisee>();

	private List<FranchiseeBO> franchiseeBOList = new ArrayList<FranchiseeBO>();

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

	public Change getChange() {
		return change;
	}

	public void setChange(Change change) {
		this.change = change;
	}

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	public String getHasApprove() {
		return hasApprove;
	}

	public void setHasApprove(String hasApprove) {
		this.hasApprove = hasApprove;
	}

	public String getHasSubmitAuth() {
		return hasSubmitAuth;
	}

	public void setHasSubmitAuth(String hasSubmitAuth) {
		this.hasSubmitAuth = hasSubmitAuth;
	}

	public List<String> getAuditRet() {
		return auditRet;
	}

	public void setAuditRet(List<String> auditRet) {
		this.auditRet = auditRet;
	}

	public FranchiseeBO getFranchiseeBO() {
		return franchiseeBO;
	}

	public void setFranchiseeBO(FranchiseeBO franchiseeBO) {
		this.franchiseeBO = franchiseeBO;
	}

	public List<FranchiseeBO> getFranchiseeBOList() {
		return franchiseeBOList;
	}

	public void setFranchiseeBOList(List<FranchiseeBO> franchiseeBOList) {
		this.franchiseeBOList = franchiseeBOList;
	}
	
}
