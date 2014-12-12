package com.zh.web.action;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.model.Pager;
import com.zh.web.model.ContactRecordModel;
import com.zh.web.model.bean.EntryProcess;
import com.zh.web.service.EntryProcessService;

public class ContactRecordAction extends BaseAction {

	private ContactRecordModel contactRecordModel = new ContactRecordModel();
	
	private static Logger LOGGER = LoggerFactory
			.getLogger(ContactRecordAction.class);
	
	@Autowired
	private EntryProcessService entryProcessService;
	
	public String execute()
	{
		EntryProcess entryProcess = this.contactRecordModel
				.getEntryProcess();
		Pager pager = this.contactRecordModel.getPageInfo();
		Integer count = entryProcessService.count(entryProcess);
		pager.setTotalRow(count);
		List<EntryProcess> entryProcessList = entryProcessService
				.queryList(entryProcess, pager);
		this.contactRecordModel
				.setEntryProcessList(entryProcessList);
		return Action.SUCCESS;
	}
	
	public String editor(){
		LOGGER.debug("editor()");
		
		return Action.EDITOR;
	}
	
	public String save(){
		LOGGER.debug("save()");
		
		return Action.EDITOR_SUCCESS;
	}
	
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return contactRecordModel;
	}

}
