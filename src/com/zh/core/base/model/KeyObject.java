package com.zh.core.base.model;

import com.zh.core.model.IDataObject;

public class KeyObject extends IDataObject {

	private Integer id;
	
	private String text;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	
}
