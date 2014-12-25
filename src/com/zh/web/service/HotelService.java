package com.zh.web.service;

import java.util.List;
import com.zh.core.model.Pager;
import com.zh.web.model.bean.Hotel;

/**
 * 酒店信息接口
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public interface HotelService {

	/**
	 * 查询信息
	 * @param 
	 * @return
	 */
	public Hotel query(Hotel hotel);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(Hotel hotel);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<Hotel> queryList(Hotel hotel);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<Hotel> queryList(Hotel hotel , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(Hotel hotel);
	
	/**
	 * 删除
	 * @param 
	 */
	public void delete(Hotel hotel);
	
	/**
	 * 新增
	 * @param 
	 */
	public Integer insert(Hotel hotel);
}
