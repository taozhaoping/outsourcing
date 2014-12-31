package com.zh.web.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.PersonnelRecord;

public class PersonnelRecordModel extends BaseModel {

	private PersonnelRecord PersonnelRecord = new PersonnelRecord();
	
	private List<PersonnelRecord> PersonnelRecordList = new ArrayList<PersonnelRecord>();

	public PersonnelRecord getPersonnelRecord() {
		return PersonnelRecord;
	}

	public void setPersonnelRecord(PersonnelRecord personnelRecord) {
		PersonnelRecord = personnelRecord;
	}

	public List<PersonnelRecord> getPersonnelRecordList() {
		return PersonnelRecordList;
	}

	public void setPersonnelRecordList(List<PersonnelRecord> personnelRecordList) {
		PersonnelRecordList = personnelRecordList;
	}
}
