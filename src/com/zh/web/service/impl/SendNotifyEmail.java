package com.zh.web.service.impl;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.activiti.engine.identity.User;
import org.activiti.engine.repository.ProcessDefinition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.zh.base.util.MailUtil;

/***
 * 到达任务，发送邮件提醒
 * 
 * @author 21829
 * 
 */
public class SendNotifyEmail implements TaskListener {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2979043532744288424L;
	
	/***
	 * 日志
	 */
	private static Logger LOGGER = LoggerFactory.getLogger(SendNotifyEmail.class);

	@Override
	public void notify(DelegateTask task) {
		LOGGER.debug("SendNotifyEmail notify(DelegateTask task)");
		try {
			DelegateExecution execution = task.getExecution();
			IdentityService identityService = execution.getEngineServices().getIdentityService();
			// 当前用户
			String applyUserId = task.getAssignee();
			User user = identityService.createUserQuery().userId(applyUserId).singleResult();
			
			String to = user.getEmail();
			String name = user.getFirstName();
			
	
			String businessKey = execution.getProcessBusinessKey();
	
			String currentActivitiName = execution.getCurrentActivityName();
			
			//流程定义的id
			String procdefId = task.getProcessDefinitionId();
			
			RepositoryService repositoryService = execution.getEngineServices().getRepositoryService();
			
			ProcessDefinition processDefinition = repositoryService.getProcessDefinition(procdefId);
			
			String procDefName = processDefinition.getName();
	
			String subject = procDefName + " " + businessKey + " 需要您的审批";
			
			StringBuffer text = new StringBuffer();
			text.append(name).append(",").append("您好：")
				.append("<br/>")
				.append("&nbsp;&nbsp;")
				.append(procDefName)
				.append("：")
				.append(businessKey)
				.append(" ")
				.append("需要您的审批,")
				.append("流程当前节点：")
				.append(currentActivitiName)
				.append("。<br/>")
				.append("请登录系统进行操作。");

			MailUtil.sendMail(to, "", subject, text.toString());
			LOGGER.debug("sendMail, to: "+ to + " subject:" + subject);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			LOGGER.error(" message: " + e.getMessage() + " cause: " + e.getCause());
		} catch (MessagingException e) {
			e.printStackTrace();
			LOGGER.error(" message: " + e.getMessage() + " cause: " + e.getCause());
		}

	}

}
