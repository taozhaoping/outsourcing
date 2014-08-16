package com.zh.web.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.ParamModel;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.web.model.TechnologicalProcessModel;
import com.zh.web.service.TechnologicalProcessService;

public class InductionAction extends BaseAction {
	
	/**
	 * 入职工作流
	 */
	private static final long serialVersionUID = 1L;

	private TechnologicalProcessModel technologicalProcessModel = new TechnologicalProcessModel();
	
	private static Logger LOGGER = LoggerFactory.getLogger(InductionAction.class); 
	
	@Autowired
	private TechnologicalProcessService technologicalProcessService;
	
	
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return technologicalProcessModel;
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

	public TechnologicalProcessModel getTechnologicalProcessModel() {
		return technologicalProcessModel;
	}

	public void setTechnologicalProcessModel(
			TechnologicalProcessModel technologicalProcessModel) {
		this.technologicalProcessModel = technologicalProcessModel;
	}

	public TechnologicalProcessService getTechnologicalProcessService() {
		return technologicalProcessService;
	}

	public void setTechnologicalProcessService(
			TechnologicalProcessService technologicalProcessService) {
		this.technologicalProcessService = technologicalProcessService;
	}
	
}
