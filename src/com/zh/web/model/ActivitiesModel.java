package com.zh.web.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.Activities;

public class ActivitiesModel extends BaseModel {

	private Activities activities = new Activities();
	
	private List<Activities> activitiesList = new ArrayList<Activities>();

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
