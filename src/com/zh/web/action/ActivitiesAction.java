package com.zh.web.action;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.model.Pager;
import com.zh.web.model.ActivitiesModel;
import com.zh.web.model.bean.Activities;
import com.zh.web.service.ActivitiesService;

/**
 * 活动管理
 * 
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public class ActivitiesAction extends BaseAction {

	private static Logger LOGGER = LoggerFactory
			.getLogger(ActivitiesAction.class);

	@Autowired
	private ActivitiesService activitiesService;

	private ActivitiesModel activitiesModel = new ActivitiesModel();

	public String execute() {
		LOGGER.debug("execute()");
		Activities activities = activitiesModel.getActivities();
		Pager pager = this.activitiesModel.getPageInfo();
		Integer count = activitiesService.count(activities);
		pager.setTotalRow(count);
		List<Activities> activitiesList = activitiesService.queryList(
				activities, pager);
		this.activitiesModel.setActivitiesList(activitiesList);
		return Action.SUCCESS;
	}
	
	public String editor(){
		LOGGER.debug("editor()");
		Integer id = this.activitiesModel.getId();
		if(null != id && !"".equals(id))
		{
			Activities activities = activitiesModel.getActivities();
			activities.setId(id);
			Activities activitiesReult = activitiesService.query(activities);
			this.activitiesModel.setActivities(activitiesReult);
		}
		return Action.EDITOR;
	}
	
	public String save(){
		LOGGER.debug("save()");
		Activities activities = activitiesModel.getActivities();
		
		//判断是新增还是修改
		Integer id = activities.getId();
		if(null == id || 0 == id)
		{
			activitiesService.insert(activities);
		}else
		{
			activitiesService.update(activities);
		}
		return Action.EDITOR_SUCCESS;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return activitiesModel;
	}

	public ActivitiesService getActivitiesService() {
		return activitiesService;
	}

	public void setActivitiesService(ActivitiesService activitiesService) {
		this.activitiesService = activitiesService;
	}

	public ActivitiesModel getActivitiesModel() {
		return activitiesModel;
	}

	public void setActivitiesModel(ActivitiesModel activitiesModel) {
		this.activitiesModel = activitiesModel;
	}

}
