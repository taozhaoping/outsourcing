package com.zh.web.model;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.Certificates;
import com.zh.web.model.bean.Express;
import com.zh.web.model.bean.FileInfo;
import com.zh.web.model.bean.Flight;
import com.zh.web.model.bean.TechnologicalProcess;

public class RecruitmentModel extends BaseModel {

	/**
	 * 基础信息
	 */
	private TechnologicalProcess technologicalProcess = new TechnologicalProcess();
	
	/**
	 * 证件信息
	 */
	private Certificates certificates = new Certificates();
	
	private List<Certificates> certificatesList = new ArrayList<Certificates>();
	
	/**
	 * 页面js获取集合对象
	 */
	private String certificatesListJson;
	
	/**
	 * 页面js获取的file对象集合
	 */
	private String fileInfoListJson;
	
	/**
	 * 快递信息
	 */
	private Express express = new Express();
	
	/**
	 * 航班信息
	 */
	private Flight flight = new Flight();
	
	/**
	 * 文件信息
	 */
	private FileInfo fileInfo = new FileInfo();
	
	private List<FileInfo> fileInfoList = new ArrayList<FileInfo>();
	
	/**
	 * 表单的编号 
	 */
	private String formId;
	
	/**
	 * 审批者
	 */
	private String assign;
	
	/***
	 * 批准、拒绝  <0：拒绝 1：批准>
	 */
	private String assignFlag;
	
	/***
	 * 
	 */
	private List<TechnologicalProcess> technologicalProcessList = new ArrayList<TechnologicalProcess>();
	
	/***
	 * 流程实例id
	 */
	private String processInstanceId;
	
	/***
	 * 是否有批准权限 0 没有 1 有
	 */
	private String hasApprove;
	
	/***
	 * 是否具有发起流程的权限 0 没有 1 有
	 */
	private String hasSubmitAuth;
	
	/**
	 * 当前工作流的状态
	 */
	private String state;
	
	/**
	 * 审核结果
	 */
	private List<String> auditRet;
	
	/**
	 * 文件上传参数
	 */
	private File files = null;
	private String title = null;
	private String filesFileName = null;
	private String filesContentType = null;
	private String fileNumber;
	
	public TechnologicalProcess getTechnologicalProcess() {
		return technologicalProcess;
	}

	public void setTechnologicalProcess(TechnologicalProcess technologicalProcess) {
		this.technologicalProcess = technologicalProcess;
	}

	public String getFormId() {
		return formId;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	public String getAssign() {
		return assign;
	}

	public void setAssign(String assign) {
		this.assign = assign;
	}

	public String getAssignFlag() {
		return assignFlag;
	}

	public void setAssignFlag(String assignFlag) {
		this.assignFlag = assignFlag;
	}

	public List<TechnologicalProcess> getTechnologicalProcessList() {
		return technologicalProcessList;
	}

	public void setTechnologicalProcessList(
			List<TechnologicalProcess> technologicalProcessList) {
		this.technologicalProcessList = technologicalProcessList;
	}

	public Certificates getCertificates() {
		return certificates;
	}

	public void setCertificates(Certificates certificates) {
		this.certificates = certificates;
	}

	public Flight getFlight() {
		return flight;
	}

	public void setFlight(Flight flight) {
		this.flight = flight;
	}

	public FileInfo getFileInfo() {
		return fileInfo;
	}

	public void setFileInfo(FileInfo fileInfo) {
		this.fileInfo = fileInfo;
	}

	public List<Certificates> getCertificatesList() {
		return certificatesList;
	}

	public void setCertificatesList(List<Certificates> certificatesList) {
		this.certificatesList = certificatesList;
	}

	public List<FileInfo> getFileInfoList() {
		return fileInfoList;
	}

	public void setFileInfoList(List<FileInfo> fileInfoList) {
		this.fileInfoList = fileInfoList;
	}

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	public String getHasApprove() {
		return hasApprove;
	}

	public void setHasApprove(String hasApprove) {
		this.hasApprove = hasApprove;
	}

	public String getHasSubmitAuth() {
		return hasSubmitAuth;
	}

	public void setHasSubmitAuth(String hasSubmitAuth) {
		this.hasSubmitAuth = hasSubmitAuth;
	}

	public File getFiles() {
		return files;
	}

	public void setFiles(File files) {
		this.files = files;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFilesFileName() {
		return filesFileName;
	}

	public void setFilesFileName(String filesFileName) {
		this.filesFileName = filesFileName;
	}

	public String getFilesContentType() {
		return filesContentType;
	}

	public void setFilesContentType(String filesContentType) {
		this.filesContentType = filesContentType;
	}

	public String getFileNumber() {
		return fileNumber;
	}

	public void setFileNumber(String fileNumber) {
		this.fileNumber = fileNumber;
	}

	public String getCertificatesListJson() {
		return certificatesListJson;
	}

	public void setCertificatesListJson(String certificatesListJson) {
		this.certificatesListJson = certificatesListJson;
	}

	public String getFileInfoListJson() {
		return fileInfoListJson;
	}

	public void setFileInfoListJson(String fileInfoListJson) {
		this.fileInfoListJson = fileInfoListJson;
	}

	public Express getExpress() {
		return express;
	}

	public void setExpress(Express express) {
		this.express = express;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public List<String> getAuditRet() {
		return auditRet;
	}

	public void setAuditRet(List<String> auditRet) {
		this.auditRet = auditRet;
	}
	
}
