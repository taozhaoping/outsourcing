package com.zh.web.action;

import java.util.List;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.spring.ProcessEngineFactoryBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.bean.User;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;
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
		List<FranchiseeBO> franchiseeBOList = franchiseeService.queryList(franchiseeBO, pager);
		this.franchiseeModel.setFranchiseeBOList(franchiseeBOList);
		return Action.SUCCESS;
	}

	public String editor() {
		LOGGER.debug("editor()");
		Franchisee franchisee = new Franchisee();
		//变更的基础信息
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
			//获取通讯录
			MailList mailList = new MailList();
			mailList.setFranchiseeId(franchiseeReult.getId());
			List<MailList> mailListList = mailListService.queryList(mailList);
			this.franchiseeModel.setMailListList(mailListList);
		} else {
			// 设置当前用户为流程发起人
			Integer userID = queryUserId();
			//设置创建者
			change.setOwner(userID);
			//状态
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
			
			this.franchiseeModel.setFranchisee(franchiseeBo.getFranchisee());
			this.franchiseeModel.setChange(franchiseeBo.getChange());
		}
		return Action.EDITOR;
	}

	public String save() {
		LOGGER.debug("save()");
		Franchisee franchisee = this.franchiseeModel.getFranchisee();
		Integer id = franchisee.getId();

		if (null != id && id > 0) {
			franchiseeService.update(franchisee);
			LOGGER.debug("update()...");
		} else {
			// 设置当前用户为流程发起人
			Integer userID = queryUserId();
			franchisee.setCreateUserId(userID);
			franchiseeService.insert(franchisee);
			LOGGER.debug("insert()...");
		}

		this.franchiseeModel.setFormId(franchisee.getId().toString());
		return Action.EDITOR_SUCCESS;
	}
	
	public String saveMailList()
	{
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
		mailList.setFranchiseeId(Integer.valueOf(formId));

		if (null != view && "delete".equals(view)) {
			mailList.setId(id);
			mailListService.delete(mailList);
		} else {
			mailListService.insert(mailList);
		}
		return "save";
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
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
