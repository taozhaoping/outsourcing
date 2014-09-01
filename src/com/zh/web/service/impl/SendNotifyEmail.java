package com.zh.web.service.impl;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import org.activiti.engine.IdentityService;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.activiti.engine.identity.User;
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
		DelegateExecution execution = task.getExecution();
		IdentityService identityService = execution.getEngineServices()
				.getIdentityService();
		// 当前用户
		String applyUserId = task.getAssignee();
		User user = identityService.createUserQuery().userId(applyUserId).singleResult();
		
		String to = user.getEmail();
		String name = user.getFirstName();

		String businessKey = execution.getProcessBusinessKey();

		String currentActivitiName = execution.getCurrentActivityName();

		String subject = currentActivitiName + " " + businessKey + " 需要您的审批";

		try {
			MailUtil.sendMail(to, "", subject, name + "你好：<br/>   " + subject);
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
