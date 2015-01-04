package com.zh.web.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.Franchisee;

public class FranchiseeModel extends BaseModel {

	private Franchisee franchisee = new Franchisee();
	
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
	
}
