package com.zh.base.model;

import java.util.ArrayList;
import java.util.List;

import com.zh.base.model.bean.User;
import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.EntryProcess;
import com.zh.web.model.bean.TechnologicalProcess;

public class InterfaceModel extends BaseModel {

	private User user = new User();
	
	private List<User> userList = new ArrayList<User>();
	
	private EntryProcess entryProcess = new EntryProcess();

	private List<EntryProcess> entryProcessList = new ArrayList<EntryProcess>();

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public EntryProcess getEntryProcess() {
		return entryProcess;
	}

	public void setEntryProcess(EntryProcess entryProcess) {
		this.entryProcess = entryProcess;
	}

	public List<EntryProcess> getEntryProcessList() {
		return entryProcessList;
	}

	public void setEntryProcessList(List<EntryProcess> entryProcessList) {
		this.entryProcessList = entryProcessList;
	}

}
