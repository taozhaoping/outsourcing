package com.zh.web.service;

import java.util.List;

import com.zh.core.model.Pager;
import com.zh.web.model.bean.Personnel;

/**
 * 员工正式数据
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public interface PersonnelService {

	/**
	 * 查询信息
	 * @param 
	 * @return
	 */
	public Personnel query(Personnel personnel);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(Personnel personnel);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<Personnel> queryList(Personnel personnel);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<Personnel> queryList(Personnel personnel , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(Personnel personnel);
	
	/**
	 * 删除
	 * @param 
	 */
	public void delete(Personnel personnel);
	
	/**
	 * 新增
	 * @param 
	 */
	public Integer insert(Personnel personnel);
}
