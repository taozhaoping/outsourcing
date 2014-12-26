package com.zh.web.action;

import java.util.List;

import org.activiti.engine.FormService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.service.UserInfoService;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.model.Pager;
import com.zh.core.util.JSONUtil;
import com.zh.web.model.PersonnelModel;
import com.zh.web.model.bean.Activities;
import com.zh.web.model.bean.ActivitiesUser;
import com.zh.web.model.bean.Certificates;
import com.zh.web.model.bean.Personnel;
import com.zh.web.model.bean.Express;
import com.zh.web.model.bean.FileInfo;
import com.zh.web.model.bean.Flight;
import com.zh.web.model.bean.Hotel;
import com.zh.web.model.bean.Personnel;
import com.zh.web.model.bean.PhysicalExam;
import com.zh.web.model.bean.TrainCourse;
import com.zh.web.model.bean.TrainingOfPersonnel;
import com.zh.web.service.ActivitiesService;
import com.zh.web.service.ActivitiesUserService;
import com.zh.web.service.CertificatesService;
import com.zh.web.service.PersonnelService;
import com.zh.web.service.ExpressService;
import com.zh.web.service.FileInfoService;
import com.zh.web.service.FlightService;
import com.zh.web.service.PersonnelService;
import com.zh.web.service.TrainCourseService;
import com.zh.web.service.TrainingOfPersonnelService;

public class PersonnelAction extends BaseAction {

	/**
	 * 入职工作流
	 */
	private static final long serialVersionUID = 1L;

	private PersonnelModel personnelModel = new PersonnelModel();

	private static Logger LOGGER = LoggerFactory
			.getLogger(PersonnelAction.class);

	@Autowired
	private PersonnelService personnelService;

	@Autowired
	private CertificatesService certificatesService;

	@Autowired
	private FileInfoService fileInfoService;


	@Autowired
	private TrainCourseService trainCourseService;

	@Autowired
	private TrainingOfPersonnelService trainingOfPersonnelService;


	@Autowired
	private ActivitiesService activitiesService;

	@Autowired
	private ActivitiesUserService activitiesUserService;

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return personnelModel;
	}

	public String execute() {
		LOGGER.debug("execute()");
		/*
		 * //获取工作流的实例 List<ProcessInstance> procInstList =
		 * runtimeService.createProcessInstanceQuery()
		 * .processDefinitionKey("recruitment").list(); for(ProcessInstance pi :
		 * procInstList){ System.out.println("businessKey: " +
		 * pi.getBusinessKey() + " id: " + pi.getId()); }
		 */
		Personnel personnel = this.personnelModel.getPersonnel();
		Pager pager = this.personnelModel.getPageInfo();
		Integer count = personnelService.count(personnel);
		pager.setTotalRow(count);
		List<Personnel> personnelList = personnelService.queryList(
				personnel, pager);
		this.personnelModel.setPersonnelList(personnelList);

		return Action.SUCCESS;
	}


	/**
	 * 编辑页面 当传入id的时候为修改界面 当id为null的时候，进入新增页面
	 * 
	 * @return
	 */
	public String editor() {
		LOGGER.debug("进入编辑页面");
		String businessKey = this.personnelModel.getFormId();

			// 获取当前登陆的用户id
			// Integer userID = queryUserId();
			Personnel entryProcess = new Personnel();
			entryProcess.setId(Integer.parseInt(businessKey));
			// technologicalProcess.setWorkuserid(queryUserId());

			// 获取基本信息
			Personnel process = personnelService.query(entryProcess);
			Integer id = process.getId();
			
			// 获取证件信息
			Certificates certificates = new Certificates();
			certificates.setTechnologicalprocessid(id);
			List<Certificates> certificatesList = certificatesService
					.queryList(certificates);
			
			// 获取附件信息
			FileInfo fileInfo = new FileInfo();
			fileInfo.setTechnologicalprocessid(id);
			List<FileInfo> fileInfoList = fileInfoService.queryList(fileInfo);

			
			// 培训课程信息
			List<TrainCourse> trainCourseList = this.personnelModel
					.getTrainCourseList();
			TrainingOfPersonnel trainingOfPersonnel = new TrainingOfPersonnel();
			trainingOfPersonnel.setTechnologicalProcessId(id);
			List<TrainingOfPersonnel> trainingOfPersonnellist = trainingOfPersonnelService
					.queryList(trainingOfPersonnel);
			for (TrainingOfPersonnel trainingOf : trainingOfPersonnellist) {
				TrainCourse trainCourse = new TrainCourse();
				trainCourse.setId(trainingOf.getTrainCourseId());
				TrainCourse train = trainCourseService.query(trainCourse);
				trainCourseList.add(train);
			}

			// 活动信息
			List<Activities> activitiesList = this.personnelModel
					.getActivitiesList();
			ActivitiesUser activitiesUser = new ActivitiesUser();
			activitiesUser.setTechnologicalProcessId(id);
			List<ActivitiesUser> activitiesUserllist = activitiesUserService
					.queryList(activitiesUser);
			for (ActivitiesUser actUser : activitiesUserllist) {
				Activities activities = new Activities();
				activities.setId(actUser.getActivitiesId());
				Activities act = activitiesService.query(activities);
				activitiesList.add(act);
			}

			// 判断数据库中是否存在该数据
			if (null != process && id != null && id > 0) {

				// 判断当前工作流节点的审批人,只有当前审批人拥有修改权限，其他人只有查看权限
				this.personnelModel.setPersonnel(process);
				this.personnelModel.setCertificatesList(certificatesList);
				this.personnelModel.setFileInfoList(fileInfoList);
			}

		return Action.EDITOR;
	}

}
