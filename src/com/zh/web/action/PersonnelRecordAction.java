package com.zh.web.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.web.model.PersonnelRecordModel;
import com.zh.web.service.ContactRecordService;
import com.zh.web.service.EntryProcessService;

public class PersonnelRecordAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5036914294891638980L;

	private PersonnelRecordModel personnelRecordModel = new PersonnelRecordModel();

	private static Logger LOGGER = LoggerFactory
			.getLogger(PersonnelRecordAction.class);

	@Autowired
	private EntryProcessService entryProcessService;

	@Autowired
	private ContactRecordService contactRecordService;

	public String execute() {

		
		return Action.SUCCESS;
	}

	public String editor() {
		LOGGER.debug("editor()");

		
		return Action.EDITOR;
	}

	public String save() {
		LOGGER.debug("save()");
		
		return Action.EDITOR_SUCCESS;
	}
	
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return personnelRecordModel;
	}

}
