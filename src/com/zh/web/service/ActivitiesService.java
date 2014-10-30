package com.zh.web.service;

import java.util.List;
import com.zh.core.model.Pager;
import com.zh.web.model.bean.Activities;

public interface ActivitiesService {

	/**
	 * 查询信息
	 * @param 
	 * @return
	 */
	public Activities query(Activities activities);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(Activities activities);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<Activities> queryList(Activities activities);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<Activities> queryList(Activities activities , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(Activities activities);
	
	/**
	 * 删除
	 * @param 
	 */
	public void delete(Activities activities);
	
	/**
	 * 新增
	 * @param 
	 */
	public Integer insert(Activities activities);
}
