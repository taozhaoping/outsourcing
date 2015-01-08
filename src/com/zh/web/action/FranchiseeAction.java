package com.zh.web.action;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.zh.base.model.bean.User;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.model.Pager;
import com.zh.web.model.FranchiseeModel;
import com.zh.web.model.bean.ContactRecord;
import com.zh.web.model.bean.ContactRecordVW;
import com.zh.web.model.bean.Franchisee;
import com.zh.web.model.bean.TechnologicalProcess;
import com.zh.web.service.FranchiseeService;

public class FranchiseeAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4069746645463359419L;

	private static Logger LOGGER = LoggerFactory
			.getLogger(FranchiseeAction.class);

	private FranchiseeModel franchiseeModel = new FranchiseeModel();

	@Autowired
	private FranchiseeService franchiseeService;

	public String execute() {
		/* 获取基本信息 */
		Franchisee franchisee = this.franchiseeModel.getFranchisee();

		/* 获取当前登录用户 */
		User user = queryUser();
		franchisee.setCreateUserId(user.getId());
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

		} else {
			// 设置当前用户为流程发起人
			Integer userID = queryUserId();
			franchisee.setCreateUserId(userID);
			franchisee.setStatus("0");
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

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return franchiseeModel;
	}

}
