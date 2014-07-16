package com.zh.core.model;

import java.io.Serializable;

import com.zh.core.base.model.IdataObject;

/**
 * 数据对象接口
 * @author Flouny.Caesar
 *
 */
public abstract class IDataObject implements Serializable {

	private String orderByClause;

	public String getOrderByClause() {
		return orderByClause;
	}

	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}
}