package com.zh.web.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.TrainCourse;

public class TrainCourseModel extends BaseModel {

	private TrainCourse trainCourse = new TrainCourse();
	
	private List<TrainCourse> trainCourseList = new ArrayList<TrainCourse>();

	public TrainCourse getTrainCourse() {
		return trainCourse;
	}

	public void setTrainCourse(TrainCourse trainCourse) {
		this.trainCourse = trainCourse;
	}

	public List<TrainCourse> getTrainCourseList() {
		return trainCourseList;
	}

	public void setTrainCourseList(List<TrainCourse> trainCourseList) {
		this.trainCourseList = trainCourseList;
	}
	
	
}
