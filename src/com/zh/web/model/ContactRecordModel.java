package com.zh.web.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.ContactRecord;
import com.zh.web.model.bean.EntryProcess;
import com.zh.web.model.bean.TechnologicalProcess;

/**
 * 通讯记录
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public class ContactRecordModel extends BaseModel {

	private ContactRecord contactRecord = new ContactRecord();
	
	private List<ContactRecord> ContactRecordList = new ArrayList<ContactRecord>();
	
	
	/**
	 * 基础信息
	 */
	private TechnologicalProcess technologicalProcess = new TechnologicalProcess();
	
	private List<TechnologicalProcess> technologicalProcessList = new ArrayList<TechnologicalProcess>();
	
	private String FormId;
	
	public String getFormId() {
		return FormId;
	}

	public void setFormId(String formId) {
		FormId = formId;
	}

	public List<TechnologicalProcess> getTechnologicalProcessList() {
		return technologicalProcessList;
	}

	public void setTechnologicalProcessList(
			List<TechnologicalProcess> technologicalProcessList) {
		this.technologicalProcessList = technologicalProcessList;
	}

	public TechnologicalProcess getTechnologicalProcess() {
		return technologicalProcess;
	}

	public void setTechnologicalProcess(TechnologicalProcess technologicalProcess) {
		this.technologicalProcess = technologicalProcess;
	}

	public ContactRecord getContactRecord() {
		return contactRecord;
	}

	public void setContactRecord(ContactRecord contactRecord) {
		this.contactRecord = contactRecord;
	}

	public List<ContactRecord> getContactRecordList() {
		return ContactRecordList;
	}

	public void setContactRecordList(List<ContactRecord> contactRecordList) {
		ContactRecordList = contactRecordList;
	}
	
	
	
}
