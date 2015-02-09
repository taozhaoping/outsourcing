package com.zh.web.action;

import java.util.List;

import org.apache.avalon.framework.parameters.ParameterException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.zh.core.base.action.Action;
import com.zh.core.base.action.BaseAction;
import com.zh.core.exception.ProjectException;
import com.zh.core.model.Pager;
import com.zh.web.model.FranchiseeRecordModel;
import com.zh.web.model.bean.Franchisee;
import com.zh.web.model.bean.FranchiseeRecord;
import com.zh.web.model.bean.FranchiseeRecordVW;
import com.zh.web.model.bean.MailList;
import com.zh.web.model.bean.TechnologicalProcess;
import com.zh.web.service.FranchiseeRecordService;
import com.zh.web.service.FranchiseeService;
import com.zh.web.service.MailListService;
import com.zh.web.service.TechnologicalProcessService;

public class QueryFranchiseeRecordAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 86822026221231807L;

	private FranchiseeRecordModel franchiseeRecordModel = new FranchiseeRecordModel();

	private static Logger LOGGER = LoggerFactory
			.getLogger(QueryFranchiseeRecordAction.class);

	@Autowired
	private FranchiseeService franchiseeService;

	@Autowired
	private FranchiseeRecordService franchiseeRecordService;

	@Autowired
	private MailListService mailListService;

	public String execute() {

		/* 获取基本信息 */
		FranchiseeRecordVW franchiseeRecordVW = this.franchiseeRecordModel
				.getFranchiseeRecordVW();

		Pager pager = this.franchiseeRecordModel.getPageInfo();
		Integer count = franchiseeRecordService.countVW(franchiseeRecordVW);
		pager.setTotalRow(count);
		List<FranchiseeRecordVW> franchiseeRecordVWList = franchiseeRecordService
				.queryVWList(franchiseeRecordVW, pager);
		this.franchiseeRecordModel
				.setFranchiseeRecordVWList(franchiseeRecordVWList);

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

		// 获取通讯录
		MailList mailList = new MailList();
		mailList.setFranchiseeId(franchiseeReult.getId());
		List<MailList> mailListList = mailListService.queryList(mailList);
		this.franchiseeRecordModel.setMailListList(mailListList);

		/* 获取联系记录 */
		FranchiseeRecord franchiseeRecord = new FranchiseeRecord();
		franchiseeRecord.setFranchiseeID(Integer.parseInt(businessKey));

		Pager pager = this.franchiseeRecordModel.getPageInfo();
		Integer count = franchiseeRecordService.count(franchiseeRecord);
		pager.setTotalRow(count);

		List<FranchiseeRecord> franchiseeRecordList = franchiseeRecordService
				.queryList(franchiseeRecord, pager);
		this.franchiseeRecordModel
				.setFranchiseeRecordList(franchiseeRecordList);
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
			// 设置当前用户为流程发起人
			franchiseeService.insert(franchisee);
			LOGGER.debug("insert()...");
		}

		this.franchiseeRecordModel.setFormId(franchisee.getId().toString());
		return Action.EDITOR_SUCCESS;
	}

	public String saveMailList()
	{
		LOGGER.debug("saveMailList()");
		String formId = this.franchiseeRecordModel.getFormId();
		Integer id = this.franchiseeRecordModel.getId();
		String view = this.franchiseeRecordModel.getView();
		if (null == formId || "".equals(formId)) {
			throw ProjectException
					.createException("当前的流程编号不允许为空！请先保存当前流程的基本信息");
		}
		if (null != view && (null == id || "".equals(id))) {
			throw ProjectException.createException("当前的活动编号不允许为空！");
		}
		MailList mailList = this.franchiseeRecordModel.getMailList();
		mailList.setFranchiseeId(Integer.valueOf(formId));

		if (null != view && "delete".equals(view)) {
			mailList.setId(id);
			mailListService.delete(mailList);
		} else {
			mailListService.insert(mailList);
		}
		return "save";
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

}
