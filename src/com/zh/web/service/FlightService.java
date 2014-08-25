package com.zh.web.service;

import java.util.List;

import com.zh.core.model.Pager;
import com.zh.web.model.bean.Flight;

public interface FlightService {

	/**
	 * 查询信息
	 * @param 根据员工id查询
	 * @return
	 */
	public Flight query(Flight flight);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(Flight flight);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<Flight> queryList(Flight flight);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<Flight> queryList(Flight flight , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(Flight flight);
	
	/**
	 * 删除
	 * @param 
	 */
	public void delete(Flight flight);
	
	/**
	 * 新增
	 * @param 
	 */
	public void insert(Flight flight);
}
