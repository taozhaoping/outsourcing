package com.zh.web.service;

import java.util.List;

import com.zh.core.model.Pager;
import com.zh.web.model.bean.Change;
import com.zh.web.model.bean.Franchisee;
import com.zh.web.model.bean.FranchiseeBO;

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
	 * 查询信息
	 * @param  change
	 * @return change
	 */
	public Change query(Change change);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(Franchisee franchisee);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(Change change);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(FranchiseeBO franchiseeBo);
	
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
	
	
	/**
	 * 新建加盟表单
	 * @param franchiseeBo
	 * @return 新增后的结果
	 */
	public FranchiseeBO insert(FranchiseeBO franchiseeBo);
	
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<FranchiseeBO> queryList(FranchiseeBO franchiseeBo);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<FranchiseeBO> queryList(FranchiseeBO franchiseeBo , Pager page);
	
	/**
	 * 查询列表，带分页，根据权限，创建者，审批者
	 * @param 
	 * @return
	 */
	public List<FranchiseeBO> queryPageListByPermission(FranchiseeBO franchiseeBo , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(FranchiseeBO franchiseeBo);

	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer countByPermission(FranchiseeBO franchiseeBo);
}
