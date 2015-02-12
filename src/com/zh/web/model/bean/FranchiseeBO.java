package com.zh.web.model.bean;

import java.sql.Date;

import com.zh.core.model.IDataObject;

/**
 * 加盟商 business object
 * 
 * @author 21829
 * 
 */
public class FranchiseeBO extends IDataObject{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Franchisee franchisee = new Franchisee();
	
	private Change change = new Change();

	private Integer fcId;

	private String fcCreatedate;

	private String fcUpdatedate;

	private String fcName;

	private String fcDescr;

	private String fcAddress;

	private String fcStatus;

	private String fcContractType;

	private String fcContractStartDate;

	private String fcContractEndDate;

	private Integer fcCreateUserId;
	
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
	private String ownerName; //创建者名称
	
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


	public Integer getFcId() {
		return fcId;
	}

	public void setFcId(Integer fcId) {
		this.fcId = fcId;
		this.franchisee.setId(fcId);
	}

	public String getFcCreatedate() {
		return fcCreatedate;
	}

	public void setFcCreatedate(String fcCreatedate) {
		this.fcCreatedate = fcCreatedate;
		this.franchisee.setCreatedate(fcCreatedate);
	}

	public String getFcUpdatedate() {
		return fcUpdatedate;
	}

	public void setFcUpdatedate(String fcUpdatedate) {
		this.fcUpdatedate = fcUpdatedate;
		this.franchisee.setUpdatedate(fcUpdatedate);
	}

	public String getFcName() {
		return fcName;
	}

	public void setFcName(String fcName) {
		this.fcName = fcName;
		this.franchisee.setName(fcName);
	}

	public String getFcDescr() {
		return fcDescr;
	}

	public void setFcDescr(String fcDescr) {
		this.fcDescr = fcDescr;
		this.franchisee.setDescr(fcDescr);
	}

	public String getFcAddress() {
		return fcAddress;
	}

	public void setFcAddress(String fcAddress) {
		this.fcAddress = fcAddress;
		this.franchisee.setAddress(fcAddress);
	}

	public String getFcStatus() {
		return fcStatus;
	}

	public void setFcStatus(String fcStatus) {
		this.fcStatus = fcStatus;
		this.franchisee.setStatus(fcStatus);
	}

	public String getFcContractType() {
		return fcContractType;
	}

	public void setFcContractType(String fcContractType) {
		this.fcContractType = fcContractType;
		this.franchisee.setContractType(fcContractType);
	}

	public String getFcContractStartDate() {
		return fcContractStartDate;
	}

	public void setFcContractStartDate(String fcContractStartDate) {
		this.fcContractStartDate = fcContractStartDate;
		this.franchisee.setContractStartDate(fcContractStartDate);
	}

	public String getFcContractEndDate() {
		return fcContractEndDate;
	}

	public void setFcContractEndDate(String fcContractEndDate) {
		this.fcContractEndDate = fcContractEndDate;
		this.franchisee.setContractEndDate(fcContractEndDate);
	}

	public Integer getFcCreateUserId() {
		return fcCreateUserId;
	}

	public void setFcCreateUserId(Integer fcCreateUserId) {
		this.fcCreateUserId = fcCreateUserId;
		this.franchisee.setCreateUserId(fcCreateUserId);
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
		this.change.setId(id);
	}

	public String getChangeNumber() {
		return changeNumber;
	}

	public void setChangeNumber(String changeNumber) {
		this.changeNumber = changeNumber;
		this.change.setChangeNumber(changeNumber);
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
		this.change.setCategory(category);
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
		this.change.setDescription(description);
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
		this.change.setStatus(status);
	}

	public Integer getOwner() {
		return owner;
	}

	public void setOwner(Integer owner) {
		this.owner = owner;
		this.change.setOwner(owner);
	}

	public String getOwnerName() {
		return ownerName;
	}

	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
		this.change.setOwnerName(ownerName);
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
		this.change.setCreateDate(createDate);
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
		this.change.setUpdateDate(updateDate);
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
		this.change.setDeleteFlag(deleteFlag);
	}

	public String getWorkflowId() {
		return workflowId;
	}

	public void setWorkflowId(String workflowId) {
		this.workflowId = workflowId;
		this.change.setWorkflowId(workflowId);
	}

	public Integer getApprover() {
		return approver;
	}

	public void setApprover(Integer approver) {
		this.approver = approver;
		this.change.setApprover(approver);
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
		this.change.setTaskId(taskId);
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
		this.change.setUrl(url);
	}

	public String getRes1() {
		return res1;
	}

	public void setRes1(String res1) {
		this.res1 = res1;
		this.change.setRes1(res1);
	}

	public String getRes2() {
		return res2;
	}

	public void setRes2(String res2) {
		this.res2 = res2;
		this.change.setRes2(res2);
	}

	public String getRes3() {
		return res3;
	}

	public void setRes3(String res3) {
		this.res3 = res3;
		this.change.setRes3(res3);
	}

	public String getRes4() {
		return res4;
	}

	public void setRes4(String res4) {
		this.res4 = res4;
		this.change.setRes4(res4);
	}

	public String getRes5() {
		return res5;
	}

	public void setRes5(String res5) {
		this.res5 = res5;
		this.change.setRes5(res5);
	}

	public String getRes6() {
		return res6;
	}

	public void setRes6(String res6) {
		this.res6 = res6;
		this.change.setRes6(res6);
	}

	public Franchisee getFranchisee() {
		return franchisee;
	}

	public void setFranchisee(Franchisee franchisee) {
		this.franchisee = franchisee;
		
		this.fcId = franchisee.getId();
		this.fcCreatedate = franchisee.getCreatedate();
		this.fcUpdatedate = franchisee.getUpdatedate();
		this.fcName = franchisee.getName();
		this.fcDescr = franchisee.getDescr();
		this.fcAddress = franchisee.getAddress();
		this.fcStatus = franchisee.getStatus();
		this.fcContractType = franchisee.getContractType();
		this.fcContractStartDate = franchisee.getContractStartDate();
		this.fcContractEndDate = franchisee.getContractEndDate();
		this.fcCreateUserId = franchisee.getCreateUserId();
		
	}

	public Change getChange() {
		return change;
	}

	public void setChange(Change change) {
		this.change = change;
		
		this.id = change.getId();
		this.changeNumber = change.getChangeNumber();
		this.category = change.getCategory();
		this.description = change.getDescription();
		this.status = change.getStatus();
		this.owner = change.getOwner();
		this.ownerName = change.getOwnerName();
		this.createDate = change.getCreateDate();
		this.updateDate = change.getUpdateDate();
		this.deleteFlag = change.getDeleteFlag();
		this.workflowId = change.getWorkflowId();
		this.approver = change.getApprover();
		this.taskId = change.getTaskId();
		this.url = change.getUrl();
		this.res1 = change.getRes1();
		this.res2 = change.getRes2();
		this.res3 = change.getRes3();
		this.res4 = change.getRes4();
		this.res5 = change.getRes5();
		this.res6 = change.getRes6();
	}
	
}