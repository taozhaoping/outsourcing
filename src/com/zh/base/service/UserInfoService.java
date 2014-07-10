package com.zh.base.service;

import java.util.List;

import com.zh.base.model.User;
import com.zh.core.model.Pager;

/**
 * 用户帐号相关操作（查询动作）
 * @author Administrator
 *
 */
public interface UserInfoService {
	
	/**
	 * 检查当前用户是否登录 (只需要传用户名)
	 * @param userinfo
	 * @return
	 */
	public User loadUserPassWord(User userInfo);
	
	/**
	 * 查询用户信息
	 * @param userInfo
	 * @return
	 */
	public User loadUserInfo(User userInfo);
	/**
	 * 修改密码
	 * @param userinfo
	 */
	public void updateUserinfo(User userInfo);
	
	/**
	 * 查询用户列表，带分页
	 * @param userInfo
	 * @return
	 */
	public List<User> listUserInfo(User userInfo , Pager page);
	
	/**
	 * 查询数量
	 * @param userInfo
	 * @return
	 */
	public Integer countUserInfo(User userInfo);
	
	/**
	 * 删除角色用户
	 * @param UserInfo
	 */
	public void delUserInfo(User userInfo);
	
	public void addUserInfo(User userInfo);

}
