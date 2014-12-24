package com.zh.web.service;

import java.util.List;

import com.zh.core.model.Pager;
import com.zh.web.model.bean.TrainingOfPersonnel;

public interface TrainingOfPersonnelService {

	/**
	 * 查询信息
	 * @param 
	 * @return
	 */
	public TrainingOfPersonnel query(TrainingOfPersonnel trainingOfPersonnel);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(TrainingOfPersonnel trainingOfPersonnel);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<TrainingOfPersonnel> queryList(TrainingOfPersonnel trainingOfPersonnel);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<TrainingOfPersonnel> queryList(TrainingOfPersonnel trainingOfPersonnel , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(TrainingOfPersonnel trainingOfPersonnel);
	
	/**
	 * 删除
	 * @param 
	 */
	public void delete(TrainingOfPersonnel trainingOfPersonnel);
	
	/**
	 * 新增
	 * @param 
	 */
	public Integer insert(TrainingOfPersonnel trainingOfPersonnel);
}
