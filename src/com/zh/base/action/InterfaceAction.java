package com.zh.base.action;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.InterfaceModel;
import com.zh.base.model.bean.User;
import com.zh.base.service.UserInfoService;
import com.zh.core.base.action.BaseAction;
import com.zh.web.model.bean.Activities;
import com.zh.web.model.bean.EntryProcess;
import com.zh.web.model.bean.TrainCourse;
import com.zh.web.service.ActivitiesService;
import com.zh.web.service.EntryProcessService;
import com.zh.web.service.TrainCourseService;

public class InterfaceAction extends BaseAction {

	private static final long serialVersionUID = 1L;
	
	private static Logger LOGGER = LoggerFactory.getLogger(InterfaceAction.class); 

	/**
	 * 系统用户接口
	 */
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private EntryProcessService entryProcessService;
	
	@Autowired
	private TrainCourseService trainCourseService; 
	
	@Autowired
	private ActivitiesService activitiesService;
	
	private InterfaceModel interfaceModel = new InterfaceModel();

	@Override
	public String execute() throws Exception {
		
		return "usersjson";

	}
	
	/**
	 * 获取用户接口,json返回格式
	 */
	public String queryUsers() {
		LOGGER.debug("queryUsers() ");
		//所有所有激活的用户
		User user = new User();
		user.setEnabled("0");
		List<User> userList = userInfoService.queryList(user);
		this.interfaceModel.setUserList(userList);
		return "usersjson";
	}
	
	/**
	 * 获取入职员工信息
	 * @return
	 */
	public String queryEntryProcess() {
		LOGGER.debug("entryProcess() ");
		//所有所有激活的用户
		EntryProcess entryProcess = interfaceModel.getEntryProcess();
		
		List<EntryProcess> entryProcessList = entryProcessService.queryList(entryProcess);
		this.interfaceModel.setEntryProcessList(entryProcessList);
		return "entryProcessjson";
	}
	
	/**
	 * 获取培训信息
	 * @return
	 */
	public String queryTrainCourse()
	{
		LOGGER.debug("TrainCourse() ");
		//所有所有激活的用户
		String type = interfaceModel.getType();
		TrainCourse trainCourse = interfaceModel.getTrainCourse();
		trainCourse.setTrainType(type);
		trainCourse.setEnabled("0");
		List<TrainCourse> trainCourseList = trainCourseService.queryList(trainCourse);
		this.interfaceModel.setTrainCourseList(trainCourseList);
		return "trainCoursejson";
	}

	/**
	 * 获取活动信息
	 * @return
	 */
	public String queryActivities()
	{
		LOGGER.debug("Activities() ");
		//所有所有激活的用户
		//String type = interfaceModel.getType();
		Activities activities = interfaceModel.getActivities();
		activities.setEnabled("0");
		List<Activities> activitiesList = activitiesService.queryList(activities);
		this.interfaceModel.setActivitiesList(activitiesList);
		return "activitiesjson";
	}
	
	public Object getModel() {
		return interfaceModel;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public InterfaceModel getInterfaceModel() {
		return interfaceModel;
	}

	public void setInterfaceModel(InterfaceModel interfaceModel) {
		this.interfaceModel = interfaceModel;
	}

}
