package com.zh.web.action;

import java.io.IOException;
import java.io.InputStream;
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
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.bean.User;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.IDataObject;
import com.zh.core.model.Pager;
import com.zh.core.model.VariableUtil;
import com.zh.core.util.JSONUtil;
import com.zh.core.util.LoggerUtil;
import com.zh.web.model.RecruitmentModel;
import com.zh.web.model.bean.Certificates;
import com.zh.web.model.bean.Flight;
import com.zh.web.model.bean.TechnologicalProcess;
import com.zh.web.service.CertificatesService;
import com.zh.web.service.FlightService;
import com.zh.web.service.TechnologicalProcessService;

public class RecruitmentAction extends BaseAction {

	/**
	 * 招聘工作流
	 */
	private static final long serialVersionUID = 1L;
	
	//一级菜单
	private String menuId;
	//二级菜单
	private String menu2Id;

	private RecruitmentModel recruitmentModel = new RecruitmentModel();

	private static Logger LOGGER = LoggerFactory
			.getLogger(RecruitmentAction.class);

	@Autowired
	private TechnologicalProcessService technologicalProcessService;
	
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
	protected FormService FormService;

	@Autowired
	protected IdentityService identityService;
	
	@Autowired
	ProcessEngineFactoryBean processEngine;

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return recruitmentModel;
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
		TechnologicalProcess technologicalProcess = this.recruitmentModel
				.getTechnologicalProcess();
		Pager pager = this.recruitmentModel.getPageInfo();
		Integer count = technologicalProcessService.count(technologicalProcess);
		pager.setTotalRow(count);
		List<TechnologicalProcess> technologicalProcessList = technologicalProcessService
				.queryList(technologicalProcess, pager);
		this.recruitmentModel
				.setTechnologicalProcessList(technologicalProcessList);

		return Action.SUCCESS;
	}
	
	/**
	 * 保存证件列表信息(传入的事json格式对象字符串)
	 * @return
	 */
	public String saveCertificates()
	{
		String jsonList = this.recruitmentModel.getJsonList();
		if(null == jsonList || "".equals(jsonList))
		{
			LoggerUtil.error(LOGGER, "ERROR: saveCertificates jsonList String is null!");
		}
		List<IDataObject> list = (List<IDataObject>)JSONUtil.jsonArrToListObject(jsonList, Certificates.class);
		certificatesService.insertList(list);
		return editor();
	}
	/**
	 * 上传附件
	 * @return
	 */
	public String saveFile()
	{
		
		return editor();
	}

	//保存航班信息
	public String saveFlight()
	{
		String formId = this.recruitmentModel.getFormId();
		if(null == formId && "".equals(formId))
		{
			throw ProjectException.createException("当前的流程编号不允许为空！请先保存当前流程的基本信息");
		}
		Flight flight = this.recruitmentModel.getFlight();
		flight.setTechnologicalprocessid(Integer.valueOf(formId));
		Integer id = flight.getId();
		
		if(null != id && id > 0){
			flightService.update(flight);
		}else{
			flightService.insert(flight);
		}
		
		//设置权限标志位
		setAuthFlag(flight.getTechnologicalprocessid());
		return editor();
	}
	
	// 保存表单
	public String save() {
		LOGGER.debug("save()");
		TechnologicalProcess technologicalProcess = this.recruitmentModel.getTechnologicalProcess();
		Integer id = technologicalProcess.getId();

		if (null != id && id > 0) {
			technologicalProcessService.update(technologicalProcess);
			LOGGER.debug("update()...");
		} else {
			// 设置当前用户为流程发起人
			Integer userID = queryUserId();
			technologicalProcess.setWorkuserid(userID);
			technologicalProcessService.insert(technologicalProcess);
			LOGGER.debug("insert()...");
		}
		//设置权限标志位
		setAuthFlag(technologicalProcess.getId());
		
		
		return Action.EDITOR;
	}

	/**
	 * 编辑页面 当传入id的时候为修改界面 当id为null的时候，进入新增页面
	 * 
	 * @return
	 */
	public String editor() {
		LOGGER.debug("进入编辑页面");
		String businessKey = this.recruitmentModel.getFormId();
		
		if (null != businessKey && Integer.parseInt(businessKey) > 0) {
			// 获取当前登陆的用户id
			//Integer userID = queryUserId();
			TechnologicalProcess technologicalProcess = new TechnologicalProcess();
			technologicalProcess.setId(Integer.parseInt(businessKey));
			// technologicalProcess.setWorkuserid(queryUserId());
			
			//获取基本信息
			TechnologicalProcess process = technologicalProcessService.query(technologicalProcess);

			//获取证件信息
			Certificates certificates = new Certificates();
			certificates.setTechnologicalprocessid(process.getId());
			List<Certificates> certificatesList = certificatesService.queryList(certificates);
			//获取航班信息
			Flight flight = new Flight();
			flight.setTechnologicalprocessid(process.getId());
			Flight flightReult = flightService.query(flight);
			
			// 判断数据库中是否存在该数据
			if (null != process && process.getId() != null && process.getId() > 0) {
				// 获取工作流信息
				//String workflowId = process.getWorkflowid();
				//设置权限标识
				setAuthFlag(process.getId());
				
				// 判断当前工作流节点的审批人,只有当前审批人拥有修改权限，其他人只有查看权限
				this.recruitmentModel.setTechnologicalProcess(process);
				this.recruitmentModel.setCertificatesList(certificatesList);
				this.recruitmentModel.setFlight(flightReult);
			}
			
		}else{
			//新建表单时候
			TechnologicalProcess technologicalProcess = this.recruitmentModel.getTechnologicalProcess();
			// 设置当前用户为流程发起人
			Integer userID = queryUserId();
			technologicalProcess.setWorkuserid(userID);
			technologicalProcess.setState("发起");
			technologicalProcessService.insert(technologicalProcess);
			this.recruitmentModel.setHasSubmitAuth("1");
			LOGGER.debug("create form()...");
		}
		
		return Action.EDITOR;
	}

	//发起工作流
	public String createWorkflow() {
		LOGGER.debug("createWorkflow()");

		String businessKey = this.recruitmentModel.getFormId();
		String assignee = this.recruitmentModel.getAssign();
		Map<String, Object> variables = new HashMap<String, Object>();
		// variables.put("period", "2015-06");
		variables.put("nextAssignee", assignee);

		ProcessInstance processInstance = runtimeService
				.startProcessInstanceByKey("recruitment", businessKey,
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
		TechnologicalProcess technologicalProcess = new TechnologicalProcess();
		technologicalProcess.setId(Integer.parseInt(businessKey));
		technologicalProcess.setWorkflowid(workflowId);
		technologicalProcess.setState(state);
		technologicalProcess.setRes1(assignee);
		technologicalProcess.setRes3(currentTask.getId());
		
		technologicalProcessService.update(technologicalProcess);

		return "createSuccess";
	}
	
	
	// 批准工作流
	public String approveWorkflow() {
		LOGGER.debug("approveWorkflow()");
		
		String businessKey = this.recruitmentModel.getFormId();
		String assignee = this.recruitmentModel.getAssign();
		String assignFlag = this.recruitmentModel.getAssignFlag();
		
		//当前任务的id
		String curTaskId = this.recruitmentModel.getTechnologicalProcess().getRes3();
		//工作流的id，即流程的id
		String workflowId = this.recruitmentModel.getTechnologicalProcess().getWorkflowid(); 

		Map<String, Object> variables = new HashMap<String, Object>();
		// variables.put("period", "2015-06");
		variables.put("nextAssignee", assignee);
		if("0".equals(assignFlag)){
			variables.put("assigneeFlag", false);
		}else if("1".equals(assignFlag)){
			variables.put("assigneeFlag", true);
		}
		
		//完成任务
		taskService.complete(curTaskId, variables);
		//获取流程实例
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(workflowId).singleResult();
		// 任务节点
		String activityId = processInstance.getActivityId();
		
		Task currentTask = taskService.createTaskQuery()
				.processInstanceId(workflowId).taskDefinitionKey(activityId)
				.singleResult();
		// 当前任务的名称
		String state = currentTask.getName();
		
		LOGGER.debug("processInstance.id: " + workflowId);
		TechnologicalProcess technologicalProcess = new TechnologicalProcess();
		technologicalProcess.setId(Integer.parseInt(businessKey));
		technologicalProcess.setState(state);
		technologicalProcess.setRes1(assignee);
		technologicalProcess.setRes3(currentTask.getId());
		
		technologicalProcessService.update(technologicalProcess);
		
		return "createSuccess";
	}

	/***
	 * 获取流程图片
	 */
	public void loadByProcessInstance() {
		
		String processInstanceId = this.recruitmentModel.getProcessInstanceId();
//		String processInstanceId = "4017";
		
		HttpServletResponse response = ServletActionContext.getResponse();
		InputStream resourceAsStream = null;
		ProcessInstance processInstance = runtimeService
				.createProcessInstanceQuery()
				.processInstanceId(processInstanceId).singleResult();
		
		ProcessDefinition processDefinition = repositoryService
				.createProcessDefinitionQuery()
				.processDefinitionId(processInstance.getProcessDefinitionId())
				.singleResult();

		String resourceName = "recruitment.png";
		/*
		 * if (resourceType.equals("image")) { resourceName =
		 * processDefinition.getDiagramResourceName(); } else if
		 * (resourceType.equals("xml")) { resourceName =
		 * processDefinition.getResourceName(); }
		 */
		resourceAsStream = repositoryService.getResourceAsStream(processDefinition.getDeploymentId(), resourceName);
		
		byte[] b = new byte[1024];
		int len = -1;
		try {
			while ((len = resourceAsStream.read(b, 0, 1024)) != -1) {
				response.getOutputStream().write(b, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/***
	 * 获取带跟踪的流程图片
	 */
	public void loadTraceImg() {
		
		String executionId = this.recruitmentModel.getProcessInstanceId();
		
		HttpServletResponse response = ServletActionContext.getResponse();
		
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(executionId).singleResult();
        BpmnModel bpmnModel = repositoryService.getBpmnModel(processInstance.getProcessDefinitionId());
        List<String> activeActivityIds = runtimeService.getActiveActivityIds(executionId);

        // 使用spring注入引擎请使用下面的这行代码
        Context.setProcessEngineConfiguration(processEngine.getProcessEngineConfiguration());

        InputStream imageStream = ProcessDiagramGenerator.generateDiagram(bpmnModel, "png", activeActivityIds);
		
		byte[] b = new byte[1024];
		int len = -1;
		try {
			while ((len = imageStream.read(b, 0, 1024)) != -1) {
				response.getOutputStream().write(b, 0, len);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/***
	 * 表单的id
	 * @param id
	 */
	private void setAuthFlag(Integer id){
		
		TechnologicalProcess technologicalProcess = new TechnologicalProcess();
		technologicalProcess.setId(id);
		TechnologicalProcess process = technologicalProcessService.query(technologicalProcess);
		//表单的当前审批人
		String assignee = process.getRes1();
		//当前登录的用户
		User curUser = (User) this.getSession().getAttribute(VariableUtil.SESSION_KEY);
		
		String curUserName = curUser.getLoginName();
		
		//流程状态
		String state = process.getState();
		//流程是否发起
		boolean isStart = false;
		if(state != null && state.equals("发起")){
			isStart = true;
		}else{
			isStart = false;
		}
		
		//当前用户是审批者, 并且流程在<发起>节点
		if(curUserName.equals(assignee) && !isStart){
			this.recruitmentModel.setHasApprove("1");
		}
		
		//当前用户的id
		Integer curUserId =curUser.getId();

		//流程创建者的id
		Integer workUserId = process.getWorkuserid();
		
		//如果创建者为当前用户，且流程没有发起，即流程状态为<发起>，则具有发起权限
		if(curUserId == workUserId && isStart){
			this.recruitmentModel.setHasSubmitAuth("1");
		}
	}

	public RecruitmentModel getRecruitmentModel() {
		return recruitmentModel;
	}

	public void setRecruitmentModel(RecruitmentModel recruitmentModel) {
		this.recruitmentModel = recruitmentModel;
	}

	public TechnologicalProcessService getTechnologicalProcessService() {
		return technologicalProcessService;
	}

	public void setTechnologicalProcessService(
			TechnologicalProcessService technologicalProcessService) {
		this.technologicalProcessService = technologicalProcessService;
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

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getMenu2Id() {
		return menu2Id;
	}

	public void setMenu2Id(String menu2Id) {
		this.menu2Id = menu2Id;
	}

}
