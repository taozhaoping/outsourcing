package com.zh.base.service;

import java.util.List;

import com.zh.base.model.UserInfo;
import com.zh.core.model.Pager;

/**
 * 用户帐号相关操作（查询动作）
 * @author Administrator
 *
 */
public interface UserInfoService {
	
	public static String SEQUENCE_NAME = "SEQUENCE_T_USER";
	/**
	 * 检查当前用户是否登录 (只需要传用户名)
	 * @param userinfo
	 * @return
	 */
	public UserInfo loadUserPassWord(UserInfo userInfo);
	
	/**
	 * 查询用户信息
	 * @param userInfo
	 * @return
	 */
	public UserInfo loadUserInfo(UserInfo userInfo);
	/**
	 * 修改密码
	 * @param userinfo
	 */
	public void updateUserinfo(UserInfo userInfo);
	
	/**
	 * 查询用户列表，带分页
	 * @param userInfo
	 * @return
	 */
	public List<UserInfo> listUserInfo(UserInfo userInfo , Pager page);
	
	/**
	 * 查询数量
	 * @param userInfo
	 * @return
	 */
	public Integer countUserInfo(UserInfo userInfo);
	
	/**
	 * 删除角色用户
	 * @param UserInfo
	 */
	public void delUserInfo(UserInfo userInfo);
	
	public void addUserInfo(UserInfo userInfo);

}
