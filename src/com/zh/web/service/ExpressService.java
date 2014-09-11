package com.zh.web.service;

import java.util.List;
import com.zh.core.model.Pager;
import com.zh.web.model.bean.Express;

public interface ExpressService {

	/**
	 * 查询信息
	 * @param 根据员工id查询
	 * @return
	 */
	public Express query(Express express);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(Express express);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<Express> queryList(Express express);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<Express> queryList(Express express , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(Express express);
	
	/**
	 * 删除
	 * @param 
	 */
	public void delete(Express express);
	
	/**
	 * 新增
	 * @param 
	 */
	public void insert(Express express);
}
