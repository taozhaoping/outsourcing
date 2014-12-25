package com.zh.base.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.base.model.bean.User;
import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.Activities;
import com.zh.web.model.bean.ActivitiesUser;
import com.zh.web.model.bean.EntryProcess;
import com.zh.web.model.bean.TrainCourse;

public class InterfaceModel extends BaseModel {

	private String type;
	
	private User user = new User();
	
	private List<User> userList = new ArrayList<User>();
	
	private EntryProcess entryProcess = new EntryProcess();

	private List<EntryProcess> entryProcessList = new ArrayList<EntryProcess>();
	
	private TrainCourse trainCourse = new TrainCourse();
	
	private List<TrainCourse> trainCourseList = new ArrayList<TrainCourse>();
	
	/**
	 * 活动人员信息
	 */
	private Activities activities = new Activities();
	
	/**
	 * 活动信息
	 */
	private List<Activities> activitiesList = new ArrayList<Activities>();
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public EntryProcess getEntryProcess() {
		return entryProcess;
	}

	public void setEntryProcess(EntryProcess entryProcess) {
		this.entryProcess = entryProcess;
	}

	public List<EntryProcess> getEntryProcessList() {
		return entryProcessList;
	}

	public void setEntryProcessList(List<EntryProcess> entryProcessList) {
		this.entryProcessList = entryProcessList;
	}

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Activities getActivities() {
		return activities;
	}

	public void setActivities(Activities activities) {
		this.activities = activities;
	}

	public List<Activities> getActivitiesList() {
		return activitiesList;
	}

	public void setActivitiesList(List<Activities> activitiesList) {
		this.activitiesList = activitiesList;
	}

}
