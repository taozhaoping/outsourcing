package com.zh.web.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.ContactRecord;
import com.zh.web.model.bean.EntryProcess;
import com.zh.web.model.bean.TechnologicalProcess;

public class ContactRecordModel extends BaseModel {

	private ContactRecord contactRecord = new ContactRecord();
	
	private List<ContactRecord> ContactRecordList = new ArrayList<ContactRecord>();
	
	private TechnologicalProcess technologicalProcess = new TechnologicalProcess();
	
	/**
	 * 基础信息
	 */
	private EntryProcess entryProcess = new EntryProcess();
	
	private List<EntryProcess> entryProcessList = new ArrayList<EntryProcess>();

	public List<EntryProcess> getEntryProcessList() {
		return entryProcessList;
	}

	public void setEntryProcessList(List<EntryProcess> entryProcessList) {
		this.entryProcessList = entryProcessList;
	}

	public EntryProcess getEntryProcess() {
		return entryProcess;
	}

	public void setEntryProcess(EntryProcess entryProcess) {
		this.entryProcess = entryProcess;
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
