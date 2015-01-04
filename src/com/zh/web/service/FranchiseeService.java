package com.zh.web.service;

import java.util.List;

import com.zh.core.model.Pager;
import com.zh.web.model.bean.Franchisee;

/**
 *  加盟商接口
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public interface FranchiseeService {

	/**
	 * 查询信息
	 * @param 
	 * @return
	 */
	public Franchisee query(Franchisee franchisee);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(Franchisee franchisee);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<Franchisee> queryList(Franchisee franchisee);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<Franchisee> queryList(Franchisee franchisee , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(Franchisee franchisee);
	
	/**
	 * 删除
	 * @param 
	 */
	public void delete(Franchisee franchisee);
	
	/**
	 * 新增
	 * @param 
	 */
	public Integer insert(Franchisee franchisee);
}
