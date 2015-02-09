package com.zh.web.service;

import java.util.List;

import com.zh.core.model.Pager;
import com.zh.web.model.bean.FranchiseeRecord;
import com.zh.web.model.bean.FranchiseeRecordVW;

public interface FranchiseeRecordService {

	/**
	 * 查询信息
	 * @param 
	 * @return
	 */
	public FranchiseeRecord query(FranchiseeRecord franchiseeRecord);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<FranchiseeRecord> queryList(FranchiseeRecord franchiseeRecord);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<FranchiseeRecord> queryList(FranchiseeRecord franchiseeRecord , Pager page);
	
	/**
	 * 查询列表(关联人员信息)，带分页
	 * @param 
	 * @return
	 */
	public List<FranchiseeRecordVW> queryVWList(FranchiseeRecordVW franchiseeRecordVW , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(FranchiseeRecord franchiseeRecord);
	
	/**
	 * 查询数量(关联人员信息)
	 * @param 
	 * @return
	 */
	public Integer countVW(FranchiseeRecordVW franchiseeRecordVW);
	
	/**
	 * 新增
	 * @param 
	 */
	public Integer insert(FranchiseeRecord franchiseeRecord);
	
}
