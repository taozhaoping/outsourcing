package com.zh.web.model;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.TechnologicalProcess;

public class RecruitmentModel extends BaseModel {

	private TechnologicalProcess technologicalProcess = new TechnologicalProcess();
	
	/**
	 * 表单的编号 
	 */
	private String formId;
	
	/**
	 * 审批者
	 */
	private String assign;

	public TechnologicalProcess getTechnologicalProcess() {
		return technologicalProcess;
	}

	public void setTechnologicalProcess(TechnologicalProcess technologicalProcess) {
		this.technologicalProcess = technologicalProcess;
	}

	public String getFormId() {
		return formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	public String getAssign() {
		return assign;
	}

	public void setAssign(String assign) {
		this.assign = assign;
	}
	
}
