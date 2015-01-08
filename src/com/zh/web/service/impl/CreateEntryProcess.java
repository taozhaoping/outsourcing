package com.zh.web.service.impl;

import java.util.Date;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.activiti.engine.identity.User;
import org.activiti.engine.repository.ProcessDefinition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.web.model.bean.EntryProcess;
import com.zh.web.model.bean.TechnologicalProcess;
import com.zh.web.service.EntryProcessService;
import com.zh.web.service.TechnologicalProcessService;

/***
 * 招聘流程结束后、自动创建入职流程
 * 
 * @author 21829
 * 
 */
@Component("createEntryProcess")
public class CreateEntryProcess implements TaskListener {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2979043532744288424L;
	
	/***
	 * 日志
	 */
	private static Logger LOGGER = LoggerFactory.getLogger(CreateEntryProcess.class);
	
	/**
	 * 招聘流程
	 */
	@Autowired
	private TechnologicalProcessService technologicalProcessService;
	
	/**
	 * 入职流程
	 */
	@Autowired
	private EntryProcessService entryProcessService;

	@Override
	public void notify(DelegateTask task) {
		LOGGER.debug("CreateEntryProcess notify(DelegateTask task)");
		
		DelegateExecution execution = task.getExecution();
		IdentityService identityService = execution.getEngineServices().getIdentityService();
		// 当前用户
		String applyUserId = task.getAssignee();
		
		User user = identityService.createUserQuery().userId(applyUserId).singleResult();
		
		String to = user.getEmail();
		String name = user.getFirstName();
		
		//业务的id
		String businessKey = execution.getProcessBusinessKey();

		String currentActivitiName = execution.getCurrentActivityName();
		
		//流程定义的id
		String procdefId = task.getProcessDefinitionId();
		
		RepositoryService repositoryService = execution.getEngineServices().getRepositoryService();
		
		ProcessDefinition processDefinition = repositoryService.getProcessDefinition(procdefId);
		
		String procDefName = processDefinition.getName();
		
		//招聘人员信息表
		TechnologicalProcess technologicalProcess = new TechnologicalProcess();
		technologicalProcess.setId(Integer.parseInt(businessKey));
		TechnologicalProcess retProcess = technologicalProcessService.query(technologicalProcess);
		String url = retProcess.getUrl();
		
		//入职人员 induction
		EntryProcess entryProcess = new EntryProcess();
		// 设置当前用户为流程发起人
		entryProcess.setWorkuserid(Integer.parseInt(applyUserId));
		entryProcess.setState("发起");
		
		if(null != url){
			entryProcess.setUrl(url.replace("recruitment", "induction"));
		}
		
		//姓名
		String retProcessName = retProcess.getName();
		if (null == retProcessName || retProcessName.isEmpty()) {
			entryProcess.setName(retProcessName);
		}

		//英文名
		String englishName = retProcess.getEnglishname();
		if (null == englishName || englishName.isEmpty()) {
			entryProcess.setEnglishname(englishName);
		}

		//国籍
		String nationality = retProcess.getNationality();
		if (null == nationality || nationality.isEmpty()) {
			entryProcess.setNationality(nationality);
		}

		//目前所在地(国家)
		String currentlocation = retProcess.getCurrentlocation();
		if (null == currentlocation || currentlocation.isEmpty()) {
			entryProcess.setCurrentlocation(currentlocation);
		}

		//出生年份
		String yearbirth = retProcess.getYearbirth();
		if (null == yearbirth || yearbirth.isEmpty()) {
			entryProcess.setYearbirth(yearbirth);
		}

		//生日
		Date birthday = retProcess.getBirthday();
		if (null == birthday) {
			entryProcess.setBirthday(birthday);
		}

		//合同种类
		String contracttype = retProcess.getContracttype();
		if (null == contracttype || contracttype.isEmpty()) {
			entryProcess.setContracttype(contracttype);
		}

		//合同有效期
		String contractdate = retProcess.getContractdate();
		if (null == contractdate || contractdate.isEmpty()) {
			entryProcess.setContractdate(contractdate);
		}

		//护照号
		String passportNO = retProcess.getPassportno();
		if (null == passportNO || passportNO.isEmpty()) {
			entryProcess.setPassportno(passportNO);
		}

		//护照有效期
		String passportDate = retProcess.getPassportnodate();
		if (null == passportDate || passportDate.isEmpty()) {
			entryProcess.setPassportnodate(passportDate);
		}

		//电子邮箱
		String mail = retProcess.getMail();
		if (null == mail || mail.isEmpty()) {
			entryProcess.setMail(mail);
		}
		entryProcessService.insert(entryProcess);
		
		LOGGER.debug("新建入职流程:"+entryProcess.getId());
	}

}
