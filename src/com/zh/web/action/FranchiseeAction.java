package com.zh.web.action;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.activiti.bpmn.model.BpmnModel;
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
import com.zh.core.model.Pager;
import com.zh.core.model.VariableUtil;
import com.zh.web.model.FranchiseeModel;
import com.zh.web.model.bean.Change;
import com.zh.web.model.bean.Franchisee;
import com.zh.web.model.bean.FranchiseeBO;
import com.zh.web.model.bean.MailList;
import com.zh.web.service.FranchiseeService;
import com.zh.web.service.MailListService;

/**
 * 加盟申请流程
 * 
 * @author 21829
 * 
 */
public class FranchiseeAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static Logger LOGGER = LoggerFactory
			.getLogger(FranchiseeAction.class);

	private FranchiseeModel franchiseeModel = new FranchiseeModel();

	@Autowired
	private FranchiseeService franchiseeService;

	@Autowired
	private MailListService mailListService;

	@Autowired
	private ProcessEngineFactoryBean processEngine;

	@Autowired
	protected RuntimeService runtimeService;

	@Autowired
	protected TaskService taskService;

	@Autowired
	protected RepositoryService repositoryService;

	public String execute() {
		/* 获取基本信息 */
		Franchisee franchisee = this.franchiseeModel.getFranchisee();

		/* 获取当前登录用户 */
		User user = queryUser();
		franchisee.setCreateUserId(user.getId());

		FranchiseeBO franchiseeBO = this.franchiseeModel.getFranchiseeBO();

		franchiseeBO.setFranchisee(franchisee);

		Pager pager = this.franchiseeModel.getPageInfo();
		Integer count = franchiseeService.count(franchiseeBO);
		pager.setTotalRow(count);
		List<FranchiseeBO> franchiseeBOList = franchiseeService.queryList(
				franchiseeBO, pager);
		this.franchiseeModel.setFranchiseeBOList(franchiseeBOList);
		return Action.SUCCESS;
	}

	public String editor() {
		LOGGER.debug("editor()");
		Franchisee franchisee = new Franchisee();
		// 变更的基础信息
		Change change = this.franchiseeModel.getChange();

		String businessKey = this.franchiseeModel.getFormId();

		if (null != businessKey && Integer.parseInt(businessKey) > 0) {

			change.setId(Integer.parseInt(businessKey));

			Change changeRet = franchiseeService.query(change);
			franchiseeModel.setChange(changeRet);

			franchisee.setId(Integer.parseInt(changeRet.getRes1()));

			// 获取基本信息
			Franchisee franchiseeReult = franchiseeService.query(franchisee);
			franchiseeModel.setFranchisee(franchiseeReult);
			// 获取通讯录
			MailList mailList = new MailList();
			mailList.setFranchiseeId(franchiseeReult.getId());
			List<MailList> mailListList = mailListService.queryList(mailList);

			if (change != null && change.getId() > 0) {
				// 设置权限标识
				setAuthFlag(change.getId());
			}
			this.franchiseeModel.setMailListList(mailListList);
		} else {
			// 设置当前用户为流程发起人
			Integer userID = queryUserId();
			// 设置创建者
			change.setOwner(userID);
			// 状态
			change.setStatus("发起");

			String path = this.getRequest().getContextPath();
			// 一级菜单
			String menuId = this.franchiseeModel.getMenuId();
			// 二级菜单
			String menu2Id = this.franchiseeModel.getMenu2Id();
			// 保存表单的链接信息
			String url = path + "/workflow/" + menu2Id + "!editor.jspa?menuId="
					+ menuId + "&menu2Id=" + menu2Id;
			change.setUrl(url);

			FranchiseeBO franchiseeBo = new FranchiseeBO();
			franchiseeBo.setChange(change);
			franchiseeBo.setFranchisee(franchisee);

			franchiseeBo = franchiseeService.insert(franchiseeBo);
			// 提交权限
			this.franchiseeModel.setHasSubmitAuth("1");

			this.franchiseeModel.setFranchisee(franchiseeBo.getFranchisee());
			this.franchiseeModel.setChange(franchiseeBo.getChange());
		}
		return Action.EDITOR;
	}

	public String save() {
		LOGGER.debug("save()");

		Franchisee franchisee = this.franchiseeModel.getFranchisee();
		Change change = this.franchiseeModel.getChange();

		Integer fId = franchisee.getId();
		Integer cId = change.getId();

		if (null != fId && fId > 0 && null != cId && cId > 0) {
			FranchiseeBO franchiseeBO = this.franchiseeModel.getFranchiseeBO();

			franchiseeBO.setChange(change);
			franchiseeBO.setFranchisee(franchisee);

			franchiseeService.update(franchiseeBO);
			LOGGER.debug("update()...");

		} else {
			// 设置当前用户为流程发起人
			Integer userID = queryUserId();
			franchisee.setCreateUserId(userID);
			franchiseeService.insert(franchisee);
			LOGGER.debug("insert()...");
		}
		// 设置权限
		setAuthFlag(cId);

		this.franchiseeModel.setFormId(change.getId().toString());
		return "save";
	}

	public String saveMailList() {
		LOGGER.debug("saveMailList()");
		String formId = this.franchiseeModel.getFormId();
		Integer id = this.franchiseeModel.getId();
		String view = this.franchiseeModel.getView();
		if (null == formId || "".equals(formId)) {
			throw ProjectException
					.createException("当前的流程编号不允许为空！请先保存当前流程的基本信息");
		}
		if (null != view && (null == id || "".equals(id))) {
			throw ProjectException.createException("当前的活动编号不允许为空！");
		}
		MailList mailList = this.franchiseeModel.getMailList();
		Franchisee franchisee = this.franchiseeModel.getFranchisee();
		mailList.setFranchiseeId(franchisee.getId());

		if (null != view && "delete".equals(view)) {
			mailList.setId(id);
			mailListService.delete(mailList);
		} else {
			mailListService.insert(mailList);
		}
		return "save";
	}

	/***
	 * 表单的id
	 * 
	 * @param id
	 */
	private void setAuthFlag(Integer id) {

		Change change = new Change();
		change.setId(id);
		Change retChange = franchiseeService.query(change);
		// 表单的当前审批人
		String assignee = retChange.getApprover();
		// 当前登录的用户
		User curUser = (User) this.getSession().getAttribute(
				VariableUtil.SESSION_KEY);

		String curUserName = curUser.getLoginName();

		// 流程状态
		String state = retChange.getStatus();
		// 流程是否发起
		boolean isStart = false;
		if (state != null && state.equals("发起")) {
			isStart = true;
		} else {
			isStart = false;
		}

		// 当前用户是审批者, 并且流程在<发起>节点
		if (curUserName.equals(assignee) && !isStart) {
			this.franchiseeModel.setHasApprove("1");
		}

		// 当前用户的id
		Integer curUserId = curUser.getId();

		// 流程创建者的id
		Integer workUserId = retChange.getOwner();

		// 如果创建者为当前用户，且流程没有发起，即流程状态为<发起>，则具有发起权限
		if (curUserId.equals(workUserId) && isStart) {
			this.franchiseeModel.setHasSubmitAuth("1");
		}
	}

	// 发起工作流
	public String createWorkflow() {
		LOGGER.debug("createWorkflow()");
		String businessKey = this.franchiseeModel.getFormId();
		String assignee = this.franchiseeModel.getAssign();
		Map<String, Object> variables = new HashMap<String, Object>();
		// variables.put("period", "2015-06");
		variables.put("nextAssignee", assignee);

		ProcessInstance processInstance = runtimeService
				.startProcessInstanceByKey("franchisee", businessKey, variables);

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

		Change change = new Change();
		change.setId(Integer.parseInt(businessKey));
		change.setWorkflowId(workflowId);
		change.setStatus(state);
		change.setApprover(assignee);
		change.setTaskId(currentTask.getId());

		franchiseeService.update(change);

		return "createSuccess";
	}

	// 批准工作流
	public String approveWorkflow() {
		LOGGER.debug("approveWorkflow()");

		String businessKey = this.franchiseeModel.getFormId();
		String assignee = this.franchiseeModel.getAssign();
		String assignFlag = this.franchiseeModel.getAssignFlag();

		// 当前任务的id
		String curTaskId = this.franchiseeModel.getChange().getTaskId();
		// 工作流的id，即流程的id
		String workflowId = this.franchiseeModel.getChange().getWorkflowId();

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

		Change change = new Change();
		change.setId(Integer.parseInt(businessKey));

		if (processInstance != null) {
			// 任务节点
			String activityId = processInstance.getActivityId();

			Task currentTask = taskService.createTaskQuery()
					.processInstanceId(workflowId)
					.taskDefinitionKey(activityId).singleResult();
			// 当前任务的名称
			String state = currentTask.getName();

			LOGGER.debug("processInstance.id: " + workflowId);
			change.setStatus(state);
			change.setApprover(assignee);
			change.setTaskId(currentTask.getId());
		} else {
			change.setStatus("结束");
			change.setApprover("-1");
			change.setTaskId("-1");
		}

		franchiseeService.update(change);

		return "createSuccess";
	}

	/***
	 * 获取流程图片
	 */
	public void loadByProcessInstance() {
		LOGGER.debug("loadByProcessInstance()");
		try {
			String processInstanceId = this.franchiseeModel
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

			String resourceName = "franchisee.png";
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
			String executionId = this.franchiseeModel.getProcessInstanceId();

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

	@Override
	public Object getModel() {
		return franchiseeModel;
	}

	public FranchiseeModel getFranchiseeModel() {
		return franchiseeModel;
	}

	public void setFranchiseeModel(FranchiseeModel franchiseeModel) {
		this.franchiseeModel = franchiseeModel;
	}

	public FranchiseeService getFranchiseeService() {
		return franchiseeService;
	}

	public void setFranchiseeService(FranchiseeService franchiseeService) {
		this.franchiseeService = franchiseeService;
	}

	public MailListService getMailListService() {
		return mailListService;
	}

	public void setMailListService(MailListService mailListService) {
		this.mailListService = mailListService;
	}

}
