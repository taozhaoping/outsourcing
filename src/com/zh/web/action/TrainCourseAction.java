package com.zh.web.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.web.model.TrainCourseModel;

/**
 * 培训管理
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public class TrainCourseAction extends BaseAction {

	private static Logger LOGGER = LoggerFactory.getLogger(TrainCourseAction.class); 
	
	private TrainCourseModel trainCourseModel = new TrainCourseModel();
	public String execute()
	{
		
		return Action.SUCCESS;
	}
	
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return null;
	}

}
