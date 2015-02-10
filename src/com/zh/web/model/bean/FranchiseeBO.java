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

	private Integer fId;

	private String fCreatedate;

	private String fUpdatedate;

	private String fName;

	private String fDescr;

	private String fAddress;

	private String fStatus;

	private String fContractType;

	private String fContractStartDate;

	private String fContractEndDate;

	private Integer fCreateUserId;
	
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

	public Integer getfId() {
		return fId;
	}

	public void setfId(Integer fId) {
		this.fId = fId;
		this.franchisee.setId(fId);
	}

	public String getfCreatedate() {
		return fCreatedate;
	}

	public void setfCreatedate(String fCreatedate) {
		this.fCreatedate = fCreatedate;
		this.franchisee.setCreatedate(fCreatedate);
	}

	public String getfUpdatedate() {
		return fUpdatedate;
	}

	public void setfUpdatedate(String fUpdatedate) {
		this.fUpdatedate = fUpdatedate;
		this.franchisee.setUpdatedate(fUpdatedate);
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
		this.franchisee.setName(fName);
	}

	public String getfDescr() {
		return fDescr;
	}

	public void setfDescr(String fDescr) {
		this.fDescr = fDescr;
		this.franchisee.setDescr(fDescr);
	}

	public String getfAddress() {
		return fAddress;
	}

	public void setfAddress(String fAddress) {
		this.fAddress = fAddress;
		this.franchisee.setAddress(fAddress);
	}

	public String getfStatus() {
		return fStatus;
	}

	public void setfStatus(String fStatus) {
		this.fStatus = fStatus;
		this.franchisee.setStatus(fStatus);
	}

	public String getfContractType() {
		return fContractType;
	}

	public void setfContractType(String fContractType) {
		this.fContractType = fContractType;
		this.franchisee.setContractType(fContractType);
	}

	public String getfContractStartDate() {
		return fContractStartDate;
	}

	public void setfContractStartDate(String fContractStartDate) {
		this.fContractStartDate = fContractStartDate;
		this.franchisee.setContractStartDate(fContractStartDate);
	}

	public String getfContractEndDate() {
		return fContractEndDate;
	}

	public void setfContractEndDate(String fContractEndDate) {
		this.fContractEndDate = fContractEndDate;
		this.franchisee.setContractEndDate(fContractEndDate);
	}

	public Integer getfCreateUserId() {
		return fCreateUserId;
	}

	public void setfCreateUserId(Integer fCreateUserId) {
		this.fCreateUserId = fCreateUserId;
		this.franchisee.setCreateUserId(fCreateUserId);
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
		
		this.fId = franchisee.getId();
		this.fCreatedate = franchisee.getCreatedate();
		this.fUpdatedate = franchisee.getUpdatedate();
		this.fName = franchisee.getName();
		this.fDescr = franchisee.getDescr();
		this.fAddress = franchisee.getAddress();
		this.fStatus = franchisee.getStatus();
		this.fContractType = franchisee.getContractType();
		this.fContractStartDate = franchisee.getContractStartDate();
		this.fContractEndDate = franchisee.getContractEndDate();
		this.fCreateUserId = franchisee.getCreateUserId();
		
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