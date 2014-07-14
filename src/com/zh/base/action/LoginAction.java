package com.zh.base.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.bean.User;
import com.zh.base.service.UserInfoService;
import com.zh.core.base.action.BaseAction;
import com.zh.core.model.VariableUtil;
import com.zh.core.util.BCrypt;


public class LoginAction extends BaseAction {


	private static final long serialVersionUID = 1L;
	
	private static Logger LOGGER = LoggerFactory.getLogger(LoginAction.class); 

	// 前台传入的验证码
	private String validecode;

	/**
	 * 系统用户接口
	 */
	@Autowired
	private UserInfoService userInfoService;
	
	private User userInfo = new User();;


	public String excute() {
		Object user = this.getSession().getAttribute(VariableUtil.SESSION_KEY);
		if( null != user )
		{
			this.getSession().removeAttribute(VariableUtil.SESSION_KEY);
			this.getSession().removeAttribute(VariableUtil.MENULIST);
		}
		return "creater";
	}

	public String loginUser() {
		String code = (String) this.getRequest().getSession().getAttribute("code");
		if (null == validecode || null == code || !validecode.toUpperCase().equals(code)) {
			this.setErrorMessage(getText("COM.SSI.ERROR.CODE"));
			return "creater";
		}
		String password = null;
		if(null != userInfo.getUserPassword()){
			password = userInfo.getUserPassword();
		}else{
			this.setErrorMessage(getText("COM.SSI.ERROR.USERNAME"));
			return "creater";
		}
		userInfo.setUserPassword(null);
		User user = userInfoService.query(userInfo);
		
		//密码验证
		if (null != password && null != user && BCrypt.checkpw(password , user.getUserPassword())) {
			//保存当前用户信息到session中
			this.getSession().setAttribute(VariableUtil.SESSION_KEY, user);
			return "success";
		} else {
			this.setErrorMessage(getText("COM.SSI.ERROR.USERNAME"));
			return "creater";
		}
	}
	
	/***
	 * 跳转到获取密码页面
	 * @return
	 */
	public String resetPassword(){
		LOGGER.debug("resetPassword()");
		return "reset";
	}
	
	/***
	 * 重置密码
	 * @return
	 */
	public String doResetPassword(){
		LOGGER.debug("doResetPassword()");
		//TODO
		return "success";
	}


	public String getValidecode() {
		return validecode;
	}

	public void setValidecode(String validecode) {
		this.validecode = validecode;
	}

	public Object getModel() {
		return userInfo;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public User getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(User userInfo) {
		this.userInfo = userInfo;
	}

	
}
