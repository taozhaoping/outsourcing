package com.zh.web.service;

import java.util.List;

import com.zh.core.model.Pager;
import com.zh.web.model.bean.ActivitiesUser;

/**
 * 活动人员信息表
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public interface ActivitiesUserService {

	/**
	 * 查询信息
	 * @param 
	 * @return
	 */
	public ActivitiesUser query(ActivitiesUser activitiesUser);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(ActivitiesUser activitiesUser);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<ActivitiesUser> queryList(ActivitiesUser activitiesUser);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<ActivitiesUser> queryList(ActivitiesUser activitiesUser , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(ActivitiesUser activitiesUser);
	
	/**
	 * 删除
	 * @param 
	 */
	public void delete(ActivitiesUser activitiesUser);
	
	/**
	 * 新增
	 * @param 
	 */
	public Integer insert(ActivitiesUser activitiesUser);
}
