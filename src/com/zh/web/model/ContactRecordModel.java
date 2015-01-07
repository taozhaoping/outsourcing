package com.zh.web.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.ContactRecord;
import com.zh.web.model.bean.ContactRecordVW;
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
	TechnologicalProcess technologicalProcess = new TechnologicalProcess();
	
	private ContactRecordVW contactRecordVW = new ContactRecordVW();
	
	private List<ContactRecordVW> contactRecordVWList = new ArrayList<ContactRecordVW>();
	
	private String FormId;

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

	public ContactRecordVW getContactRecordVW() {
		return contactRecordVW;
	}

	public void setContactRecordVW(ContactRecordVW contactRecordVW) {
		this.contactRecordVW = contactRecordVW;
	}

	public List<ContactRecordVW> getContactRecordVWList() {
		return contactRecordVWList;
	}

	public void setContactRecordVWList(List<ContactRecordVW> contactRecordVWList) {
		this.contactRecordVWList = contactRecordVWList;
	}

	public String getFormId() {
		return FormId;
	}

	public void setFormId(String formId) {
		FormId = formId;
	}

	public TechnologicalProcess getTechnologicalProcess() {
		return technologicalProcess;
	}

	public void setTechnologicalProcess(TechnologicalProcess technologicalProcess) {
		this.technologicalProcess = technologicalProcess;
	}
		
}
