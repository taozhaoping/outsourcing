package com.zh.web.action;

import java.util.List;

import org.apache.avalon.framework.parameters.ParameterException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.base.model.bean.User;
import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;
import com.zh.web.model.FranchiseeRecordModel;
import com.zh.web.model.bean.Franchisee;
import com.zh.web.model.bean.FranchiseeRecord;
import com.zh.web.model.bean.FranchiseeRecordVW;
import com.zh.web.service.FranchiseeRecordService;
import com.zh.web.service.FranchiseeService;

public class FranchiseeRecordAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -930810974970472710L;

	private FranchiseeRecordModel franchiseeRecordModel = new FranchiseeRecordModel();

	private static Logger LOGGER = LoggerFactory
			.getLogger(FranchiseeRecordAction.class);

	@Autowired
	private FranchiseeService franchiseeService;
	
	@Autowired
	private FranchiseeRecordService franchiseeRecordService;

	public String execute() {

		/* 获取基本信息 */
		FranchiseeRecordVW franchiseeRecordVW = this.franchiseeRecordModel.getFranchiseeRecordVW();

		/* 获取当前登录用户 */
		User user = queryUser();
		franchiseeRecordVW.setCreateUserId(user.getId());
		Pager pager = this.franchiseeRecordModel.getPageInfo();
		Integer count = franchiseeRecordService.countVW(franchiseeRecordVW);
		pager.setTotalRow(count);
		List<FranchiseeRecordVW> franchiseeRecordVWList = franchiseeRecordService.queryVWList(
				franchiseeRecordVW, pager);
		this.franchiseeRecordModel.setFranchiseeRecordVWList(franchiseeRecordVWList);

		return Action.SUCCESS;
	}

	public String editor() {
		LOGGER.debug("editor()");

		String businessKey = this.franchiseeRecordModel.getFormId();
			Franchisee franchisee = new Franchisee();
			franchisee.setId(Integer.parseInt(businessKey));
		// technologicalProcess.setWorkuserid(queryUserId());

		// 获取基本信息
			Franchisee franchiseeReult = franchiseeService.query(franchisee);
		franchiseeRecordModel.setFranchisee(franchiseeReult);

		/* 获取联系记录 */
		FranchiseeRecord franchiseeRecord = new FranchiseeRecord();
		franchiseeRecord.setFranchiseeID(Integer.parseInt(businessKey));

		Pager pager = this.franchiseeRecordModel.getPageInfo();
		Integer count = franchiseeRecordService.count(franchiseeRecord);
		pager.setTotalRow(count);

		List<FranchiseeRecord> franchiseeRecordList = franchiseeRecordService.queryList(
				franchiseeRecord, pager);
		this.franchiseeRecordModel.setFranchiseeRecordList(franchiseeRecordList);
		return Action.EDITOR;
	}

	public String save() {
		LOGGER.debug("save()");
		Franchisee franchisee = this.franchiseeRecordModel.getFranchisee();
		Integer id = franchisee.getId();

		if (null != id && id > 0) {
			franchiseeService.update(franchisee);
			LOGGER.debug("update()...");
		} else {
			User user = queryUser();
			franchisee.setCreateUserId(user.getId());
			franchiseeService.insert(franchisee);
			LOGGER.debug("insert()...");
		}

		this.franchiseeRecordModel.setFormId(franchisee.getId().toString());
		return Action.EDITOR_SUCCESS;
	}

	/**
	 * 保存联系记录
	 * 
	 * @return
	 * @throws ParameterException
	 */
	public String saveFranchiseeRecord() throws ParameterException {
		FranchiseeRecord franchiseeRecord = this.franchiseeRecordModel
				.getFranchiseeRecord();
		String fromID = this.franchiseeRecordModel.getFormId();
		if (null == fromID || "".equals(fromID)) {
			throw new ProjectException("编号不允许为null");
		}
		franchiseeRecord.setFranchiseeID(Integer.valueOf(fromID));
		franchiseeRecordService.insert(franchiseeRecord);
		return "save";
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return franchiseeRecordModel;
	}

	public FranchiseeRecordModel getFranchiseeRecordModel() {
		return franchiseeRecordModel;
	}

	public void setFranchiseeRecordModel(FranchiseeRecordModel franchiseeRecordModel) {
		this.franchiseeRecordModel = franchiseeRecordModel;
	}

	public FranchiseeService getFranchiseeService() {
		return franchiseeService;
	}

	public void setFranchiseeService(FranchiseeService franchiseeService) {
		this.franchiseeService = franchiseeService;
	}

	public FranchiseeRecordService getFranchiseeRecordService() {
		return franchiseeRecordService;
	}

	public void setFranchiseeRecordService(FranchiseeRecordService franchiseeRecordService) {
		this.franchiseeRecordService = franchiseeRecordService;
	}
	
	

}
