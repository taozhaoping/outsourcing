package com.zh.web.action;

import java.util.List;

import org.apache.avalon.framework.parameters.ParameterException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.bean.User;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;
import com.zh.web.model.ContactRecordModel;
import com.zh.web.model.bean.ContactRecord;
import com.zh.web.model.bean.TechnologicalProcess;
import com.zh.web.service.ContactRecordService;
import com.zh.web.service.TechnologicalProcessService;

public class ContactRecordAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -930810974970472710L;

	private ContactRecordModel contactRecordModel = new ContactRecordModel();

	private static Logger LOGGER = LoggerFactory
			.getLogger(ContactRecordAction.class);

	@Autowired
	private TechnologicalProcessService technologicalProcessService;

	@Autowired
	private ContactRecordService contactRecordService;

	public String execute() {

		/* 获取基本信息 */
		TechnologicalProcess technologicalProcess = this.contactRecordModel.getTechnologicalProcess();

		/* 获取当前登录用户 */
		User user = queryUser();
		technologicalProcess.setWorkuserid(user.getId());
		Pager pager = this.contactRecordModel.getPageInfo();
		Integer count = technologicalProcessService.count(technologicalProcess);
		pager.setTotalRow(count);
		List<TechnologicalProcess> technologicalProcessList = technologicalProcessService.queryList(
				technologicalProcess, pager);
		this.contactRecordModel.setTechnologicalProcessList(technologicalProcessList);

		return Action.SUCCESS;
	}

	public String editor() {
		LOGGER.debug("editor()");

		String businessKey = this.contactRecordModel.getFormId();
		TechnologicalProcess technologicalProcess = new TechnologicalProcess();
		technologicalProcess.setId(Integer.parseInt(businessKey));
		// technologicalProcess.setWorkuserid(queryUserId());

		// 获取基本信息
		TechnologicalProcess technological = technologicalProcessService.query(technologicalProcess);
		contactRecordModel.setTechnologicalProcess(technological);

		/* 获取联系记录 */
		ContactRecord contactRecord = new ContactRecord();
		contactRecord.setTechnologicalprocessid(Integer.parseInt(businessKey));

		Pager pager = this.contactRecordModel.getPageInfo();
		Integer count = contactRecordService.count(contactRecord);
		pager.setTotalRow(count);

		List<ContactRecord> contactRecordList = contactRecordService.queryList(
				contactRecord, pager);
		this.contactRecordModel.setContactRecordList(contactRecordList);
		return Action.EDITOR;
	}

	public String save() {
		LOGGER.debug("save()");
		TechnologicalProcess technologicalProcess = this.contactRecordModel.getTechnologicalProcess();
		Integer id = technologicalProcess.getId();

		if (null != id && id > 0) {
			technologicalProcessService.update(technologicalProcess);
			LOGGER.debug("update()...");
		} else {
			// 设置当前用户为流程发起人
			Integer userID = queryUserId();
			technologicalProcess.setWorkuserid(userID);
			technologicalProcessService.insert(technologicalProcess);
			LOGGER.debug("insert()...");
		}

		this.contactRecordModel.setFormId(technologicalProcess.getId().toString());
		return Action.EDITOR_SUCCESS;
	}

	/**
	 * 保存联系记录
	 * 
	 * @return
	 * @throws ParameterException
	 */
	public String saveContactRecord() throws ParameterException {
		ContactRecord contactRecord = this.contactRecordModel
				.getContactRecord();
		String fromID = this.contactRecordModel.getFormId();
		if (null == fromID || "".equals(fromID)) {
			throw new ProjectException("编号不允许为null");
		}
		contactRecord.setTechnologicalprocessid(Integer.valueOf(fromID));
		contactRecordService.insert(contactRecord);
		return "save";
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return contactRecordModel;
	}

	public ContactRecordModel getContactRecordModel() {
		return contactRecordModel;
	}

	public void setContactRecordModel(ContactRecordModel contactRecordModel) {
		this.contactRecordModel = contactRecordModel;
	}

	public TechnologicalProcessService getTechnologicalProcessService() {
		return technologicalProcessService;
	}

	public void setTechnologicalProcessService(
			TechnologicalProcessService technologicalProcessService) {
		this.technologicalProcessService = technologicalProcessService;
	}

	public ContactRecordService getContactRecordService() {
		return contactRecordService;
	}

	public void setContactRecordService(ContactRecordService contactRecordService) {
		this.contactRecordService = contactRecordService;
	}
	
	

}
