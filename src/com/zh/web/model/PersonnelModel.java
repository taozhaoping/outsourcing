package com.zh.web.model;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import com.zh.core.base.model.BaseModel;
import com.zh.web.model.bean.Activities;
import com.zh.web.model.bean.ActivitiesUser;
import com.zh.web.model.bean.Certificates;
import com.zh.web.model.bean.FileInfo;
import com.zh.web.model.bean.Personnel;
import com.zh.web.model.bean.TrainCourse;
import com.zh.web.model.bean.TrainingOfPersonnel;

public class PersonnelModel extends BaseModel {

	/**
	 * 基础信息
	 */
	private Personnel personnel = new Personnel();
	
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
	 * 活动人员信息
	 */
	private ActivitiesUser activitiesUser = new ActivitiesUser();
	
	/**
	 * 活动信息
	 */
	private List<Activities> activitiesList = new ArrayList<Activities>();
	
	
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
	
	/***
	 * 
	 */
	private List<Personnel> personnelList = new ArrayList<Personnel>();
	
	
	/**
	 * 文件上传参数
	 */
	private File files = null;
	private String title = null;
	private String filesFileName = null;
	private String filesContentType = null;
	private String fileNumber;
	
	public Personnel getPersonnel() {
		return personnel;
	}
	public void setPersonnel(Personnel personnel) {
		this.personnel = personnel;
	}
	public Certificates getCertificates() {
		return certificates;
	}
	public void setCertificates(Certificates certificates) {
		this.certificates = certificates;
	}
	public List<Certificates> getCertificatesList() {
		return certificatesList;
	}
	public void setCertificatesList(List<Certificates> certificatesList) {
		this.certificatesList = certificatesList;
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
	public FileInfo getFileInfo() {
		return fileInfo;
	}
	public void setFileInfo(FileInfo fileInfo) {
		this.fileInfo = fileInfo;
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
	public List<FileInfo> getFileInfoList() {
		return fileInfoList;
	}
	public void setFileInfoList(List<FileInfo> fileInfoList) {
		this.fileInfoList = fileInfoList;
	}
	public List<Personnel> getPersonnelList() {
		return personnelList;
	}
	public void setPersonnelList(List<Personnel> personnelList) {
		this.personnelList = personnelList;
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
	
}
