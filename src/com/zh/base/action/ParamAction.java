package com.zh.base.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.ParamModel;
import com.zh.base.model.bean.Param;
import com.zh.base.service.ParamService;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;

public class ParamAction extends BaseAction {
	
	@Autowired
	private ParamService paramService;

	private ParamModel paramModel = new ParamModel();
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return paramModel;
	}
	
	public String execute()
	{
		Param param = paramService.query();
		paramModel.setParam(param);
		return Action.SUCCESS;
	}
	
	public String save()
	{
		
		return Action.EDITOR;
	}

	public ParamService getParamService() {
		return paramService;
	}

	public void setParamService(ParamService paramService) {
		this.paramService = paramService;
	}

	public ParamModel getParamModel() {
		return paramModel;
	}

	public void setParamModel(ParamModel paramModel) {
		this.paramModel = paramModel;
	}

}
