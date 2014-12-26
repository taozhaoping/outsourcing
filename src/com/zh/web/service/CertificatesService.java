package com.zh.web.service;

import java.util.List;

import org.apache.avalon.framework.parameters.ParameterException;

import com.zh.core.model.IDataObject;
import com.zh.core.model.Pager;
import com.zh.web.model.bean.Certificates;

/**
 * 证件信息接口
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public interface CertificatesService {

	/**
	 * 查询信息
	 * @param 
	 * @return
	 */
	public Certificates query(Certificates certificates);
	
	/**
	 * 修改
	 * @param 
	 */
	public void update(Certificates certificates);
	
	/**
	 * 查询列表
	 * @param 
	 * @return
	 */
	public List<Certificates> queryList(Certificates certificates);
	
	/**
	 * 查询列表，带分页
	 * @param 
	 * @return
	 */
	public List<Certificates> queryList(Certificates certificates , Pager page);
	
	/**
	 * 查询数量
	 * @param 
	 * @return
	 */
	public Integer count(Certificates certificates);
	
	/**
	 * 删除
	 * @param 
	 */
	public void delete(Certificates certificates);
	
	/**
	 * 新增
	 * @param 
	 */
	public void insert(Certificates certificates);
	
	/**
	 * 批量新增或者修改（id不为null的时候为修改，否则新增）
	 * @param
	 */
	public void insertList(List<IDataObject> certificatesList) throws ParameterException;
}
