package com.zh.web.service.impl;

import java.util.Date;
import java.util.List;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zh.base.model.bean.User;
import com.zh.base.service.UserInfoService;
import com.zh.web.model.bean.Certificates;
import com.zh.web.model.bean.EntryProcess;
import com.zh.web.model.bean.FileInfo;
import com.zh.web.model.bean.Flight;
import com.zh.web.model.bean.TechnologicalProcess;
import com.zh.web.service.CertificatesService;
import com.zh.web.service.EntryProcessService;
import com.zh.web.service.FileInfoService;
import com.zh.web.service.FlightService;
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
	
	/**
	 * 用户服务
	 */
	@Autowired
	private UserInfoService userInfoService;
	
	
	/**
	 * 航班信息
	 */
	@Autowired
	private FlightService flightService;
	
	/**
	 * 证件信息
	 */
	@Autowired
	private CertificatesService certificatesService;
	
	/**
	 * 附件信息
	 */
	@Autowired
	private FileInfoService fileInfoService;

	public void notify(DelegateTask task) {
		LOGGER.debug("CreateEntryProcess notify(DelegateTask task)");
		
		DelegateExecution execution = task.getExecution();
		//IdentityService identityService = execution.getEngineServices().getIdentityService();
		// 当前用户
		String loginName = task.getAssignee();
		/*
		User user = identityService.createUserQuery().userId(applyUserId).singleResult();
		String to = user.getEmail();
		String name = user.getFirstName();
		*/
		
		//当前审批的用户
		User user = new User();
		user.setLoginName(loginName);
		
		user = userInfoService.query(user);
		//用户的id
		Integer applyUserId = user.getId();
		
		//业务的id
		String businessKey = execution.getProcessBusinessKey();
		/*
		String currentActivitiName = execution.getCurrentActivityName();
		
		//流程定义的id
		String procdefId = task.getProcessDefinitionId();
		
		RepositoryService repositoryService = execution.getEngineServices().getRepositoryService();
		
		ProcessDefinition processDefinition = repositoryService.getProcessDefinition(procdefId);
		
		String procDefName = processDefinition.getName();*/
		
		//表单id
		Integer technologicalprocessId = Integer.parseInt(businessKey);
		//招聘人员信息表
		TechnologicalProcess technologicalProcess = new TechnologicalProcess();
		technologicalProcess.setId(technologicalprocessId);
		TechnologicalProcess retProcess = technologicalProcessService.query(technologicalProcess);
		String url = retProcess.getUrl();
		
		//入职人员 induction
		EntryProcess entryProcess = new EntryProcess();
		// 设置当前用户为流程发起人
		entryProcess.setWorkuserid(applyUserId);
		entryProcess.setState("发起");
		
		if(null != url){
			entryProcess.setUrl(url.replace("recruitment", "induction"));
		}
		
		//姓名
		String retProcessName = retProcess.getName();
		if (null != retProcessName && ! retProcessName.isEmpty()) {
			entryProcess.setName(retProcessName);
		}

		//英文名
		String englishName = retProcess.getEnglishname();
		if (null != englishName && ! englishName.isEmpty()) {
			entryProcess.setEnglishname(englishName);
		}

		//国籍
		String nationality = retProcess.getNationality();
		if (null != nationality && ! nationality.isEmpty()) {
			entryProcess.setNationality(nationality);
		}

		//目前所在地(国家)
		String currentlocation = retProcess.getCurrentlocation();
		if (null != currentlocation && ! currentlocation.isEmpty()) {
			entryProcess.setCurrentlocation(currentlocation);
		}

		//出生年份
		String yearbirth = retProcess.getYearbirth();
		if (null != yearbirth && ! yearbirth.isEmpty()) {
			entryProcess.setYearbirth(yearbirth);
		}

		//生日
		Date birthday = retProcess.getBirthday();
		if (null != birthday) {
			entryProcess.setBirthday(birthday);
		}

		//合同种类
		String contracttype = retProcess.getContracttype();
		if (null != contracttype && ! contracttype.isEmpty()) {
			entryProcess.setContracttype(contracttype);
		}

		//合同有效期
		String contractdate = retProcess.getContractdate();
		if (null != contractdate && ! contractdate.isEmpty()) {
			entryProcess.setContractdate(contractdate);
		}

		//护照号
		String passportNO = retProcess.getPassportno();
		if (null != passportNO && ! passportNO.isEmpty()) {
			entryProcess.setPassportno(passportNO);
		}

		//护照有效期
		String passportDate = retProcess.getPassportnodate();
		if (null != passportDate && ! passportDate.isEmpty()) {
			entryProcess.setPassportnodate(passportDate);
		}

		//电子邮箱
		String mail = retProcess.getMail();
		if (null != mail && ! mail.isEmpty()) {
			entryProcess.setMail(mail);
		}
		entryProcessService.insert(entryProcess);
		//入职表单的id
		Integer entryProcessId = entryProcess.getId();
		LOGGER.debug("新建入职流程:"+entryProcessId);
		
		/**
		 * 航班信息
		 */
		Flight flight = new Flight();
		flight.setTechnologicalprocessid(technologicalprocessId);
		flight = flightService.query(flight);
		//入职流程插入航班信息
		flight.setTechnologicalprocessid(entryProcessId);
		flightService.insert(flight);
		
		/**
		 * 证件
		 */
		Certificates certificates = new Certificates();
		certificates.setTechnologicalprocessid(technologicalprocessId);
		List<Certificates> certificatesList = certificatesService.queryList(certificates);
		for(Certificates cf : certificatesList){
			Certificates tempCf = new Certificates();
			//设置表单id
			tempCf.setTechnologicalprocessid(entryProcessId);
			//类型
			String type = cf.getType();
			if(null != type && !type.isEmpty()){
				tempCf.setType(type);
			}
			//编号
			String serialNumber = cf.getSerialNumber();
			if(null != serialNumber && !serialNumber.isEmpty()){
				tempCf.setSerialNumber(serialNumber);
			}
			//办理日期
			Date handledate = cf.getHandledate();
			if(null != handledate){
				tempCf.setHandledate(handledate);
			}
			//领取日期
			Date receivedate = cf.getReceivedate();
			if(null != receivedate){
				tempCf.setReceivedate(receivedate);
			}
			//有效日期
			Date validstartdate = cf.getValidstartdate();
			if(null != validstartdate){
				tempCf.setValidstartdate(validstartdate);
			}
			//结束日期
			Date validenddate = cf.getValidenddate();
			if(null != validenddate){
				tempCf.setValidenddate(validenddate);
			}
			certificatesService.insert(tempCf);
		}
		
		/**
		 * 附件
		 */
		FileInfo fileInfo = new FileInfo();
		fileInfo.setTechnologicalprocessid(technologicalprocessId);
		List<FileInfo> fileInfoList = fileInfoService.queryList(fileInfo);
		for(FileInfo fi : fileInfoList){
			FileInfo tempFi = new FileInfo();
			tempFi.setTechnologicalprocessid(entryProcessId);
			
			String name = fi.getName();
			if(null != name && !name.isEmpty()){
				tempFi.setName(name);
			}
			
			String nameType = fi.getNametype();
			if(null != nameType && !nameType.isEmpty()){
				tempFi.setNametype(nameType);
			}
			
			String type = fi.getType();
			if(null != type && !type.isEmpty()){
				tempFi.setType(type);
			}
			
			String descr = fi.getDescr();
			if(null != descr && !descr.isEmpty()){
				tempFi.setDescr(descr);
			}
			
			//fileInfoService.insert(tempFi);
		}
	}
}
