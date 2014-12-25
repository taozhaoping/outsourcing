package com.zh.web.model.bean;

import com.zh.core.model.IDataObject;

/**
 * 活动人员信息
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public class ActivitiesUser extends IDataObject {

	 private Integer id;
	
	 private Integer activitiesId;
	 
	 private Integer technologicalProcessId;
	 
	 private String name;
	 
	 private String createDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getActivitiesId() {
		return activitiesId;
	}

	public void setActivitiesId(Integer activitiesId) {
		this.activitiesId = activitiesId;
	}

	public Integer getTechnologicalProcessId() {
		return technologicalProcessId;
	}

	public void setTechnologicalProcessId(Integer technologicalProcessId) {
		this.technologicalProcessId = technologicalProcessId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}


}
