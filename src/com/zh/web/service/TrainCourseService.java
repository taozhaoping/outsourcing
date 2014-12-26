package com.zh.web.service;

import java.util.List;

import com.zh.core.model.Pager;
import com.zh.web.model.bean.TrainCourse;

/**
 * 培训课程信息接口
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public interface TrainCourseService {

	/**
	 * 查询信息
	 * @param 
	 * @return
	 */
	public TrainCourse query(TrainCourse trainCourse);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(TrainCourse trainCourse);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<TrainCourse> queryList(TrainCourse trainCourse);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<TrainCourse> queryList(TrainCourse trainCourse , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(TrainCourse trainCourse);
	
	/**
	 * 删除
	 * @param 
	 */
	public void delete(TrainCourse trainCourse);
	
	/**
	 * 新增
	 * @param 
	 */
	public Integer insert(TrainCourse trainCourse);
}
