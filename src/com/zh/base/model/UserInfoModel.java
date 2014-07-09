package com.zh.base.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zh.core.base.model.BaseModel;

public class UserInfoModel extends BaseModel {

	private UserInfo userInfo = new UserInfo();
	
	private List<UserInfo> userList = new ArrayList<UserInfo>();
	
	private String newPassWord;
	
	
	private String reultObject;
	
	private String view;
	
	//删除条件
	private String jsonIDString;
	
	private Map<String, Object> dataMap = new HashMap<String, Object>();
	
	public final static String className="userInfo";
	
	private String oldUserName;
	
	private String userName;

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public String getNewPassWord() {
		return newPassWord;
	}

	public void setNewPassWord(String newPassWord) {
		this.newPassWord = newPassWord;
	}

	public String getReultObject() {
		return reultObject;
	}

	public void setReultObject(String reultObject) {
		this.reultObject = reultObject;
	}

	public String getClassName() {
		return className;
	}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public List<UserInfo> getUserList() {
		return userList;
	}

	public void setUserList(List<UserInfo> userList) {
		this.userList = userList;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public String getOldUserName() {
		return oldUserName;
	}

	public void setOldUserName(String oldUserName) {
		this.oldUserName = oldUserName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getJsonIDString() {
		return jsonIDString;
	}

	public void setJsonIDString(String jsonIDString) {
		this.jsonIDString = jsonIDString;
	}	
	
}
