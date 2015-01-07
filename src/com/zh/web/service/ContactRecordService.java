package com.zh.web.service;

import java.util.List;

import com.zh.core.model.Pager;
import com.zh.web.model.bean.Certificates;
import com.zh.web.model.bean.ContactRecord;
import com.zh.web.model.bean.ContactRecordVW;

public interface ContactRecordService {

	/**
	 * 查询信息
	 * @param 
	 * @return
	 */
	public ContactRecord query(ContactRecord contactRecord);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<ContactRecord> queryList(ContactRecord contactRecord);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<ContactRecord> queryList(ContactRecord contactRecord , Pager page);
	
	/**
	 * 查询列表(关联人员信息)，带分页
	 * @param 
	 * @return
	 */
	public List<ContactRecordVW> queryVWList(ContactRecordVW contactRecordVW , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(ContactRecord contactRecord);
	
	/**
	 * 查询数量(关联人员信息)
	 * @param 
	 * @return
	 */
	public Integer countVW(ContactRecordVW contactRecordVW);
	
	/**
	 * 新增
	 * @param 
	 */
	public Integer insert(ContactRecord contactRecord);
	
}
