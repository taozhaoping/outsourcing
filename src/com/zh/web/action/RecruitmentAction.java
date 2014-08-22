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

import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.model.Pager;
import com.zh.web.model.RecruitmentModel;
import com.zh.web.model.bean.TechnologicalProcess;
import com.zh.web.service.TechnologicalProcessService;

public class RecruitmentAction extends BaseAction {

	/**
	 * 招聘工作流
	 */
	private static final long serialVersionUID = 1L;

	private RecruitmentModel recruitmentModel = new RecruitmentModel();

	private static Logger LOGGER = LoggerFactory
			.getLogger(RecruitmentAction.class);

	@Autowired
	private TechnologicalProcessService technologicalProcessService;

	@Autowired
	protected RuntimeService runtimeService;

	@Autowired
	protected TaskService taskService;

	@Autowired
	protected RepositoryService repositoryService;

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

	// 保存表单
	public String save() {
		LOGGER.debug("save()");
		TechnologicalProcess technologicalProcess = this.recruitmentModel
				.getTechnologicalProcess();
		Integer id = technologicalProcess.getId();

		if (null != id && id > 0) {
			technologicalProcessService.update(technologicalProcess);
		} else {
			// 设置当前用户为流程发起人
			Integer userID = queryUserId();
			technologicalProcess.setWorkuserid(userID);
			technologicalProcessService.insert(technologicalProcess);
		}
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
			Integer userID = queryUserId();
			TechnologicalProcess technologicalProcess = new TechnologicalProcess();
			technologicalProcess.setId(Integer.parseInt(businessKey));
			// technologicalProcess.setWorkuserid(queryUserId());
			TechnologicalProcess Process = technologicalProcessService
					.query(technologicalProcess);

			// 判断数据库中是否存在该数据
			if (null != Process && Process.getId() != null
					&& Process.getId() > 0) {
				// 获取工作流信息
				String workflowId = Process.getWorkflowid();

				// 判断当前工作流节点的审批人,只有当前审批人拥有修改权限，其他人只有查看权限
				this.recruitmentModel.setTechnologicalProcess(Process);
			}
		}
		return Action.EDITOR;
	}

	// 创建工作流
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

}
