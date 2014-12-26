package com.zh.web.action;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;
import com.zh.web.model.ActivitiesModel;
import com.zh.web.model.bean.Activities;
import com.zh.web.model.bean.ActivitiesUser;
import com.zh.web.model.bean.TrainingOfPersonnel;
import com.zh.web.service.ActivitiesService;
import com.zh.web.service.ActivitiesUserService;

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

	@Autowired
	private ActivitiesUserService activitiesUserService;

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

	public String editor() {
		LOGGER.debug("editor()");
		Integer id = this.activitiesModel.getId();
		if (null != id && !"".equals(id)) {
			Activities activities = activitiesModel.getActivities();
			activities.setId(id);
			Activities activitiesReult = activitiesService.query(activities);
			this.activitiesModel.setActivities(activitiesReult);

			// 获取报名学员信息
			ActivitiesUser activitiesUser = this.activitiesModel
					.getActivitiesUser();
			activitiesUser.setActivitiesId(id);
			Pager pager = this.activitiesModel.getPageInfo();

			Integer count = activitiesUserService.count(activitiesUser);

			pager.setTotalRow(count);
			List<ActivitiesUser> activitiesUserList = activitiesUserService
					.queryList(activitiesUser, pager);
			this.activitiesModel.setActivitiesUserList(activitiesUserList);
		}
		return Action.EDITOR;
	}
	
	public String saveActivitiesUser() {
		ActivitiesUser activitiesUser = this.activitiesModel
				.getActivitiesUser();
		Integer activitiesId = activitiesUser.getActivitiesId();
		Integer technologicalProcessId = activitiesUser
				.getTechnologicalProcessId();
		if (activitiesId == null || activitiesId == 0) {
			throw new ProjectException("活动编号不允许为null");
		}
		if (technologicalProcessId == null || technologicalProcessId == 0) {
			throw new ProjectException("学员编号不允许为null");
		}
		activitiesUserService.insert(activitiesUser);
		return "save";
	}

	public String save() {
		LOGGER.debug("save()");
		Activities activities = activitiesModel.getActivities();
		// 判断当前是设置成启动状态还是停用状态
		String view = this.activitiesModel.getView();
		if (null != view && "enabled".equals(view)) {

			String enabled = this.activitiesModel.getEnabled();
			Integer id = this.activitiesModel.getId();
			if ("0".equals(enabled)) {
				activities.setEnabled("1");
			} else {
				activities.setEnabled("0");
			}
			activities.setId(id);
		}

		// 判断是新增还是修改
		Integer id = activities.getId();
		if (null == id || 0 == id) {
			activitiesService.insert(activities);
		} else {
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
