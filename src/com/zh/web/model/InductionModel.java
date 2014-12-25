package com.zh.web.model;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.Activities;
import com.zh.web.model.bean.ActivitiesUser;
import com.zh.web.model.bean.Certificates;
import com.zh.web.model.bean.EntryProcess;
import com.zh.web.model.bean.Express;
import com.zh.web.model.bean.FileInfo;
import com.zh.web.model.bean.Flight;
import com.zh.web.model.bean.Hotel;
import com.zh.web.model.bean.PhysicalExam;
import com.zh.web.model.bean.TrainCourse;
import com.zh.web.model.bean.TrainingOfPersonnel;

public class InductionModel extends BaseModel {

	/**
	 * 基础信息
	 */
	private EntryProcess entryProcess = new EntryProcess();
	
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
	 * 酒店信息
	 */
	private Hotel hotel = new Hotel();
	
	/**
	 * 体检信息
	 */
	private PhysicalExam physicalExam = new PhysicalExam();
	
	/**
	 * 活动人员信息
	 */
	private ActivitiesUser activitiesUser = new ActivitiesUser();
	
	/**
	 * 活动信息
	 */
	private List<Activities> activitiesList = new ArrayList<Activities>();
	
	/**
	 * 航班信息
	 */
	private Flight flight = new Flight();
	
	/**
	 * 文件信息
	 */
	private FileInfo fileInfo = new FileInfo();
	
	/**
	 * 培训人员信息
	 */
	private TrainingOfPersonnel trainingOfPersonnel = new TrainingOfPersonnel();
	
	/**
	 * 培训信息
	 */
	private List<TrainCourse> trainCourseList = new ArrayList<TrainCourse>();
	
	private List<FileInfo> fileInfoList = new ArrayList<FileInfo>();
	
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
	private List<EntryProcess> entryProcessList = new ArrayList<EntryProcess>();
	
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

	public TrainingOfPersonnel getTrainingOfPersonnel() {
		return trainingOfPersonnel;
	}

	public void setTrainingOfPersonnel(TrainingOfPersonnel trainingOfPersonnel) {
		this.trainingOfPersonnel = trainingOfPersonnel;
	}

	public List<TrainCourse> getTrainCourseList() {
		return trainCourseList;
	}

	public void setTrainCourseList(List<TrainCourse> trainCourseList) {
		this.trainCourseList = trainCourseList;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	public PhysicalExam getPhysicalExam() {
		return physicalExam;
	}

	public void setPhysicalExam(PhysicalExam physicalExam) {
		this.physicalExam = physicalExam;
	}

	public ActivitiesUser getActivitiesUser() {
		return activitiesUser;
	}

	public void setActivitiesUser(ActivitiesUser activitiesUser) {
		this.activitiesUser = activitiesUser;
	}

	public List<Activities> getActivitiesList() {
		return activitiesList;
	}

	public void setActivitiesList(List<Activities> activitiesList) {
		this.activitiesList = activitiesList;
	}
	
}
