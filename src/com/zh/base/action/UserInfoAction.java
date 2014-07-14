package com.zh.base.action;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.UserInfoModel;
import com.zh.base.model.bean.Enterprise;
import com.zh.base.model.bean.User;
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
		User user = this.userInfoModel.getUserInfo();
		Pager pager = this.userInfoModel.getPageInfo();
		Integer count = userInfoService.count(user);
		pager.setTotalRow(count);
		List<User> userList = userInfoService.queryList(user,pager);
		this.userInfoModel.setUserList(userList);
		return Action.SUCCESS;

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
			User userInfo = userInfoService.query(user);
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
	

	public String editor()
	{
		Integer id = this.userInfoModel.getId();
		if(null != id && !"".equals(id))
		{
			User user = this.userInfoModel.getUserInfo();
			user.setId(id);
			User userReult = userInfoService.query(user);
			this.userInfoModel.setUserInfo(userReult);
		}
		return Action.EDITOR;
	}
	
	public String save()
	{
		User user = this.userInfoModel.getUserInfo();
		
		//判断当前是设置成启动状态还是停用状态
		String view = this.userInfoModel.getView();
		if(null != view && "enabled".equals(view))
		{
			String enabled = this.userInfoModel.getEnabled();
			Integer id = this.userInfoModel.getId();
			if("0".equals(enabled))
			{
				user.setEnabled("1");
			}else
			{
				user.setEnabled("0");
			}
			user.setId(id);
		}
		
		//判断是新增还是修改
		Integer id = user.getId();
		if(null == id || 0 == id)
		{
			userInfoService.insert(user);
		}else
		{
			userInfoService.update(user);
		}
		return Action.EDITOR_SUCCESS;
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
