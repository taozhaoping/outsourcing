<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@  page import="com.zh.base.util.JspUtil" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="getText('COM.OSFI.WINDOW.TITLE')" /></title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/theme.css">
<link rel="stylesheet" href="<%=path%>/css/font-awesome.css">
<link rel="stylesheet" href="<%=path%>/js/select2/select2.css">
<link rel="stylesheet"
	href="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.css">
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/js/jqPaginator.min.js"></script>
<!-- Demo page code -->
<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
</style>
<link href="<%=path%>/img/favicon_32.ico" rel="bookmark"
	type="image/x-icon" />
<link href="<%=path%>/img/favicon_32.ico" rel="icon" type="image/x-icon" />
<link href="<%=path%>/img/favicon_32.ico" rel="shortcut icon"
	type="image/x-icon" />
<link rel="stylesheet" href="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.css"/>
</head>
<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="">
<jsp:useBean id="userName" class="com.zh.base.util.JspUtil" scope="session"></jsp:useBean>
	<!--<![endif]-->
	<%@ include file="/pages/common/titleWithNav.jsp"%>
	<%@ include file="/pages/common/sidebarWithNav.jsp"%>

	<div class="content">
		<div class="header">
			<div class="stats">
				<p class="stat">
					<span class="number">53</span>tickets
				</p>
				<p class="stat">
					<span class="number"><s:property value="#session.taskSize" /></span>tasks
				</p>
				<p class="stat">
					<span class="number">15</span>waiting
				</p>
			</div>

			<h1 class="page-title" id="menu2Name">&nbsp;</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="<%=path%>/home/main.jspa">主页</a> <span
				class="divider">/</span></li>
			<li><span class="active" id="navigation1"></span></li>
		</ul>

		<div class="container-fluid">

			<div class="row-fluid">
				<div class="btn-toolbar">
					<s:if test='hasApprove=="1" || hasSubmitAuth=="1"'>
						<button id="formButton" class="btn btn-primary" type="button">
							<i class="icon-save"></i> 保存
						</button>
						<input type="hidden" id="hasEditAuth" value="1">
					</s:if>
					<s:else>
						<button class="btn" type="button" disabled="disabled">
							<i class="icon-save"></i> 保存
						</button>
						<input type="hidden" id="hasEditAuth" value="0">
					</s:else>

					<div class="pull-right">
						<s:if test='%{hasApprove!=null && hasApprove=="1"}'>
							<button class="btn" type="button" id="approveBtn"
								data-toggle="modal" data-target="#approveConfirm">
								<i class="icon-ok"></i> 批准
							</button>

							<button class="btn" type="button" id="rejectBtn"
								data-toggle="modal" data-target="#rejectConfirm">
								<i class="icon-ok"></i> 拒绝
							</button>
						</s:if>

						<s:if test='%{hasSubmitAuth!=null && hasSubmitAuth=="1"}'>
							<button class="btn" type="button" id="startBtn"
								data-toggle="modal" data-target="#startConfirm">
								<i class="icon-ok"></i> 发起
							</button>
						</s:if>
					</div>
				</div>
			
				<!-- 
				<div class="btn-toolbar">
					<button id="formButton" class="btn btn-primary" type="button">
						<i class="icon-save"></i> 保存
					</button>
					<a class="btn" id="backList" href="">
						返回</a>
					<input type="hidden" id="hasEditAuth" value="1">
				</div>
				 -->
				<input type="hidden" id="tabID" name="tabID" value="${tabID}">
				<input type="hidden" id="formChanged" name="formChanged" value="0" />
				<s:set name="ProcessId"
					value="franchisee.id!=null&&franchisee.id!=''" />
				<div class="well">
					<ul class="nav nav-tabs">
						<li><a id="homeButt" href="#home" data-toggle="tab">基本信息</a></li>
						<s:if test="#ProcessId">
							<li><a id="maillistButt" href="#maillist"
								data-toggle="tab">通讯录</a></li>
						</s:if>
						<li><a id="workflowTabButt" href="#workflowTab" data-toggle="tab">工作流</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="home">
							<form id="editForm" class="form-horizontal"
								action="${menu2Id}!save.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}"> <input
									type="hidden" name="menu2Id" value="${menu2Id}">
								<input type="hidden" name="spaceId" value="${spaceId}">
								<input type="hidden" name="franchisee.id" value="${franchisee.id}">
								<input type="hidden" name="franchisee.status" value="${franchisee.status}">
								<input type="hidden" name="franchisee.createUserId" value="${franchisee.createUserId}">
								<input type="hidden" name="change.id" value="${change.id}">
								<input type="hidden" name="formId" value="${change.id}" />
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputId">流程编号：</label>
											<div class="controls">
												<input type="text" maxlength="15" disabled="disabled"
													id="inputId"
													value="${change.changeNumber}" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="franchiseeName">名称：</label>
											<div class="controls">
												<input type="text" id="franchiseeName"
													name="franchisee.name"
													value="${franchisee.name}" 
													placeholder="描述" class="input-large">
											</div>
										</div>
									</div>

								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="franchiseeDescr">描述：</label>
											<div class="controls">
												<input type="text" data-required="true" placeholder="描述"
													maxlength="15" id="franchiseeDescr" name="franchisee.descr"
													value="${franchisee.descr}" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="franchiseeAddress">地址：</label>
											<div class="controls">
												<input type="text" id="franchiseeAddress"
													name="franchisee.address"
													value="${franchisee.address}" data-required="true"
													placeholder="地址" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="contracttype">合同种类：</label>
											<div class="controls">
												<select id="contracttype" class="input-large"
													 placeholder="合同种类"
													name="franchisee.contractType">
													<option value="">请选择</option>
													<option value="A">A类</option>
													<option value="B">B类</option>
													<option value="C">C类</option>
												</select>
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="changeOwner">创建人：</label>
											<div class="controls">
												<input type="text" id="changeOwner"
													name="change.ownerName" disabled="disabled"
													value="${change.ownerName}"
													placeholder="创建人" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputBirthday">合同开始时间：</label>
											<div class="controls">
												<input type="text" size="15" id="inputBirthday"
													name="franchisee.contractStartDate"
													value="${franchisee.contractStartDate}"
													placeholder="合同开始时间" readonly
													class="form_datetime input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputBirthday">合同结束时间：</label>
											<div class="controls">
												<input type="text" size="15" id="inputBirthday"
													name="franchisee.contractEndDate"
													value="${franchisee.contractEndDate}"
													placeholder="合同结束时间" readonly
													class="form_datetime input-large">
											</div>
										</div>
									</div>
								</dir>
								
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="changeStatus">状态：</label>
											<div class="controls">
												<input type="text" id="changeStatus"
												name="change.status" readonly
												value="${change.status}"
												placeholder="状态" class="input-large">
												<!-- 
												<select id="franchiseeStatus" class="input-large"  disabled="disabled"
													 placeholder="状态" readonly value="${franchisee.status}"
													name="franchisee.status">
													<option value="0">发起</option>
													<option value="1"></option>
													<option value="2"></option>
												</select>
												 -->
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											
										</div>
									</div>
								</dir>
							</form>
						</div>
						<!-- 通讯录 -->
						<div class="tab-pane fade" id="maillist">
							<form id="mailListForm" class="form-horizontal"
								action="${menu2Id}!saveMailList.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}" /> 
								<input type="hidden" name="menu2Id" value="${menu2Id}" /> 
								<input type="hidden" name="spaceId" value="${spaceId}">
								<input type="hidden" name="formId" value="${change.id}" />
								<input type="hidden" name="franchisee.id" value="${franchisee.id}">
								<input type="hidden" name="tabID" value="maillistButt" />
								<input type="hidden" id="mailListName" name="mailList.name" value="" />
								<input type="hidden" id="mailListPhone" name="mailList.phone" value="" />
								<input type="hidden" name="change.id" value="${change.id}">
								<button class="btn btn-small btn-primary" type="button"
								data-toggle="modal" data-target="#popupfirm">添加通讯录</button>
							</form>
							<table class="table">
								<thead>
									<tr>
										<th style="width: 32px;">序号</th>
										<th style="width: 240px;">姓名</th>
										<th style="width: 200px;">号码</th>
										<th style="width: 240px;">创建时间</th>
										<th>操作</th>
									</tr>
								</thead>
								
								<tbody id="maillistSearch">
									<tr>
										<!-- 通讯录 -->
										<s:iterator value="mailListList" var="tp" status="index">
										<tr>
											<td><s:property value="#index.index+1" /></td>
											<td><s:property value="#tp.name" /></td>
											<td>
												<s:property value="#tp.phone" />
											</td>
											<td><s:property value="#tp.createdate" /></td>
											<td>
												<a href="${menu2Id}!saveMailList.jspa?id=<s:property value='#tp.id'/>&formId=${change.id}&view=delete&menuId=${menuId}&menu2Id=${menu2Id}&spaceId=${spaceId}&tabID=maillistButt"><i
												class="icon-remove"></i></a>
										</td>
										</tr>
									</s:iterator>
									</tr>
									
								</tbody>
								
							</table>
						</div>
						
						<!-- 工作流 -->
						<div class="tab-pane fade" id="workflowTab">
							<!-- 如果发起了则显示工作 -->
							<s:if
								test="%{change.status != null && change.status != ''&& change.status != '发起' && change.status != '结束'}">
								<img alt="流程没有发起或已结束"
									src="${menu2Id}!loadTraceImg.jspa?menuId=workflow&menu2Id=applyfranchisee&processInstanceId=${change.workflowId}"
									id="workflowShowPic">
							</s:if>
							<s:else>
								<span>没有匹配的工作流(没有发起或已结束)</span>
							</s:else>
						</div>
						
					</div>
				</div>
			</div>

			<!-- 创建工作流 -->
			<form action="${menu2Id}!createWorkflow.jspa" method="post" id="createWF">
				<input type="hidden" name="formId" id="cwf_formId" value="${change.id}">
				<input type="hidden" name="assign" id="cwf_assign"> 
				<input type="hidden" name="menu2Id" value="${menu2Id}">
				<input type="hidden" name="menuId" value="${menuId}">
				<input type="hidden" name="spaceId" value="${spaceId}">
			</form>

			<!-- 批准工作流 -->
			<form action="${menu2Id}!approveWorkflow.jspa" method="post" id="approveWF">
				<input type="hidden" name="formId" id="awf_formId" value="${change.id}"> 
				<input type="hidden" name="change.workflowId" id="awf_formId" value="${change.workflowId}">
				<input type="hidden" name="change.taskId" id="taskId" value="${change.taskId}"> 
				<input type="hidden" name="assign" id="awf_assign"> 
				<input type="hidden" name="assignFlag" id="awf_assignFlag"> 
				<input type="hidden" name="menu2Id" value="${menu2Id}"> 
				<input type="hidden" name="menuId" value="${menuId}">
				<input type="hidden" name="spaceId" value="${spaceId}">
			</form>

		</div>
	</div>

	<div class="hide">
		<a id="Ejectfirm" name="Ejectfirm" href="#forMchangefirm"
			data-toggle="modal"></a>
	</div>
	
	<!-- 添加通讯录 -->
	<div class="modal small hide fade" id="popupfirm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="startModalLabel1">人员添加</h3>
		</div>
		<div class="modal-body">
				<dir class="row">
					<div class="span3">
						<div class="control-group">
							<label class="control-label" for="popupName">姓名：</label>
							<div class="controls">
								<input type="text" id="popupName"
								placeholder="姓名" class="input-large">
							</div>
						</div>
					</div>

				</dir>
				<dir class="row">
					<div class="span3">
						<div class="control-group">
							<label class="control-label" for="popupPhone">号码：</label>
							<div class="controls">
								<input type="text" id="popupPhone"
								placeholder="号码" class="input-large">
							</div>
						</div>
					</div>

				</dir>
		</div>
		<div class="modal-footer">
			<button class="btn btn-danger" data-dismiss="modal"
				id="popupBtnConfirm">确认</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		</div>
	</div>

	<!-- 发起流程 -->
	<div class="modal small hide fade" id="startConfirm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="startModalLabel">流程发起</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<p class="text-error" id="startConfirmMsg"></p>
			</div>
			<div class="control-group">
				<label class="control-label pull-left" for="modalAssign">审批人：</label>
				<select id="modalAssign" class="input-large pull-right">
					<option value=""></option>
					<s:iterator value="userList" var="user" status="index">
					<option value="${user.loginName}">${user.name}(${user.loginName})</option>
					</s:iterator>
				</select>
			</div>
		</div>
		<div class="modal-footer">
			<button class="btn btn-danger" data-dismiss="modal"
				id="startBtnConfirm">确认</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		</div>
	</div>

	<!-- 批准流程 -->
	<div class="modal small hide fade" id="approveConfirm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="approveModalLabel">流程审批</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<p class="text-error" id="approveConfirmMsg"></p>
			</div>
			<div class="control-group">
				<label class="control-label pull-left" for="modalNextAssign">审批人：</label>
				<select id="modalNextAssign" class="input-large pull-right">
					<option value=""></option>
					<s:iterator value="userList" var="user" status="index">
					<option value="${user.loginName}">${user.name}(${user.loginName})</option>
					</s:iterator>
				</select>
			</div>

		</div>
		<div class="modal-footer">
			<button class="btn btn-danger" data-dismiss="modal"
				id="approveBtnConfirm">确认</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		</div>
	</div>
	
	<!-- 拒绝流程 -->
	<div class="modal small hide fade" id="rejectConfirm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="approveModalLabel">流程审批</h3>
		</div>
		<div class="modal-body">
			<div class="control-group">
				<p class="text-error" id="approveConfirmMsg"></p>
			</div>
			<div class="control-group">
				<p class="error-text">
					<i class="icon-warning-sign modal-icon"></i>您确认拒绝流程吗?
				</p>
			</div>

		</div>
		<div class="modal-footer">
			<button class="btn btn-danger" data-dismiss="modal"
				id="rejectBtnConfirm">确认</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		</div>
	</div>

	<div class="modal small hide fade" id="forMchangefirm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">警告</h3>
		</div>
		<div class="modal-body">
			<p class="error-text">
				<i class="icon-warning-sign modal-icon"></i>当前页面已经修改过,请先保存."确认" 保存
				"取消" 不保存
			</p>
		</div>
		<div class="modal-footer">
			<button class="btn btn-danger" data-dismiss="modal"
				id="formChangefirmBtn">确认</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		</div>
	</div>

	<%@ include file="/pages/common/footer.jsp"%>
	<script src="<%=path%>/js/bootstrap.js"></script>
	<script src="<%=path%>/js/collapsePulg.js"></script>
	<script src="<%=path%>/js/common.js"></script>
	<script src="<%=path%>/js/jquery-validate.js"></script>
	<script src="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.js"></script>
	<script src="<%=path%>/js/json2.js"></script>
	<script src="<%=path%>/js/select2/select2.js"></script>
	<script src="<%=path%>/js/select2/select2_locale_zh-CN.js"></script>
	<script
		src="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		var id = '${menuId}';
		var menuId = '${menu2Id}';
		var spaceId = '${spaceId}';
		var row_count = 0;
		var url = $("#" + menuId).attr('url');
		var headText = $("#" + menuId).text();
		var fromId = '${franchisee.id}';
		$("#navigation1").text(headText);
		//是否具有编辑权限
		var hasEdit = $("#hasEditAuth").val();
		
		
		var totalPage = ${pageInfo.totalPage};
		var totalRow = ${pageInfo.totalRow};
		var pageSize = ${pageInfo.pageSize};
		var curPage = ${pageInfo.curPage};

		var localObj = window.location;
		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol + "//" + localObj.host + "/"
				+ contextPath;

		//基本信息
		if (hasEdit == "1") {
			$("select").select2();
		} else {
			$(".container-fluid input").attr("disabled", "disabled");
			$(".container-fluid select").attr("disabled", "disabled");
			$(".container-fluid button").attr("disabled", "disabled");
			
		}
		
		$("#contracttype").val("${franchisee.contractType}").trigger("change");
		
		$("#franchiseeStatus").prop("disabled", true);
		
		if (fromId != null && fromId !='')
		{
			//判断表单是否修改过
			$("form :input").change(function() {
				$("#formChanged").val("1");
			});
	
			//所有时间控件变更
			$(".form_datetime").change(function() {
				$("#formChanged").val("1");
			});
	
			//所有select控件变更
			$("tbody select").change(function() {
				$("#formChanged").val("1");
			});
			
			//tab页签添加事件
			$("li a[data-toggle='tab']").click(function() {
				ischangeForm(this.id);
			});
		}
		
		//进入指定的tbs
		var tabID = "${tabID}";
		if (null != tabID && "" != tabID) {
			$("#" + tabID).parent().addClass("active");
			$("#" + tabID.substring(0, tabID.length - 4)).removeClass("fade")
					.addClass("active");
		} else {
			tabID = "homeButt";
			$("#tabID").val("homeButt");
			$("#homeButt").parent().addClass("active");
			$("#home").removeClass("fade").addClass("active");
		}
		
		//提交按钮
		$("#formButton").click(function() {
			currTab = $("#tabID").val();
			saveForm();
		});

		$("#formChangefirmBtn").click(function() {
			saveForm();
		});
		
		$("#popupBtnConfirm").click(function(x) {
				var _name = $("#popupName").val();
				var _phone = $("#popupPhone").val();
				name = $.trim(_name);
				phone = $.trim(_phone);
				if (name == null || phone == "" || phone == null || phone == "") {
					return;
				} else {
					$("#mailListName").val(name);
					$("#mailListPhone").val(phone);
					$("#mailListForm").submit();
				}
		});

		//当前tbs
		var currTab = tabID;

		//判读当前tab，需要保存那个form
		function saveForm() {
			var action;
			action = $("#editForm").attr("action");
			setTabID("editForm", action);
			//validate = $('#editForm').validate();
			$("#editForm").submit();
		}

		/*判断当前form是否变更*/
		var entryProcessId = "${technologicalProcess.id}";
		function ischangeForm(id) {
			//获取当前需要保存的tabid
			currTab = $("#tabID").val();
			//设置新的tab
			$("#tabID").val(id);
			//判断是否变更过
			if ("1" == $("#formChanged").val()) {
				$("#Ejectfirm").click();
				$("#formChanged").val("0");
			}
		}

		function setTabID(name,action) {
			var index=action.indexOf("?tabID=");
			actionName=action;
			if(  index > 0 )
			{
				actionName = action.substring(0,index);
			}
			$("#" + name).attr("action", actionName + "?tabID=" + $("#tabID").val());	
		}
		
		//批准选择，用户选择框打开
		$('#approveConfirm').on('show.bs.modal', function(x) {
			// 执行一些动作...
			//selectUsers("modalNextAssign",'assign');
			//审核状态
			var auditRet = auditStatus();
			//存在必填没有填写
			if (auditRet.length > 0) {
				$("#approveBtnConfirm").attr("disabled", "disabled");
				$("#approveBtnConfirm").removeClass("btn-danger");
				$("#approveConfirmMsg").html("缺少下列必填字段：" + auditRet);

			}
		});
		
		//发起按钮确认
		$("#startBtnConfirm").click(function(x) {
			var assign = $("#modalAssign").val();
			assign = $.trim(assign);
			if (assign == null || assign == "") {
				return;
			} else {
				$("#cwf_assign").val(assign);
				$("#createWF").submit();
			}
		});

		//批准按钮确认
		$("#approveBtnConfirm").click(function(x) {
			var assign = $("#modalNextAssign").val();
			assign = $.trim(assign);
			if (assign == null || assign == "") {
				return;
			} else {
				$("#awf_assign").val(assign);
				$("#awf_assignFlag").val("1");
				$("#approveWF").submit();
			}
		});

		//拒绝按钮确认
		$("#rejectBtnConfirm").click(function(x) {
			$("#awf_assignFlag").val("0");
			$("#approveWF").submit();
		});

		/**
		 * 审核当前的必填字段是否填写
		 * 
		 */
		function auditStatus() {
			var curState = "${change.status}";
			var formId = "${change.id}";
			var auditRet = new Array();

			$.ajax({
				type : "POST", //访问WebService使用Post方式请求
				async:false,//同步操作
				url : basePath + "/workflow/applyfranchisee!auditRelease.jspa", //调用WebService的地址和方法名称组合 ---- WsURL/方法名
				data : {state:curState, formId:formId}, //这里是要传递的参数，格式为 data: "{paraName:paraValue}",下面将会看到       
				dataType : 'json', //WebService 会返回Json类型
				traditional : false, //不要序列化参数
				error : function(err, textStatus) {
					//alert("error: " + err + " textStatus: " + textStatus);
				},
				success : function(result) {//回调函数，result，返回值
					//alert(result);
					auditRet = result;
				}
			});
			
			return auditRet;
		}
		
	</script>
</body>
</html>