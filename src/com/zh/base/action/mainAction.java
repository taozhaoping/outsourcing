package com.zh.base.action;

import java.util.ArrayList;
import java.util.List;

import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.MainModel;
import com.zh.base.model.bean.Menu;
import com.zh.base.model.bean.Notice;
import com.zh.base.model.bean.Role;
import com.zh.base.model.bean.User;
import com.zh.base.service.NoticeService;
import com.zh.base.service.RoleService;
import com.zh.base.service.UserInfoService;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;
import com.zh.core.model.VariableUtil;
import com.zh.core.util.BCrypt;
import com.zh.core.util.JSONUtil;
import com.zh.web.model.bean.TechnologicalProcess;
import com.zh.web.service.TechnologicalProcessService;

public class mainAction extends BaseAction {

	private MainModel mainModel;
	
	private static Logger LOGGER = LoggerFactory.getLogger(mainAction.class); 
	
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	protected TaskService taskService;
	
	@Autowired
	private NoticeService noticeService;

	//private String language;

	@Autowired
	private TechnologicalProcessService technologicalProcessService;
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String execute() {
		LOGGER.debug("execute()");
//		//设置当前语言
//		//this.setLanguage(this.getLocale().toString());
		
		//获取当前登录用户信息
		User user = (User) this.getSession().getAttribute(VariableUtil.SESSION_KEY);
		
//		// 获取员工信息
//		mainService.initEmployeeInfo(mainModel);
//
//		// 获取公司信息
//		mainService.initEnterprise(mainModel);
//
		// 获取角色信息和菜单信息
		Role role = new Role();
		role.setId(Integer.valueOf(user.getRoleId()));
		Role roleReult = roleService.queryAuthoritiesToMenu(role);
		this.mainModel.setRole(roleReult);
//		
		//保存用户menu菜单中的action权限到session，用于过滤器的验证
		setAuthoritySession();
//		
//		//保存用户信息到session
//		this.getSession().setAttribute(VariableUtil.EMPLOYEE, mainModel.getEmployee());
		String userName = user.getLoginName();
		//需要认领的任务
		List<Task> tasks = taskService.createTaskQuery().taskCandidateUser(userName).list();
		if(tasks.size() > 0){
			for(Task task : tasks){
				taskService.claim(task.getId(), userName);
			}
		}
		//当前用户待处理的任务
		List<Task> taskList = taskService.createTaskQuery().taskAssignee(userName).list();
		
		List<TechnologicalProcess> technologicalProcessList = new ArrayList<TechnologicalProcess>();
		
		TechnologicalProcess technologicalProcess = new TechnologicalProcess();
		for(Task task : taskList){
			String processInstanceId = task.getProcessInstanceId();
			String taskId = task.getId();
			
			
			
			technologicalProcess.setWorkflowid(processInstanceId);
			technologicalProcess.setTaskId(taskId);
			
			technologicalProcessList.addAll(technologicalProcessService.queryList(technologicalProcess));
			
		}
		
		//任务数量
		int taskNumber = technologicalProcessList.size();
		
		this.mainModel.setTaskNumber(taskNumber);
		
		if(taskNumber > 5){
			technologicalProcessList = technologicalProcessList.subList(0, 5);
		}
		
		this.mainModel.setTechnologicalProcessList(technologicalProcessList);
		
		//系统公告
		Notice notice = new Notice();
		Pager page = this.getMainModel().getPageInfo();
		//Integer size = noticeService.count(notice);
		page.setPageSize(5);
		//page.setTotalRow(size);
		List<Notice> noticeList = noticeService.queryList(notice, page);
		this.getMainModel().setNoticeList(noticeList);
		return Action.SUCCESS;
	}
	
	/**
	 * 查看系统公告
	 * @return
	 */
	public String queryNotice()
	{
		Integer id = this.getMainModel().getId();
		if(null == id || "".equals(id.toString()))
		{
			return Action.SUCCESS;
		}
		Notice notice = new Notice();
		notice.setId(id);
		Notice reult = noticeService.query(notice);
		if(null ==reult)
		{
			return Action.SUCCESS;
		}
		this.getMainModel().setNotice(reult);
		return "notice";
	}
	
	public String initPwd() {
		LOGGER.debug("initPwd()");
		mainModel.setUser((User) this.getSession().getAttribute(
				VariableUtil.SESSION_KEY));
		mainModel.getUser().setUserPassword(null);
		mainModel.setReultObject(JSONUtil.bean2json(mainModel.getUser()));
		return "updatePwd";
	}
	
	public String updatepwd() {
		LOGGER.debug("updatepwd()");
		String password = mainModel.getNewPassWord();
		if(null == password)
		{
			throw new ProjectException("密码不允许为空");
		}
		User userInfo = new User();
		userInfo.setId(mainModel.getId());
		userInfo.setUserPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
		userInfoService.update(userInfo);
		return Action.RETURN_JSON;
	}


	private void setAuthoritySession(){
		LOGGER.debug("setAuthoritySession()");
		ArrayList<String> list = new ArrayList<String>();
		List<Menu> menuList = mainModel.getRole().getMenuList();
		for (Menu menu : menuList) {
			Integer parentid = menu.getParentid();
			if(parentid.equals(0))
			{
				List<Menu> mList = menu.getMenuList();
				for (Menu menu2 : mList) {
					list.add(menu2.getAction());
				}
			}
			list.add(menu.getAction());
		}
		this.getSession().setAttribute(VariableUtil.AUTHORITY, list);
	}
	
	public String rightExecute()
	{
		//mainModel.setEmployee((EmployeeInfo)this.getSession().getAttribute(VariableUtil.EMPLOYEE));

		return "right";
	}
	
	/**
	 * 获取配置参数中的属性
	 */
	@SuppressWarnings("unused")
	private void getSystem(){
		
	}

	public String updateExecute() {

		return "updatePassword";
	}

	public Object getModel() {
		if (null == mainModel) {
			mainModel = new MainModel();
		}
		return mainModel;
	}

	public MainModel getMainModel() {
		return mainModel;
	}

	public void setMainModel(MainModel mainModel) {
		this.mainModel = mainModel;
	}

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

}
