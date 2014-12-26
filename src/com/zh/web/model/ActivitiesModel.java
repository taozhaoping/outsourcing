package com.zh.web.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.Activities;
import com.zh.web.model.bean.ActivitiesUser;

public class ActivitiesModel extends BaseModel {

	private Activities activities = new Activities();
	
	private List<Activities> activitiesList = new ArrayList<Activities>();
	
	/**
	 * 活动人员信息
	 */
	private ActivitiesUser activitiesUser = new ActivitiesUser();
	
	private List<ActivitiesUser> activitiesUserList = new ArrayList<ActivitiesUser>();

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

	public ActivitiesUser getActivitiesUser() {
		return activitiesUser;
	}

	public void setActivitiesUser(ActivitiesUser activitiesUser) {
		this.activitiesUser = activitiesUser;
	}

	public List<ActivitiesUser> getActivitiesUserList() {
		return activitiesUserList;
	}

	public void setActivitiesUserList(List<ActivitiesUser> activitiesUserList) {
		this.activitiesUserList = activitiesUserList;
	}
	
}
