package com.zh.web.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.ParamModel;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.web.model.RecruitmentModel;
import com.zh.web.model.bean.TechnologicalProcess;
import com.zh.web.service.TechnologicalProcessService;

public class RecruitmentAction extends BaseAction {
	
	/**
	 * 招聘工作流
	 */
	private static final long serialVersionUID = 1L;

	private RecruitmentModel recruitmentModel = new RecruitmentModel();
	
	private static Logger LOGGER = LoggerFactory.getLogger(RecruitmentAction.class); 
	
	@Autowired
	private TechnologicalProcessService technologicalProcessService;
	
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
		TechnologicalProcess technologicalProcess = this.recruitmentModel.getTechnologicalProcess();
		Integer id = technologicalProcess.getId();
		if(null != id && id>0)
		{
			technologicalProcessService.update(technologicalProcess);
		}else
		{
			technologicalProcessService.insert(technologicalProcess);
		}
		return Action.EDITOR;
	}

	public RecruitmentModel getRecruitmentModel() {
		return recruitmentModel;
	}

	public void setRecruitmentModel(RecruitmentModel recruitmentModel) {
		this.recruitmentModel = recruitmentModel;
	}

	public TechnologicalProcessService getTechnologicalProcessService() {
		return technologicalProcessService;
	}

	public void setTechnologicalProcessService(
			TechnologicalProcessService technologicalProcessService) {
		this.technologicalProcessService = technologicalProcessService;
	}

}
