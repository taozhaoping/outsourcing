package com.zh.base.action;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.RoleModel;
import com.zh.base.model.bean.Role;
import com.zh.base.service.RoleService;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;

public class RoleAction extends BaseAction {

	/**
	 * 角色Action
	 */
	private static final long serialVersionUID = 1L;
	
	private static Logger LOGGER = LoggerFactory.getLogger(RoleAction.class); 
	
	private RoleModel roleModel = new RoleModel();
	
	@Autowired
	private RoleService roleService;

	@Override
	public Object getModel() {
		return roleModel;
	}
	
	/**
	 * 角色管理入口
	 */
	public String execute() {
		LOGGER.debug("execute() ");
		
		Role role = this.roleModel.getRole();
		Pager page = this.roleModel.getPageInfo();
		Integer count = roleService.count(role);
		page.setTotalRow(count);
		List<Role> roleList = roleService.queryList(role,page);
		this.roleModel.setRoleList(roleList);
		
		return Action.SUCCESS;
	}
	
	/***
	 * 编辑角色
	 * @return
	 */
	public String editor() {
		LOGGER.debug("editor()");
		
		Integer id = this.roleModel.getId();
		if(null == id || "".equals(id)){
			ProjectException.createException("主建不允许为空!");
		}
		
		Role role = this.roleModel.getRole();
		role.setId(id);
		
		Role roleRet = roleService.queryAuthoritiesToMenu(role);
		
		this.roleModel.setRole(roleRet);
		/*
		Integer id = this.enterpriseModel.getId();
		if(null == id || "".equals(id))
		{
			ProjectException.createException("主建不允许为空!");
		}
		Enterprise enterprise = this.enterpriseModel.getEnterprise();
		enterprise.setId(id);
		Enterprise enterpriseReult = enterpriseService.query(enterprise);
		this.enterpriseModel.setEnterprise(enterpriseReult);
		*/
		return Action.EDITOR;
		
	}
	
	/***
	 * 新增或者修改角色
	 * @return
	 */
	public String save() {
		LOGGER.debug("save()");
		/*
		Enterprise enterprise = this.enterpriseModel.getEnterprise();
		Integer id = enterprise.getId();
		
		//判断是新增还是修改
		if(null == id || 0 == id)
		{
			enterpriseService.insert(enterprise);
		}else
		{
			enterpriseService.update(enterprise);
		}
		*/
		return Action.EDITOR_SUCCESS;
	}

}
