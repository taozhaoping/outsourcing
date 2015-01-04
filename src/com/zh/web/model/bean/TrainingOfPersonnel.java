package com.zh.web.model.bean;

import com.zh.core.model.IDataObject;

/**
 * 培训人员信息表 
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public class TrainingOfPersonnel extends IDataObject {

	 private Integer id;
	
	 private Integer trainCourseId;
	 
	 private Integer technologicalProcessId;
	 
	 private String name;
	 
	 private String createDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTrainCourseId() {
		return trainCourseId;
	}

	public void setTrainCourseId(Integer trainCourseId) {
		this.trainCourseId = trainCourseId;
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
