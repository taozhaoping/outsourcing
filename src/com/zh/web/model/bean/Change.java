package com.zh.web.model.bean;

import java.sql.Date;

import com.zh.core.model.IDataObject;

public class Change extends IDataObject {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5872623337840546445L;
	
	/**
	 * 主键id
	 */
	private Integer id;//--ID
	
	/**
	 * 变更编号
	 */
	private String changeNumber; // --变更编号
	
	/**
	 * 类别
	 */
	private Integer category;	//,--类别
	
	/**
	 * 描述
	 */
	private String description; //VARCHAR2(4000), --描述
	
	/**
	 * 状态
	 */
	private String status;// VARCHAR2(50), --状态
	
	/**
	 * 创建者
	 */
	private Integer owner;// NUMBER(10), --创建者
	
	
	/**
	 * 创建者名称
	 */
	private String ownerName; // 创建者名称
	
	/**
	 * 创建时间
	 */
	private Date createDate;// DATE, --创建时间
	
	/**
	 * 修改时间
	 */
	private Date updateDate; //DATE, --修改时间
	
	/**
	 * 删除标志
	 */
	private Integer deleteFlag;// NUMBER, --删除标志
	
	/**
	 * 工作流id
	 */
	private String workflowId;// VARCHAR2(50), --工作流id
	
	/**
	 * 当前审批人
	 */
	private Integer approver;// NUMBER,--当前审批人
	
	/**
	 * 当前任务id
	 */
	private String taskId;	 //VARCHAR2(50), --当前任务id
	
	/**
	 * 表单的url
	 */
	private String url;	 //VARCHAR2(150),--表单的url
	
	/**
	 * 扩展字段1
	 */
	private String res1;   //VARCHAR2(150),--扩展字段1
	
	/**
	 * 扩展字段2
	 */
	private String res2;   //VARCHAR2(150),--扩展字段2
	
	/**
	 * 扩展字段3
	 */
	private String res3;   //VARCHAR2(150),--扩展字段3
	
	/**
	 * 扩展字段4
	 */
	private String res4;   //VARCHAR2(150),--扩展字段4
	
	/**
	 * 扩展字段5
	 */
	private String res5;   //VARCHAR2(150),--扩展字段5
	
	/**
	 * 扩展字段6
	 */
	private String res6;   //VARCHAR2(150)--扩展字段6

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getChangeNumber() {
		return changeNumber;
	}

	public void setChangeNumber(String changeNumber) {
		this.changeNumber = changeNumber;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getOwner() {
		return owner;
	}

	public void setOwner(Integer owner) {
		this.owner = owner;
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getWorkflowId() {
		return workflowId;
	}

	public void setWorkflowId(String workflowId) {
		this.workflowId = workflowId;
	}

	public Integer getApprover() {
		return approver;
	}

	public void setApprover(Integer approver) {
		this.approver = approver;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getRes1() {
		return res1;
	}

	public void setRes1(String res1) {
		this.res1 = res1;
	}

	public String getRes2() {
		return res2;
	}

	public void setRes2(String res2) {
		this.res2 = res2;
	}

	public String getRes3() {
		return res3;
	}

	public void setRes3(String res3) {
		this.res3 = res3;
	}

	public String getRes4() {
		return res4;
	}

	public void setRes4(String res4) {
		this.res4 = res4;
	}

	public String getRes5() {
		return res5;
	}

	public void setRes5(String res5) {
		this.res5 = res5;
	}

	public String getRes6() {
		return res6;
	}

	public void setRes6(String res6) {
		this.res6 = res6;
	}
	
}
