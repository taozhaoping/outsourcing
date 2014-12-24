package com.zh.web.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.TrainCourse;
import com.zh.web.model.bean.TrainingOfPersonnel;

public class TrainCourseModel extends BaseModel {

	private TrainCourse trainCourse = new TrainCourse();
	
	private List<TrainCourse> trainCourseList = new ArrayList<TrainCourse>();
	
	private TrainingOfPersonnel trainingOfPersonnel = new TrainingOfPersonnel();;
	
	private List<TrainingOfPersonnel> trainingOfPersonnelList = new ArrayList<TrainingOfPersonnel>();

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

	public TrainingOfPersonnel getTrainingOfPersonnel() {
		return trainingOfPersonnel;
	}

	public void setTrainingOfPersonnel(TrainingOfPersonnel trainingOfPersonnel) {
		this.trainingOfPersonnel = trainingOfPersonnel;
	}

	public List<TrainingOfPersonnel> getTrainingOfPersonnelList() {
		return trainingOfPersonnelList;
	}

	public void setTrainingOfPersonnelList(
			List<TrainingOfPersonnel> trainingOfPersonnelList) {
		this.trainingOfPersonnelList = trainingOfPersonnelList;
	}
	
}
