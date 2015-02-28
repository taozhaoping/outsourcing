package com.zh.web.action;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.zh.base.model.bean.User;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;
import com.zh.web.model.FranchiseeModel;
import com.zh.web.model.bean.Franchisee;
import com.zh.web.model.bean.MailList;
import com.zh.web.service.FranchiseeService;
import com.zh.web.service.MailListService;

/**
 * 加盟商维护页面
 * @author taozhaoping 26078
 * @author mail taozhaoping@gmail.com
 */
public class FranchiseeMainAction extends BaseAction{

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

	public String execute() {
		/* 获取基本信息 */
		Franchisee franchisee = this.franchiseeModel.getFranchisee();

		//获取所有审批完成的加盟商数据
		franchisee.setStatus("完成");
		/* 获取当前登录用户 */
		
		//User user = queryUser();
		//franchisee.setCreateUserId(user.getId());
		Pager pager = this.franchiseeModel.getPageInfo();
		Integer count = franchiseeService.count(franchisee);
		pager.setTotalRow(count);
		List<Franchisee> franchiseeList = franchiseeService.queryList(
				franchisee, pager);
		this.franchiseeModel.setFranchiseeList(franchiseeList);
		return Action.SUCCESS;
	}

	public String editor() {
		LOGGER.debug("editor()");
		Franchisee franchisee = new Franchisee();
		String businessKey = this.franchiseeModel.getFormId();
		if (null != businessKey && Integer.parseInt(businessKey) > 0) {

			franchisee.setId(Integer.parseInt(businessKey));

			// 获取基本信息
			Franchisee franchiseeReult = franchiseeService.query(franchisee);
			franchiseeModel.setFranchisee(franchiseeReult);

			// 获取通讯录
			MailList mailList = new MailList();
			mailList.setFranchiseeId(franchiseeReult.getId());
			List<MailList> mailListList = mailListService.queryList(mailList);
			this.franchiseeModel.setMailListList(mailListList);
		} else {
			// 设置当前用户为流程发起人
			Integer userID = queryUserId();
			franchisee.setCreateUserId(userID);
			franchisee.setStatus("0");
			this.franchiseeModel.setFranchisee(franchisee);
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
