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
import com.zh.core.exception.ProjectException;

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
	
	public String editor()
	{
		Integer id = this.enterpriseModel.getId();
		if(null == id || "".equals(id))
		{
			ProjectException.createException("主建不允许为空!");
		}
		Enterprise enterprise = this.enterpriseModel.getEnterprise();
		enterprise.setId(id);
		Enterprise enterpriseReult = enterpriseService.query(enterprise);
		this.enterpriseModel.setEnterprise(enterpriseReult);
		return Action.EDITOR;
		
	}
	
	public String Save()
	{
		Enterprise enterprise = this.enterpriseModel.getEnterprise();
		Integer id = enterprise.getId();
		
		//判断是新增还是修改
		if(null == id || 0 == id)
		{
			
		}
		return Action.EDITOR_SUCCESS;
	}

}
