package com.zh.web.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.zh.base.model.ParamModel;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.web.model.RecruitmentModel;

public class RecruitmentAction extends BaseAction {
	
	/**
	 * 招聘工作流
	 */
	private static final long serialVersionUID = 1L;

	private RecruitmentModel recruitmentModel = new RecruitmentModel();
	
	private static Logger LOGGER = LoggerFactory.getLogger(RecruitmentAction.class); 
	
	
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return recruitmentModel;
	}
	
	public String execute() {
		LOGGER.debug("execute()");
		//TODO
		return Action.SUCCESS;
	}
	
	public String save(){
		LOGGER.debug("save()");
		//TODO
		return Action.EDITOR;
	}

	public RecruitmentModel getRecruitmentModel() {
		return recruitmentModel;
	}

	public void setRecruitmentModel(RecruitmentModel recruitmentModel) {
		this.recruitmentModel = recruitmentModel;
	}

}
