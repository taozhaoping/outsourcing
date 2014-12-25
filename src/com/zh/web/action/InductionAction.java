package com.zh.web.action;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.activiti.bpmn.model.BpmnModel;
import org.activiti.engine.FormService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.bpmn.diagram.ProcessDiagramGenerator;
import org.activiti.engine.impl.context.Context;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.apache.avalon.framework.parameters.ParameterException;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.bean.User;
import com.zh.base.service.UserInfoService;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.IDataObject;
import com.zh.core.model.Pager;
import com.zh.core.model.VariableUtil;
import com.zh.core.util.GlobEnv;
import com.zh.core.util.JSONUtil;
import com.zh.core.util.LoggerUtil;
import com.zh.web.model.InductionModel;
import com.zh.web.model.bean.Certificates;
import com.zh.web.model.bean.EntryProcess;
import com.zh.web.model.bean.Express;
import com.zh.web.model.bean.FileInfo;
import com.zh.web.model.bean.Flight;
import com.zh.web.model.bean.Hotel;
import com.zh.web.model.bean.PhysicalExam;
import com.zh.web.model.bean.TrainCourse;
import com.zh.web.model.bean.TrainingOfPersonnel;
import com.zh.web.service.CertificatesService;
import com.zh.web.service.EntryProcessService;
import com.zh.web.service.ExpressService;
import com.zh.web.service.FileInfoService;
import com.zh.web.service.FlightService;
import com.zh.web.service.HotelService;
import com.zh.web.service.PhysicalExamService;
import com.zh.web.service.TrainCourseService;
import com.zh.web.service.TrainingOfPersonnelService;

public class InductionAction extends BaseAction {
	
	/**
	 * 入职工作流
	 */
	private static final long serialVersionUID = 1L;

	private InductionModel inductionModel = new InductionModel();

	private static Logger LOGGER = LoggerFactory
			.getLogger(InductionAction.class);

	@Autowired
	private EntryProcessService entryProcessService;

	@Autowired
	private FlightService flightService;

	@Autowired
	protected RuntimeService runtimeService;

	@Autowired
	protected TaskService taskService;

	@Autowired
	protected RepositoryService repositoryService;

	@Autowired
	private CertificatesService certificatesService;

	@Autowired
	private FileInfoService fileInfoService;

	@Autowired
	protected FormService FormService;

	@Autowired
	protected IdentityService identityService;

	@Autowired
	ProcessEngineFactoryBean processEngine;
	
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private ExpressService expressService;
	
	@Autowired
	private TrainCourseService trainCourseService;

	@Autowired
	private TrainingOfPersonnelService trainingOfPersonnelService;
	
	@Autowired
	private HotelService hotelService;
	
	@Autowired
	private PhysicalExamService physicalExamService;

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return inductionModel;
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
		EntryProcess entryProcess = this.inductionModel
				.getEntryProcess();
		Pager pager = this.inductionModel.getPageInfo();
		Integer count = entryProcessService.count(entryProcess);
		pager.setTotalRow(count);
		List<EntryProcess> entryProcessList = entryProcessService
				.queryList(entryProcess, pager);
		this.inductionModel
				.setEntryProcessList(entryProcessList);
		
		return Action.SUCCESS;
	}

	/**
	 * 保存证件列表信息(传入的事json格式对象字符串)
	 * 
	 * @return
	 * @throws ParameterException 
	 */
	public String saveCertificates() throws ParameterException {
		String jsonList = this.inductionModel.getJsonList();
		if (null == jsonList || "".equals(jsonList)) {
			LoggerUtil.error(LOGGER,
					"ERROR: saveCertificates jsonList String is null!");
		}
		List<IDataObject> list = (List<IDataObject>) JSONUtil
				.jsonArrToListObject(jsonList, Certificates.class);
		certificatesService.insertList(list);
		return "save";
	}
	
	public String saveExpress()
	{
		Express express = this.inductionModel.getExpress();
		Integer id = express.getId();
		String fromID = this.inductionModel.getFormId();
		if (null == fromID || "".equals(fromID)) {
			throw new ProjectException("编号不允许为null");
		}
		if(null != id&& id > 0)
		{
			expressService.update(express);
		}else
		{
			express.setTechnologicalprocessid(Integer.valueOf(fromID));
			expressService.insert(express);
		}
		return "save";
	}

	/**
	 * 上传附件
	 * 
	 * @return
	 */
	public String saveFile() {
		String fromId = this.getInductionModel().getFormId();

		if (null == fromId || "".equals(fromId)) {
			throw new ProjectException("编号不允许为null");
		}
		FileInfo fileInfo = this.getInductionModel().getFileInfo();

		if (null == fileInfo.getId() || "".equals(fileInfo.getId())) {
			// 组装文件保存路径
			StringBuffer filePath = GlobEnv.getUploadFilePath();
			String fileName = this.getInductionModel().getFilesFileName();
			filePath.append(fromId);
			filePath.append("//");
			filePath.append(fileName);
			File file = new File(filePath.toString());
			try {
				FileUtil.copyFile(this.getInductionModel().getFiles(), file);
			} catch (IOException e) {
				throw new ProjectException("上传文件失败");
			}

			// 保存文件到数据库
			fileInfo.setTechnologicalprocessid(Integer.valueOf(fromId));
			fileInfo.setName(fileName);
			fileInfo.setType(this.getInductionModel().getFilesContentType());
			fileInfoService.insert(fileInfo);
		}else
		{
			//修改数据
			fileInfo.setTechnologicalprocessid(Integer.valueOf(fromId));
			fileInfoService.update(fileInfo);
		}
		return "save";
	}

	/**
	 * 保存体检信息
	 * @return
	 */
	public String savePhysicalExam()
	{
		String formId = this.inductionModel.getFormId();
		if (null == formId && "".equals(formId)) {
			throw ProjectException
					.createException("当前的流程编号不允许为空！");
		}
		PhysicalExam physicalExam = this.inductionModel.getPhysicalExam();
		physicalExam.setTechnologicalProcessId(Integer.valueOf(formId));
		Integer id = physicalExam.getId();

		if (null != id && id > 0) {
			physicalExamService.update(physicalExam);
		} else {
			physicalExamService.insert(physicalExam);
		}

		return "save";
	}
	/**
	 * 保存酒店信息
	 * @return
	 */
	public String saveHotel() {
		String formId = this.inductionModel.getFormId();
		if (null == formId && "".equals(formId)) {
			throw ProjectException
					.createException("当前的流程编号不允许为空！请先保存当前流程的基本信息");
		}
		Hotel hotel = this.inductionModel.getHotel();
		hotel.setTechnologicalProcessId(Integer.valueOf(formId));
		Integer id = hotel.getId();

		if (null != id && id > 0) {
			hotelService.update(hotel);
		} else {
			hotelService.insert(hotel);
		}

		return "save";
	}
	
	// 保存航班信息
	public String saveFlight() {
		String formId = this.inductionModel.getFormId();
		if (null == formId && "".equals(formId)) {
			throw ProjectException
					.createException("当前的流程编号不允许为空！请先保存当前流程的基本信息");
		}
		Flight flight = this.inductionModel.getFlight();
		flight.setTechnologicalprocessid(Integer.valueOf(formId));
		Integer id = flight.getId();

		if (null != id && id > 0) {
			flightService.update(flight);
		} else {
			flightService.insert(flight);
		}

		// 设置权限标志位
		setAuthFlag(flight.getTechnologicalprocessid());
		this.inductionModel.setFormId(flight.getTechnologicalprocessid()
				.toString());
		return "save";
	}
	
	//保存培训信息
		public String saveTrainCourse() {
			String formId = this.inductionModel.getFormId();
			Integer id = this.inductionModel.getId();
			String view = this.inductionModel.getView();
			if (null == formId || "".equals(formId)) {
				throw ProjectException
						.createException("当前的流程编号不允许为空！请先保存当前流程的基本信息");
			}
			if (null != view && ( null == id || "".equals(id) )) {
				throw ProjectException
						.createException("当前的培训编号不允许为空！");
			}
			TrainingOfPersonnel trainingOfPersonnel = this.inductionModel.getTrainingOfPersonnel();
			trainingOfPersonnel.setTechnologicalProcessId(Integer.valueOf(formId));
			
			if ( null != view && "delete".equals(view))
			{
				trainingOfPersonnel.setTrainCourseId(id);
				trainingOfPersonnelService.delete(trainingOfPersonnel);
			}else
			{
				trainingOfPersonnelService.insert(trainingOfPersonnel);
			}
			return "save";
		}

	// 保存表单
	public String save() {
		LOGGER.debug("save()");
		EntryProcess entryProcess = this.inductionModel
				.getEntryProcess();
		Integer id = entryProcess.getId();

		if (null != id && id > 0) {
			entryProcessService.update(entryProcess);
			LOGGER.debug("update()...");
		} else {
			// 设置当前用户为流程发起人
			Integer userID = queryUserId();
			entryProcess.setWorkuserid(userID);
			entryProcessService.insert(entryProcess);
			LOGGER.debug("insert()...");
		}
		// 设置权限标志位
		setAuthFlag(entryProcess.getId());
		this.inductionModel
				.setFormId(entryProcess.getId().toString());
		return "save";
	}

	/**
	 * 编辑页面 当传入id的时候为修改界面 当id为null的时候，进入新增页面
	 * 
	 * @return
	 */
	public String editor() {
		LOGGER.debug("进入编辑页面");
		String businessKey = this.inductionModel.getFormId();

		if (null != businessKey && Integer.parseInt(businessKey) > 0) {
			// 获取当前登陆的用户id
			// Integer userID = queryUserId();
			EntryProcess entryProcess = new EntryProcess();
			entryProcess.setId(Integer.parseInt(businessKey));
			// technologicalProcess.setWorkuserid(queryUserId());

			// 获取基本信息
			EntryProcess process = entryProcessService
					.query(entryProcess);
			Integer id = process.getId();
			// 获取证件信息
			Certificates certificates = new Certificates();
			certificates.setTechnologicalprocessid(id);
			List<Certificates> certificatesList = certificatesService
					.queryList(certificates);
			// 获取航班信息
			Flight flight = new Flight();
			flight.setTechnologicalprocessid(id);
			Flight flightReult = flightService.query(flight);
			
			//快递信息
			Express express = new Express();
			express.setTechnologicalprocessid(id);
			Express expressReult = expressService.query(express);

			// 获取附件信息
			FileInfo fileInfo = new FileInfo();
			fileInfo.setTechnologicalprocessid(id);
			List<FileInfo> fileInfoList = fileInfoService.queryList(fileInfo);
			
			//酒店信息
			Hotel hotel = new Hotel();
			hotel.setTechnologicalProcessId(id);
			Hotel hotelReult = hotelService.query(hotel);
			
			//体检信息
			PhysicalExam physicalExam = new PhysicalExam();
			physicalExam.setTechnologicalProcessId(id);
			PhysicalExam physicalExamReult = physicalExamService.query(physicalExam);
			
			//培训课程信息
			List<TrainCourse> trainCourseList = this.inductionModel.getTrainCourseList();
			TrainingOfPersonnel trainingOfPersonnel = new TrainingOfPersonnel();
			trainingOfPersonnel.setTechnologicalProcessId(id);
			List<TrainingOfPersonnel> trainingOfPersonnellist = trainingOfPersonnelService.queryList(trainingOfPersonnel);
			for (TrainingOfPersonnel trainingOf : trainingOfPersonnellist) {
				TrainCourse trainCourse = new TrainCourse();
				trainCourse.setId(trainingOf.getTrainCourseId());
				TrainCourse train = trainCourseService.query(trainCourse);
				trainCourseList.add(train);
			}
			
			// 判断数据库中是否存在该数据
			if (null != process && id != null
					&& id > 0) {
				// 获取工作流信息
				// String workflowId = process.getWorkflowid();
				// 设置权限标识
				setAuthFlag(id);

				// 判断当前工作流节点的审批人,只有当前审批人拥有修改权限，其他人只有查看权限
				this.inductionModel.setEntryProcess(process);
				this.inductionModel.setCertificatesList(certificatesList);
				this.inductionModel.setCertificatesListJson(JSONUtil
						.list2json(certificatesList));
				this.inductionModel.setFileInfoListJson(JSONUtil
						.list2json(fileInfoList));
				this.inductionModel.setExpress(expressReult);
				this.inductionModel.setFlight(flightReult);
				this.inductionModel.setHotel(hotelReult);
				this.inductionModel.setPhysicalExam(physicalExamReult);
			}

		} else {
			// 新建表单时候
			EntryProcess entryProcess = this.inductionModel
					.getEntryProcess();
			// 设置当前用户为流程发起人
			Integer userID = queryUserId();
			entryProcess.setWorkuserid(userID);
			entryProcess.setState("发起");

			String path = this.getRequest().getContextPath();
			// 一级菜单
			String menuId = this.inductionModel.getMenuId();
			// 二级菜单
			String menu2Id = this.inductionModel.getMenu2Id();
			// 保存表单的链接信息
			String url = path + "/workflow/" + menu2Id + "!editor.jspa?menuId="
					+ menuId + "&menu2Id=" + menu2Id;
			entryProcess.setUrl(url);
			entryProcessService.insert(entryProcess);
			this.inductionModel.setHasSubmitAuth("1");
			LOGGER.debug("create form()...");
		}
		
		//获取用户列表，
		//User user = new User();
		//List<User> List = userInfoService.queryList(user);
		
		return Action.EDITOR;
	}

	// 发起工作流
	public String createWorkflow() {
		LOGGER.debug("createWorkflow()");

		String businessKey = this.inductionModel.getFormId();
		String assignee = this.inductionModel.getAssign();
		Map<String, Object> variables = new HashMap<String, Object>();
		// variables.put("period", "2015-06");
		variables.put("nextAssignee", assignee);

		ProcessInstance processInstance = runtimeService
				.startProcessInstanceByKey("induction", businessKey,
						variables);

		// 流程id
		String workflowId = processInstance.getId();
		// 任务节点
		String activityId = processInstance.getActivityId();

		Task currentTask = taskService.createTaskQuery()
				.processInstanceId(workflowId).taskDefinitionKey(activityId)
				.singleResult();
		// 当前任务的名称
		String state = currentTask.getName();

		LOGGER.debug("processInstance.id: " + workflowId);
		EntryProcess entryProcess = new EntryProcess();
		entryProcess.setId(Integer.parseInt(businessKey));
		entryProcess.setWorkflowid(workflowId);
		entryProcess.setState(state);
		entryProcess.setApprover(assignee);
		entryProcess.setTaskId(currentTask.getId());

		entryProcessService.update(entryProcess);

		return "createSuccess";
	}

	// 批准工作流
	public String approveWorkflow() {
		LOGGER.debug("approveWorkflow()");

		String businessKey = this.inductionModel.getFormId();
		String assignee = this.inductionModel.getAssign();
		String assignFlag = this.inductionModel.getAssignFlag();

		// 当前任务的id
		String curTaskId = this.inductionModel.getEntryProcess()
				.getTaskId();
		// 工作流的id，即流程的id
		String workflowId = this.inductionModel.getEntryProcess()
				.getWorkflowid();

		Map<String, Object> variables = new HashMap<String, Object>();
		// variables.put("period", "2015-06");
		if ("0".equals(assignFlag)) {
			variables.put("assignFlag", false);
		} else if ("1".equals(assignFlag)) {
			variables.put("assignFlag", true);
			variables.put("nextAssignee", assignee);
		}

		// 完成任务
		taskService.complete(curTaskId, variables);
		// 获取流程实例
		ProcessInstance processInstance = runtimeService
				.createProcessInstanceQuery().processInstanceId(workflowId)
				.singleResult();

		EntryProcess entryProcess = new EntryProcess();
		entryProcess.setId(Integer.parseInt(businessKey));

		if (processInstance != null) {
			// 任务节点
			String activityId = processInstance.getActivityId();

			Task currentTask = taskService.createTaskQuery()
					.processInstanceId(workflowId)
					.taskDefinitionKey(activityId).singleResult();
			// 当前任务的名称
			String state = currentTask.getName();

			LOGGER.debug("processInstance.id: " + workflowId);
			entryProcess.setState(state);
			entryProcess.setApprover(assignee);
			entryProcess.setTaskId(currentTask.getId());
		} else {
			entryProcess.setState("结束");
			entryProcess.setApprover("-1");
			entryProcess.setTaskId("-1");
		}

		entryProcessService.update(entryProcess);

		return "createSuccess";
	}

	/***
	 * 获取流程图片
	 */
	public void loadByProcessInstance() {
		LOGGER.debug("loadByProcessInstance()");
		try {
			String processInstanceId = this.inductionModel
					.getProcessInstanceId();

			HttpServletResponse response = ServletActionContext.getResponse();
			InputStream resourceAsStream = null;
			ProcessInstance processInstance = runtimeService
					.createProcessInstanceQuery()
					.processInstanceId(processInstanceId).singleResult();

			ProcessDefinition processDefinition = repositoryService
					.createProcessDefinitionQuery()
					.processDefinitionId(
							processInstance.getProcessDefinitionId())
					.singleResult();

			String resourceName = "induction.png";
			/*
			 * if (resourceType.equals("image")) { resourceName =
			 * processDefinition.getDiagramResourceName(); } else if
			 * (resourceType.equals("xml")) { resourceName =
			 * processDefinition.getResourceName(); }
			 */
			resourceAsStream = repositoryService.getResourceAsStream(
					processDefinition.getDeploymentId(), resourceName);

			byte[] b = new byte[1024];
			int len = -1;
			try {
				while ((len = resourceAsStream.read(b, 0, 1024)) != -1) {
					response.getOutputStream().write(b, 0, len);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error("message: " + e.getMessage() + " cause:"
					+ e.getCause());
		}

	}

	/***
	 * 获取带跟踪的流程图片
	 */
	public void loadTraceImg() {
		LOGGER.debug("loadTraceImg()");
		try {
			String executionId = this.inductionModel.getProcessInstanceId();

			HttpServletResponse response = ServletActionContext.getResponse();

			ProcessInstance processInstance = runtimeService
					.createProcessInstanceQuery()
					.processInstanceId(executionId).singleResult();

			if (null != processInstance) {
				String proDefId = processInstance.getProcessDefinitionId();

				BpmnModel bpmnModel = repositoryService.getBpmnModel(proDefId);

				List<String> activeActivityIds = runtimeService
						.getActiveActivityIds(executionId);

				// 使用spring注入引擎请使用下面的这行代码
				Context.setProcessEngineConfiguration(processEngine
						.getProcessEngineConfiguration());

				InputStream imageStream = ProcessDiagramGenerator
						.generateDiagram(bpmnModel, "png", activeActivityIds);

				byte[] b = new byte[1024];
				int len = -1;
				try {
					while ((len = imageStream.read(b, 0, 1024)) != -1) {
						response.getOutputStream().write(b, 0, len);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				LOGGER.debug("流程没有发起或者流程已经结束.");
			}

		} catch (Exception e) {
			e.printStackTrace();
			LOGGER.error("message:" + e.getMessage() + " cause:" + e.getCause());
		}
	}
	
	
	/***
	 * 审核工作流的发放
	 */
	public String auditRelease(){
		//不同的节点去查不同的数据库表
		//当前节点
		String curState = this.inductionModel.getState();
		//表单Id
		String formId = this.inductionModel.getFormId();
		
		//审核结果
		List<String> auditRet = new ArrayList<String>();
		
		if("发起".equalsIgnoreCase(curState)){
			EntryProcess entryProcess = new EntryProcess();
			entryProcess.setId(Integer.parseInt(formId));
			
			// 获取基本信息
			EntryProcess process = entryProcessService.query(entryProcess);
			String description = process.getDescription();
			if(null == description || description.isEmpty()){
				auditRet.add("描述");
			}
			String name = process.getName();
			if(null == name || name.isEmpty()){
				auditRet.add("姓名");
			}
			
			String englishName = process.getEnglishname();
			if(null == englishName || englishName.isEmpty()){
				auditRet.add("英文名");
			}
			
			String nationality = process.getNationality();
			if(null == nationality || nationality.isEmpty()){
				auditRet.add("国籍");
			}
			
			String currentlocation = process.getCurrentlocation();
			if(null == currentlocation || currentlocation.isEmpty()){
				auditRet.add("目前所在地(国家)");
			}
			
			String yearbirth = process.getYearbirth();
			if(null == yearbirth || yearbirth.isEmpty()){
				auditRet.add("出生年份");
			}
			
			Date birthday = process.getBirthday();
			if(null == birthday){
				auditRet.add("生日");
			}
			
			String contracttype = process.getContracttype();
			if(null == contracttype || contracttype.isEmpty()){
				auditRet.add("合同种类");
			}
			
			String contractdate = process.getContractdate();
			if(null == contractdate || contractdate.isEmpty()){
				auditRet.add("合同有效期");
			}
			
			String passportNO = process.getPassportno();
			if(null == passportNO || passportNO.isEmpty()){
				auditRet.add("护照号");
			}
			
			String passportDate = process.getPassportnodate();
			if(null == passportDate || passportDate.isEmpty()){
				auditRet.add("护照有效期");
			}
			
			String mail = process.getMail();
			if(null == mail || mail.isEmpty()){
				auditRet.add("电子邮箱");
			}
			
			
		}else if("办证".equalsIgnoreCase(curState)){
			// 获取证件信息
			Certificates certificates = new Certificates();
			certificates.setTechnologicalprocessid(Integer.parseInt(formId));
			List<Certificates> certificatesList = certificatesService.queryList(certificates);
			List<String> requiredField = new ArrayList<String>();
			requiredField.add("1");
			requiredField.add("2");
			requiredField.add("8");
			requiredField.add("9");
			/**
			<select id='certificatesType' class='input-medium' >
				<option value='1'>工作许可证</option>
				<option value='2'>邀请函</option>
				<option value='3'>公司邀请函</option>
				<option value='4'>暂住证</option>
				<option value='5'>工作签</option>
				<option value='6'>入境章页</option>
				<option value='7'>保险</option>
				<option value='8'>外国专家证</option>
				<option value='9'>居留许可</option>
			</select>
			*/
			
			for(Certificates cer : certificatesList){
				requiredField.remove(cer.getType());
			}
			
			if(!requiredField.isEmpty()){
				auditRet.add("证件信息:");
				for(String str : requiredField){
					if("1".equals(str)){
						auditRet.add("工作许可证");
					}else if("2".equals(str)){
						auditRet.add("邀请函");
						
					}else if("8".equals(str)){
						auditRet.add("外国专家证");
						
					}else if("9".equals(str)){
						auditRet.add("居留许可");
					}
				}
			}
			
			// 获取附件信息
			FileInfo fileInfo = new FileInfo();
			fileInfo.setTechnologicalprocessid(Integer.parseInt(formId));
			List<FileInfo> fileInfoList = fileInfoService.queryList(fileInfo);
			
			/***
  			<option value="1">护照</option>
			<option value="2">毕业证</option>
			<option value="3">简历</option>
			<option value="4">Profile Form</option>
			<option value="5">其他证件(TEFL、家属证明)</option>
			<option value="6">合同word版本</option>
			<option value="7">合同签字版本</option>
			<option value="8">工作许可证</option>
			<option value="9">邀请函</option>
			<option value="10">公司邀请函</option>
			<option value="11">外国专家证</option>
			<option value="12">居留许可</option
			 */
			List<String> fileRequiredField = new ArrayList<String>();
			fileRequiredField.add("1");
			fileRequiredField.add("2");
			fileRequiredField.add("3");
			fileRequiredField.add("4");
			fileRequiredField.add("5");
			fileRequiredField.add("6");
			fileRequiredField.add("7");
			fileRequiredField.add("8");
			fileRequiredField.add("9");
			fileRequiredField.add("10");
			fileRequiredField.add("11");
			fileRequiredField.add("12");
			
			for(FileInfo file : fileInfoList){
				fileRequiredField.remove(file.getNametype());
			}
		
			if(!fileRequiredField.isEmpty()){
				auditRet.add("附件信息(需要上传的附件):");
				for(String str : fileRequiredField){
					if("1".equals(str)){
						auditRet.add("护照");
					}else if("2".equals(str)){
						auditRet.add("毕业证");
					}else if("3".equals(str)){
						auditRet.add("简历");
					}else if("4".equals(str)){
						auditRet.add("Profile Form");
					}else if("5".equals(str)){
						auditRet.add("其他证件(TEFL、家属证明)");
					}else if("6".equals(str)){
						auditRet.add("合同word版本");
					}else if("7".equals(str)){
						auditRet.add("合同签字版本");
					}else if("8".equals(str)){
						auditRet.add("工作许可证");
					}else if("9".equals(str)){
						auditRet.add("邀请函");
					}else if("10".equals(str)){
						auditRet.add("公司邀请函");
					}else if("11".equals(str)){
						auditRet.add("外国专家证");
					}else if("12".equals(str)){
						auditRet.add("居留许可");
					}
				}
			}
			
		}else if("邀请".equalsIgnoreCase(curState)){
			//快递信息
			Express express = new Express();
			express.setTechnologicalprocessid(Integer.parseInt(formId));
			Express expressResult = expressService.query(express);
			//快递单号
			String expressNumber = expressResult.getExpressnumber();
			if(null == expressNumber || expressNumber.isEmpty()){
				auditRet.add("快递单号");
			}
			
			//快递公司
			String company = expressResult.getCompany();
			if(null == company || company.isEmpty()){
				auditRet.add("快递公司");
			}
			
			//发货日期
			Date delivergoodsdate = expressResult.getDelivergoodsdate();
			if(null == delivergoodsdate){
				auditRet.add("发货日期");
			}
			
			//公司电话
			String telephone = expressResult.getTelephone();
			if(null == telephone || telephone.isEmpty()){
				auditRet.add("公司电话");
			}
			
			//收货地址
			String address = expressResult.getAddress();
			if(null == address || address.isEmpty()){
				auditRet.add("收货地址");
			}
		
		}else if("航班确认".equalsIgnoreCase(curState)){
			// 获取航班信息
			Flight flight = new Flight();
			flight.setTechnologicalprocessid(Integer.parseInt(formId));
			Flight flightResult = flightService.query(flight);
			
			//航班号
			String flightNumber = flightResult.getFlightnumber();
			if(null == flightNumber || flightNumber.isEmpty()){
				auditRet.add("航班号");
			}
			
			//接机人
			Integer airportpeopleid = flightResult.getAirportpeopleid();
			if(null == airportpeopleid){
				auditRet.add("接机人");
			}
			
			//起飞时间
			Date startdate = flightResult.getStartdate();
			if(null == startdate){
				auditRet.add("起飞时间");
			}
			
			//到达时间
			Date enddate = flightResult.getEnddate();
			if(null == enddate){
				auditRet.add("到达时间");
			}
			
			//到达机场
			String place = flightResult.getPlace();
			if(null == place || place.isEmpty()){
				auditRet.add("到达机场");
			}
		}else {
			
		}

		this.inductionModel.setAuditRet(auditRet);
		return "audit";
	}
	

	/***
	 * 表单的id
	 * 
	 * @param id
	 */
	private void setAuthFlag(Integer id) {

		EntryProcess entryProcess = new EntryProcess();
		entryProcess.setId(id);
		EntryProcess process = entryProcessService
				.query(entryProcess);
		// 表单的当前审批人
		String assignee = process.getApprover();
		// 当前登录的用户
		User curUser = (User) this.getSession().getAttribute(
				VariableUtil.SESSION_KEY);

		String curUserName = curUser.getLoginName();

		// 流程状态
		String state = process.getState();
		// 流程是否发起
		boolean isStart = false;
		if (state != null && state.equals("发起")) {
			isStart = true;
		} else {
			isStart = false;
		}

		// 当前用户是审批者, 并且流程在<发起>节点
		if (curUserName.equals(assignee) && !isStart) {
			this.inductionModel.setHasApprove("1");
		}

		// 当前用户的id
		Integer curUserId = curUser.getId();

		// 流程创建者的id
		Integer workUserId = process.getWorkuserid();

		// 如果创建者为当前用户，且流程没有发起，即流程状态为<发起>，则具有发起权限
		if (curUserId.equals(workUserId) && isStart) {
			this.inductionModel.setHasSubmitAuth("1");
		}
	}

	public InductionModel getInductionModel() {
		return inductionModel;
	}

	public void setInductionModel(InductionModel inductionModel) {
		this.inductionModel = inductionModel;
	}

	public RuntimeService getRuntimeService() {
		return runtimeService;
	}

	public void setRuntimeService(RuntimeService runtimeService) {
		this.runtimeService = runtimeService;
	}

	public TaskService getTaskService() {
		return taskService;
	}

	public void setTaskService(TaskService taskService) {
		this.taskService = taskService;
	}

	public RepositoryService getRepositoryService() {
		return repositoryService;
	}

	public void setRepositoryService(RepositoryService repositoryService) {
		this.repositoryService = repositoryService;
	}

	public FormService getFormService() {
		return FormService;
	}

	public void setFormService(FormService formService) {
		FormService = formService;
	}

	public IdentityService getIdentityService() {
		return identityService;
	}

	public void setIdentityService(IdentityService identityService) {
		this.identityService = identityService;
	}

	public EntryProcessService getEntryProcessService() {
		return entryProcessService;
	}

	public void setEntryProcessService(EntryProcessService entryProcessService) {
		this.entryProcessService = entryProcessService;
	}

	public FlightService getFlightService() {
		return flightService;
	}

	public void setFlightService(FlightService flightService) {
		this.flightService = flightService;
	}

	public CertificatesService getCertificatesService() {
		return certificatesService;
	}

	public void setCertificatesService(CertificatesService certificatesService) {
		this.certificatesService = certificatesService;
	}

	public FileInfoService getFileInfoService() {
		return fileInfoService;
	}

	public void setFileInfoService(FileInfoService fileInfoService) {
		this.fileInfoService = fileInfoService;
	}

	public UserInfoService getUserInfoService() {
		return userInfoService;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public ExpressService getExpressService() {
		return expressService;
	}

	public void setExpressService(ExpressService expressService) {
		this.expressService = expressService;
	}
	
}
