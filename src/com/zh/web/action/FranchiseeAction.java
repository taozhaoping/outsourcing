package com.zh.web.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.web.model.FranchiseeModel;
import com.zh.web.service.FranchiseeService;

public class FranchiseeAction extends BaseAction {

	private FranchiseeModel franchiseeModel = new FranchiseeModel();
	
	@Autowired
	private FranchiseeService franchiseeService;
	
	public String execute() {
		
		return Action.SUCCESS;
	}
	
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return franchiseeModel;
	}

}
