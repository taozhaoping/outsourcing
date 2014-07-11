package com.zh.base.action;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.EnterpriseModel;
import com.zh.base.model.bean.Enterprise;
import com.zh.base.service.EnterpriseService;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;

public class EnterpriseAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static Logger LOGGER = LoggerFactory.getLogger(EnterpriseAction.class); 
	
	private EnterpriseModel enterpriseModel = new EnterpriseModel();
	
	@Autowired
	private EnterpriseService enterpriseService;

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return enterpriseModel;
	}
	
	/**
	 * 企业管理入口
	 */
	public String execute()
	{
		Enterprise enterprise = this.enterpriseModel.getEnterprise();
		List<Enterprise> List = enterpriseService.queryList(enterprise);
		this.enterpriseModel.setEnterpriseList(List);
		return Action.SUCCESS;
	}

}
