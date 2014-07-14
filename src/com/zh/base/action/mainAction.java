package com.zh.base.action;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.MainModel;
import com.zh.base.model.bean.Menu;
import com.zh.base.model.bean.Role;
import com.zh.base.model.bean.User;
import com.zh.base.service.RoleService;
import com.zh.base.service.UserInfoService;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.VariableUtil;
import com.zh.core.util.BCrypt;
import com.zh.core.util.JSONUtil;

public class mainAction extends BaseAction {

	private MainModel mainModel;
	
	private static Logger LOGGER = LoggerFactory.getLogger(mainAction.class); 
	
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private RoleService roleService;

	//private String language;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String execute() {
//		//设置当前语言
//		//this.setLanguage(this.getLocale().toString());
		
		//获取当前登录用户信息
		User user = (User) this.getSession().getAttribute(
				VariableUtil.SESSION_KEY);
//		// 获取员工信息
//		mainService.initEmployeeInfo(mainModel);
//
//		// 获取公司信息
//		mainService.initEnterprise(mainModel);
//
		// 获取角色信息和菜单信息
		Role role = new Role();
		role.setId(user.getId());
		Role roleReult = roleService.queryAuthoritiesToMenu(role);
		this.mainModel.setRole(roleReult);
//		
		//保存用户menu菜单中的action权限到session，用于过滤器的验证
		setAuthoritySession();
//		
//		//保存用户信息到session
//		this.getSession().setAttribute(VariableUtil.EMPLOYEE, mainModel.getEmployee());
//		
		return Action.SUCCESS;
	}
	
	public String initPwd() {
		mainModel.setUser((User) this.getSession().getAttribute(
				VariableUtil.SESSION_KEY));
		mainModel.getUser().setUserPassword(null);
		mainModel.setReultObject(JSONUtil.bean2json(mainModel.getUser()));
		return "updatePwd";
	}
	
	public String updatepwd() {
		String password = mainModel.getNewPassWord();
		if(null == password)
		{
			throw new ProjectException("密码不允许为空");
		}
		User userInfo = new User();
		userInfo.setId(mainModel.getId());
		userInfo.setUserPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
		userInfoService.update(userInfo);
		return Action.RETURN_JSON;
	}


	private void setAuthoritySession()
	{
		ArrayList<String> list = new ArrayList<String>();
		List<Menu> menuList = mainModel.getRole().getMenuList();
		for (Menu menu : menuList) {
			Integer parentid = menu.getParentid();
			if(parentid.equals(0))
			{
				List<Menu> mList = menu.getMenuList();
				for (Menu menu2 : mList) {
					list.add(menu2.getAction());
				}
			}
			list.add(menu.getAction());
		}
		this.getSession().setAttribute(VariableUtil.AUTHORITY, list);
	}
	
	public String rightExecute()
	{
		//mainModel.setEmployee((EmployeeInfo)this.getSession().getAttribute(VariableUtil.EMPLOYEE));

		return "right";
	}
	
	/**
	 * 获取配置参数中的属性
	 */
	private void getSystem()
	{
		
	}

	public String updateExecute() {

		return "updatePassword";
	}

	public Object getModel() {
		if (null == mainModel) {
			mainModel = new MainModel();
		}
		return mainModel;
	}

	public MainModel getMainModel() {
		return mainModel;
	}

	public void setMainModel(MainModel mainModel) {
		this.mainModel = mainModel;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

}
