package com.zh.base.action;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.User;
import com.zh.base.model.UserInfoModel;
import com.zh.base.service.UserInfoService;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;
import com.zh.core.model.VariableUtil;
import com.zh.core.util.BCrypt;
import com.zh.core.util.JSONUtil;

public class UserInfoAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static Logger LOGGER = LoggerFactory.getLogger(UserInfoAction.class); 

	/**
	 * 系统用户接口
	 */
	@Autowired
	private UserInfoService userInfoService;

	private UserInfoModel userInfoModel = new UserInfoModel();

	@Override
	public String execute() throws Exception {
		return "success";

	}
	
	public void validatorUserName()
	{
		String userName= userInfoModel.getUserName();
		String oldUserName = userInfoModel.getOldUserName();
		boolean bool = true;
		if(null != userName && !userName.equals(oldUserName))
		{
			User user = new User();
			user.setName(userName);
			User userInfo = userInfoService.loadUserInfo(user);
			if(null != userInfo)
			{
				bool = false;
			}
		}
		userInfoModel.getDataMap().put("success", bool);
		try {
			this.write(String.valueOf(bool), "UTF-8");
		} catch (IOException e1) {
			throw new ProjectException("检查用户失败", e1.getCause());
		}
		
		
	}
	
	/**
	 * 停用和激活用户
	 * @return
	 */
	public String executeDelete()
	{
//		Map<String, Object> dataMap = this.userInfoModel.getDataMap();
//		Object[] idArray = JSONUtil.jsonStringToarry("id", userInfoModel
//				.getJsonIDString());
//		for (Object object : idArray) {
//			UserInfo user = new UserInfo();
//			user.setId(Long.valueOf(object.toString()));
//			UserInfo userInfo = userInfoService.loadUserInfo(user);
//			if(null == userInfo)
//			{
//				dataMap.put("status", "error");
//				dataMap.put("errorMeage", "请先删除员工对应的系统账号!");
//				return Action.RETURN_JSON;
//			}
//			EmployeeInfo employee = new EmployeeInfo();
//			employee.setId(userInfo.getEmployeeID());
//			EmployeeInfo employeeInfo = employeeService.queryEmployee(employee);
//			if("0".equals(userInfo.getIsDelete()))
//			{
//				employeeInfo.setIsDelete("1");
//				userInfo.setIsDelete("1");
//			}else
//			{
//				employeeInfo.setIsDelete("0");
//				userInfo.setIsDelete("0");
//			}
//			userInfoService.updateUserinfo(userInfo);
//			employeeService.updateEmployee(employeeInfo);
//		}
		//dataMap.put("status", "success");
		return Action.RETURN_JSON;
	}

	public String initPwd() {
		userInfoModel.setUserInfo((User) this.getSession().getAttribute(
				VariableUtil.SESSION_KEY));
		userInfoModel.getUserInfo().setUserPassword(null);
		userInfoModel.setReultObject(JSONUtil.bean2json(userInfoModel
				.getUserInfo()));
		return "updatePwd";
	}

	public String updatepwd() {
		String password = userInfoModel.getNewPassWord();
		if(null == password)
		{
			throw new ProjectException("密码不允许为空");
		}
		User userInfo = userInfoModel.getUserInfo();
		userInfo.setUserPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
		userInfoService.updateUserinfo(userInfo);
		return Action.RETURN_JSON;
	}

	public String executeJson() {
		int totalRows = userInfoService.countUserInfo(userInfoModel
				.getUserInfo());
		Pager pageInfo = userInfoModel.getPageInfo();
		pageInfo.setTotalRow(totalRows);
		List<User> userList = userInfoService.listUserInfo(userInfoModel
				.getUserInfo(), pageInfo);
		userInfoModel.setUserList(userList);
		// this.setReturnJSON(JSONUtil.list2json(roleList));
		userInfoModel.getDataMap().put("Rows", userList);
		userInfoModel.getDataMap().put("Total", totalRows);
		return Action.RETURN_JSON;
	}
	
	public String editor()
	{
		if (null == userInfoModel.getView()) {
			return "crud";
		}
		if ("update".equals(userInfoModel.getView())
				|| "look".equals(userInfoModel.getView())) {
			User userInfo = userInfoService.loadUserInfo(userInfoModel.getUserInfo());
			userInfo.setUserPassword(null);
			userInfoModel.setUserInfo(userInfo);
			userInfoModel.setReultObject(JSONUtil.bean2json(userInfo));
		}
		return "editor";
	}
	
	public String save()
	{
		User userInfo = userInfoModel.getUserInfo();
		Integer id = userInfo.getId();
		String password = userInfo.getUserPassword();
		if( null != password )
		{
			if("".equals(password)){
				userInfo.setUserPassword(null);
			}else
			{
				userInfo.setUserPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
			}
		}
		if (null != id && id > 0)
		{
			userInfoService.updateUserinfo(userInfoModel.getUserInfo());
		}else
		{
			userInfoService.addUserInfo(userInfoModel.getUserInfo());
		}
		return Action.RETURN_JSON;
	}

	public Object getModel() {
		return userInfoModel;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public UserInfoModel getUserInfoModel() {
		return userInfoModel;
	}

	public void setUserInfoModel(UserInfoModel userInfoModel) {
		this.userInfoModel = userInfoModel;
	}
}
