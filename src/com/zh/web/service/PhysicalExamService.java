package com.zh.web.service;

import java.util.List;
import com.zh.core.model.Pager;
import com.zh.web.model.bean.Activities;
import com.zh.web.model.bean.PhysicalExam;

/**
 * 体检信息
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public interface PhysicalExamService {

	/**
	 * 查询信息
	 * @param 
	 * @return
	 */
	public PhysicalExam query(PhysicalExam physicalExam);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(PhysicalExam physicalExam);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<PhysicalExam> queryList(PhysicalExam physicalExam);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<PhysicalExam> queryList(PhysicalExam physicalExam , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(PhysicalExam physicalExam);
	
	/**
	 * 删除
	 * @param 
	 */
	public void delete(PhysicalExam physicalExam);
	
	/**
	 * 新增
	 * @param 
	 */
	public Integer insert(PhysicalExam physicalExam);
}
