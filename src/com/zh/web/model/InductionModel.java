package com.zh.web.model;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.TechnologicalProcess;

public class InductionModel extends BaseModel {

	private TechnologicalProcess technologicalProcess = new TechnologicalProcess();

	public TechnologicalProcess getTechnologicalProcess() {
		return technologicalProcess;
	}

	public void setTechnologicalProcess(TechnologicalProcess technologicalProcess) {
		this.technologicalProcess = technologicalProcess;
	}
	
}
