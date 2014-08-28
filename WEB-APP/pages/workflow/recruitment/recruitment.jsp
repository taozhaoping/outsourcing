<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息管理平台</title>
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
</head>
<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="">
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
						<s:if
							test='%{hasApprove!=null && hasApprove=="1"}'>
							<button class="btn" type="button" id="approveBtn"
								data-toggle="modal" data-target="#approveConfirm">
								<i class="icon-ok"></i> 批准
							</button>
						</s:if>

						<s:if
							test='%{hasSubmitAuth!=null && hasSubmitAuth=="1"}'>
							<button class="btn" type="button" id="startBtn"
								data-toggle="modal" data-target="#startConfirm">
								<i class="icon-ok"></i> 发起
							</button>
						</s:if>
						<!-- 
							<button class="btn" type="button" id="rejectBtn">
								<i class="icon-remove"></i> 拒绝
							</button>
							 -->
					</div>
				</div>
				<input type="hidden" id="tabID" name="tabID" value="${tabID}">
				<input type="hidden" id="formChanged" name="formChanged" value="0" />
				<s:set name="ProcessId" value="technologicalProcess.id!=null&&technologicalProcess.id!=''" />
				<div class="well">
					<ul class="nav nav-tabs">
						<li><a id="homeButt" href="#home"
							data-toggle="tab">基本信息</a></li>
							
						<s:if test="#ProcessId">
							<li><a id="certificatesButt" href="#certificates"
								data-toggle="tab">证件信息</a></li>
							<li><a id="flightButt" href="#flight" data-toggle="tab">航班信息</a></li>
							<li><a id="workflowTabButt" href="#workflowTab"
								data-toggle="tab">工作流</a></li>
							<li><a id="annexButt" href="#annex" data-toggle="tab">附件</a></li>
						</s:if>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="home">
							<form id="editForm" class="form-horizontal"
								action="${menu2Id}!save.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}"> 
								<input type="hidden" name="menu2Id" value="${menu2Id}">
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputId">编号：</label>
											<div class="controls">
												<input type="text" maxlength="15" disabled="disabled"
													id="inputId" name="technologicalProcess.id"
													value="${technologicalProcess.id}" class="input-large">
												<input type="hidden" name="technologicalProcess.id"
													value="${technologicalProcess.id}">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="description">描述：</label>
											<div class="controls">
												<input type="text" id="description"
													name="technologicalProcess.res2"
													value="${technologicalProcess.res2}" data-required="true"
													class="input-large">
											</div>
										</div>
									</div>

								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="inputName">姓名：</label>
											<div class="controls">
												<input type="text" data-required="true" maxlength="15"
													id="inputName" name="technologicalProcess.name"
													value="${technologicalProcess.name}" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputEnglishname">英文名：</label>
											<div class="controls">
												<input type="text" id="inputEnglishname"
													name="technologicalProcess.englishname"
													value="${technologicalProcess.englishname}"
													data-required="true" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputnationality">国籍：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputnationality"
													name="technologicalProcess.nationality"
													value="${technologicalProcess.nationality}"
													class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputState">当前状态：</label>
											<div class="controls">
												<input type="text" id="inputState"
													name="technologicalProcess.state" readonly="readonly"
													value="${technologicalProcess.state}" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputyearbirth">出生年份：</label>
											<div class="controls">
												<input type="text" id="inputyearbirth"
													name="technologicalProcess.yearbirth"
													value="${technologicalProcess.yearbirth}"
													class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputBirthday">生日：</label>
											<div class="controls">
												<input type="text" size="15" id="inputBirthday"
													name="technologicalProcess.birthday"
													value="<s:date name="technologicalProcess.birthday" format="yyyy-MM-dd" />"
													readonly class="form_datetime input-large">
											</div>
										</div>
									</div>

								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputMail">邮件：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputMail"
													name="technologicalProcess.mail"
													value="${technologicalProcess.mail}" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputPhone">手机号码：</label>
											<div class="controls">
												<input type="text" id="inputPhone"
													name="technologicalProcess.Phone"
													value="${technologicalProcess.phone}" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5 left">
										<div class="control-group">
											<label class="control-label" for="contracttype">合同种类：</label>
											<div class="controls">
												<select id="contracttype" class="input-large"
													name="technologicalProcess.contracttype">
													<option value="A">A类</option>
													<option value="B">B类</option>
													<option value="C">C类</option>
												</select>
											</div>
										</div>
									</div>
									<div class="span5 left">
										<div class="control-group">
											<label class="control-label" for="inputContractdate">合同有效期：</label>
											<div class="controls">
												<input type="text" id="inputContractdate"
													name="technologicalProcess.contractdate"
													value="${technologicalProcess.contractdate}"
													class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputPassportno">护照号：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputPassportno"
													name="technologicalProcess.passportno"
													value="${technologicalProcess.passportno}"
													class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputPassportnodate">护照有效期：</label>
											<div class="controls">
												<input type="text" id="inputPassportnodate"
													name="technologicalProcess.passportnodate"
													value="${technologicalProcess.passportnodate}"
													class="input-large">
											</div>
										</div>
									</div>
								</dir>
							</form>
						</div>
						<!-- 证件信息 -->
						<div class="tab-pane fade" id="certificates">
							<table class="table">
								<thead>
									<tr>
										<th>编号</th>
										<th>证件类型</th>
										<th>办理日期</th>
										<th>领取日期</th>
										<th>有效日期</th>
										<th>结束日期</th>
										<th>修改时间</th>
										<th style="width: 50px;">操作</th>
									</tr>
								</thead>
								<tbody id="certificatesSearch">
									<tr>
										<td>
											<input type="hidden" size="15"
											id="certificatesId">
										</td>
										<td><select id="certificatesType" class="input-medium">
												<option value="1">工作许可</option>
												<option value="2">邀请函</option>
												<option value="3">公司邀请函</option>
												<option value="4">暂住证</option>
												<option value="5">工作签</option>
												<option value="6">入境章页</option>
												<option value="7">保险</option>
												<option value="8">保险</option>
												<option value="9">外国专家证</option>
										</select></td>
										<td><input type="text" size="15"
											id="certificatesHandledate"
											readonly class="form_datetime input-small"></td>
										<td><input type="text" size="15"
											id="certificatesReceivedate"
											readonly class="form_datetime input-small"></td>
										<td><input type="text" size="15"
											id="certificatesValidstartdate" readonly
											class="form_datetime input-small"></td>
										<td><input type="text" size="15"
											id="certificatesValidenddate" readonly
											class="form_datetime input-small"></td>
										<td><input type="text" size="15"
											id="certificatesUpdateDate" 
											readonly class="input-small"></td>
										<td>
											<p>
												<button class="btn btn-mini icon-plus" type="button"
													onclick="addNew();"></button>
												<button class="btn btn-mini icon-minus" type="button"></button>
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 航班信息 -->
						<div class="tab-pane fade" id="flight">
							<form id="flightForm" class="form-horizontal"
								action="${menu2Id}!saveFlight.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}"> 
								<input type="hidden" name="menu2Id" value="${menu2Id}">
								<input type="hidden" name="formId" value="${technologicalProcess.id}">
								<input type="hidden" name="flight.id" value="${flight.id}">
							<dir class="row">
								<div class="span5">
									<div class="control-group">
										<label class="control-label" for="flightnumber">航班号：</label>
										<div class="controls">
											<input type="text" maxlength="15" id="flightnumber"
												name="flight.flightnumber" value="${flight.flightnumber}"
												class="input-large" />
										</div>
									</div>
								</div>
								<div class="span5">
									<div class="control-group">
										<label class="control-label" for="airportPeopleId">接机人：</label>
										<div class="controls">
											<select id="airportPeopleId" class="input-large"
												name="flight.airportPeopleId">
												<option value="A">测试1</option>
												<option value="B">测试2</option>
											</select>
										</div>
									</div>
								</div>
							</dir>
							<dir class="row">
								<div class="span5 pull-left">
									<div class="control-group">
										<label class="control-label" for="inputstartdate">起飞时间：</label>
										<div class="controls">
											<input type="text" size="15" id="inputstartdate"
												name="flight.startdate"
												value="<s:date name="flight.startdate" format="yyyy-MM-dd" />"
												readonly class="form_datetime input-large" />
										</div>
									</div>
								</div>
								<div class="span5">
									<div class="control-group">
										<label class="control-label" for="inputenddate">到达时间：</label>
										<div class="controls">
											<input type="text" size="15" id="inputenddate"
												name="flight.enddate"
												value="<s:date name="flight.enddate" format="yyyy-MM-dd" />"
												readonly class="form_datetime input-large" />
										</div>
									</div>
								</div>
							</dir>
							<dir class="row">
								<div class="span5 pull-left">
									<div class="control-group">
										<label class="control-label" for="place">到达机场：</label>
										<div class="controls">
											<input type="text" maxlength="15" id="place"
												name="flight.place" value="${flight.place}"
												class="input-large" />
										</div>
									</div>
								</div>
							</dir>
							</form>
						</div>

						<!-- 工作流 -->
						<div class="tab-pane fade" id="workflowTab">
							<!-- 如果发起了则显示工作 -->
							<s:if
								test="%{technologicalProcess.state != null && technologicalProcess.state != ''}">
								<img alt="工作流"
									src="${menu2Id}!loadTraceImg.jspa?menuId=workflow&menu2Id=recruitment&processInstanceId=${technologicalProcess.workflowid}"
									id="workflowShowPic">
							</s:if>
							<s:else>
								<span>没有发起或者匹配的工作流</span>
							</s:else>
						</div>
						
						<!-- 附件 -->
						<div class="tab-pane fade" id="annex">
							<table class="table">
								<thead>
									<tr>
										<th>编号</th>
										<th>文件名</th>
										<th>种类</th>
										<th>描述</th>
										<th>创建时间</th>
										<th style="width: 50px;">操作</th>
									</tr>
								</thead>
								<tbody id="FileInfoSearch">
									<tr>
										<td>
											<s:label name="#fileInfo.id"></s:label>
											<input type="hidden" id="fileInfoId"
											name="fileInfo.id" class="input-small" />
										</td>
										<td>
											<input type="file" title="上传" id="fileInfoname"
											name="fileInfo.name" class="input-small" />
										</td>
										<td><select id="fileInfoNametype" class="input-small"
											name="fileInfo.nametype">
												<option value="1">护照</option>
												<option value="2">毕业证</option>
												<option value="3">简历</option>
												<option value="4">无犯罪记录</option>
												<option value="5">TEFL证</option>
												<option value="6">档案表</option>
										</select>
										</td>
										<td><input type="text" maxlength="15" id="fileInfoDescr"
											name="fileInfo.descr" value="${fileInfo.descr}"
											class="input-large"></td>
										<td><input type="text" size="15" id="fileInfoCreatedate"
											class="input-small" readonly /></td>
										<td>
											<p>
												<button class="btn btn-mini icon-plus" type="button"
													onclick="addNewFile();"></button>
												<button class="btn btn-mini icon-minus" type="button"></button>
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- 创建工作流 -->
			<form action="${menu2Id}!createWorkflow.jspa" method="post" id="createWF">
				<input type="hidden" name="formId" id="cwf_formId" value="${technologicalProcess.id}">
				<input type="hidden" name="assign" id="cwf_assign"> 
				<input type="hidden" name="menu2Id" value="${menu2Id}"> 
				<input type="hidden" name="menuId" value="${menuId}">
			</form>
			
			<!-- 批准工作流 -->
			<form action="${menu2Id}!approveWorkflow.jspa" method="post" id="approveWF">
				<input type="hidden" name="formId" id="awf_formId" value="${technologicalProcess.id}">
				<input type="hidden" name="technologicalProcess.workflowid" id="awf_formId" value="${technologicalProcess.workflowid}">
				<input type="hidden" name="technologicalProcess.res2" id="taskId" value="${technologicalProcess.res2}">
				<input type="hidden" name="assign" id="awf_assign"> 
				<input type="hidden" name="menu2Id" value="${menu2Id}"> 
				<input type="hidden" name="menuId" value="${menuId}">
			</form>
		</div>
	</div>

<!-- 保存证件列表 -->
<div class="hide">
	<form id="certificatesForm" class="form-horizontal"
		action="${menu2Id}!saveCertificates.jspa" method="post">
		<input type="hidden" id="jsonList" name="jsonList" />
	</form>
</div>

<!-- 上传文件 -->
<div class="hide">
	<form id="fileForm" class="form-horizontal"
		action="${menu2Id}!saveFile.jspa" method="post">
		<input type="file" title="上传" id="fileInfoname"
			name="fileInfo.name" class="input-small" />
		<input type="hidden" title="上传" id="fileInfoNametype"
			name="fileInfo.nametype" class="input-small" />
		<input type="hidden" maxlength="15" id="fileInfoDescr"
				   name="fileInfo.descr" value="">
	</form>
</div>
<div class="hide">
	<a  id="Ejectfirm" name="Ejectfirm" href="#forMchangefirm" data-toggle="modal"></a>
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
		<label class="control-label pull-left" for="modalAssign">审批人：</label>
		<input type="text" id="modalAssign" class="input-large pull-right">

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
		<label class="control-label pull-left" for="modalNextAssign">审批人：</label>
		<input type="text" id="modalNextAssign" class="input-large pull-right">

	</div>
	<div class="modal-footer">
		<button class="btn btn-danger" data-dismiss="modal"
			id="approveBtnConfirm">确认</button>
		<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
	</div>
</div>

<div class="modal small hide fade" id="forMchangefirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">警告</h3>
  </div>
  <div class="modal-body">
    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>当前页面已经修改过,请先保存."确认" 保存 "取消" 不保存</p>
  </div>
  <div class="modal-footer">
    <button class="btn btn-danger" data-dismiss="modal" id="formChangefirmBtn">确认</button>
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
		var url = $("#" + menuId).attr('url');
		var headText = $("#" + menuId).text();
		$("#navigation1").text(headText);
		
		//是否具有编辑权限
		var hasEdit = $("#hasEditAuth").val();
		if(hasEdit == "1"){
		}else{
			$(".container-fluid input").attr("disabled","disabled");
			$(".container-fluid select").attr("disabled","disabled");
			$(".container-fluid button").attr("disabled","disabled");
		}

		//基本信息
		//$("#contracttype").select2();
		$("#contracttype").val("${technologicalProcess.contracttype}").trigger(
				"change");

		//证件信息初始化
		//$("#certificatesType").select2();
		$("#certificatesType").val("${certificates.type}").trigger("change");

		//航班信息
		//$("#airportPeopleId").select2();
		$("#airportpeopleid").val("${flight.airportpeopleid}")
				.trigger("change");

		//附件
		//$("#fileInfoNametype").select2();
		$("select").select2();
		
		//新增证件行信息
		var row_count = 1;
		function addNew() {
			row_count++;
			var search = $('#certificatesSearch');
			var row = $("<tr></tr>");
			addTd(
					row,"<input type='hidden' size='15' id='certificatesId'>");
			addTd(
					row,
					"<select id='certificatesType' class='input-medium' ><option value='1'>工作许可</option><option value='2'>邀请函</option><option value='3'>公司邀请函</option> <option value='4'>暂住证</option><option value='5'>工作签</option><option value='6'>入境章页</option><option value='7'>保险</option><option value='8'>保险</option><option value='9'>外国专家证</option></select>");
			addTd(
					row,
					"<input type='text' size='15' id='certificatesHandledate' readonly class='form_datetime input-small'>");
			addTd(
					row,
					"<input type='text' size='15' id='certificatesReceivedate' readonly class='form_datetime input-small'>");
			addTd(
					row,
					"<input type='text' size='15' id='certificatesValidstartdate' readonly class='form_datetime input-small'>");
			addTd(
					row,
					"<input type='text' size='15' id='certificatesValidenddate' readonly class='form_datetime input-small'>");
			addTd(
					row,
					"<input type='text' size='15' id='certificatesUpdateDate' readonly class='form_datetime input-small'>");
			addTd(
					row,
					"<p><button class='btn btn-mini icon-plus' onclick='addNew();' type='button'></button><button class='btn btn-mini icon-minus' onclick='del(this);' type='button'></button></p>");
			search.append(row);
			$("select[id='certificatesType']").last().select2();
		}
		
		//获取证件 table中行的的对象
		function queryCertificates(index)
		{
			var obj=new Object();
			obj.id=$("input[id='certificatesId']")[index].value;
			obj.type=$("select[id='certificatesType']")[index].value;
			obj.handledate=$("input[id='certificatesHandledate']")[index].value;
			obj.receivedate=$("input[id='certificatesReceivedate']")[index].value;
			obj.validstartdate=$("input[id='certificatesValidstartdate']")[index].value;
			obj.validenddate=$("input[id='certificatesValidenddate']")[index].value;
			obj.technologicalprocessid =$("#inputId").val();
			return obj;
		}

		//新增上传文件行
		var file_row_count = 0;
		function addNewFile() {
			file_row_count++;
			var search = $('#FileInfoSearch');
			var row = $("<tr></tr>");
			addTd(
					row,
					"<input type='file' title='上传' id='fileInfoname' name='fileInfo.name'  class='input-small' />");
			addTd(
					row,
					"<select id='fileInfoNametype' class='input-small' name='fileInfo.nametype'> <option value='1'>护照</option> <option value='2'>毕业证</option> <option value='3'>简历</option> <option value='4'>无犯罪记录</option><option value='5'>TEFL证</option> <option value='6'>档案表</option> </select>");
			addTd(
					row,
					"<input type='text' maxlength='15' id='fileInfoDescr' name='fileInfo.descr' value='${fileInfo.descr}' class='input-large'>");
			addTd(
					row,
					"<input type='text' size='15' id='fileInfoCreatedate' class='input-small' readonly />");
			addTd(
					row,
					"<p><button class='btn btn-mini icon-plus' onclick='addNewFile();' type='button'></button><button class='btn btn-mini icon-minus' onclick='delFile(this);' type='button'></button></p>");
			search.append(row);
			$("select[id='fileInfoNametype']").last().select2();
		}
		function addTd(row, str) {
			var td = $("<td></td>");
			td.append($(str));
			row.append(td);

		}

		function delFile(butt) {
			var tr = butt.parentNode.parentNode.parentNode;
			tr.parentNode.removeChild(tr);
			file_row_count--;
		}

		function del(butt) {
			var tr = butt.parentNode.parentNode.parentNode;
			tr.parentNode.removeChild(tr);
			row_count--;
		}

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
		
		//进入指定的tbs
		var tabID = "${tabID}";
		if(null != tabID && "" != tabID)
		{
				$("#" + tabID).parent().addClass("active");	
				$("#" + tabID.substring(0,tabID.length-4)).removeClass("fade").addClass("active");				
		}else
		{
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
		
		//当前tbs
		var currTab=tabID;
		
		//判读当前tab，需要保存那个form
		function saveForm()
		{
			var action;
			if("homeButt" == currTab) {
				
				action=$("#editForm").attr("action");
				$("#editForm").attr("action",action + "?tabID="+$("#tabID").val());
				validate = $('#editForm').validate();
				$("#editForm").submit();
			}else if ("certificatesButt" == currTab){
				var arrCertificates=new Array();
				for ( var index = 0; index < row_count; index++) {
					arrCertificates[index] = queryCertificates(index);
					alert(arrCertificates[index].type);
				}
				var tex=JSON2.stringify(arrCertificates);
				$("input[id='jsonList']").val(tex);
				$("#certificatesForm").submit();
			}else if ("flightButt" == currTab){
				
				action=$("#flightForm").attr("action");
				$("#flightForm").attr("action",action + "?tabID="+$("#tabID").val());
				$("#flightForm").submit();
			}
			
		}
		
		/*判断当前form是否变更*/
		var technologicalProcessId="${technologicalProcess.id}";
		function ischangeForm(id)
		{
			//获取当前需要保存的tabid
			currTab = $("#tabID").val();
			//设置新的tab
			$("#tabID").val(id);
			//判断是否变更过
			if("1" == $("#formChanged").val())
			{
				$("#Ejectfirm").click();
				$("#formChanged").val("0");
			}
		}
		
		//tab页签添加事件
		$("li a[data-toggle='tab']").click(function() {
			ischangeForm(this.id);
		});
		
		//发起按钮确认
		$("#startBtnConfirm").click(function() {
			var assign = $("#modalAssign").val();
			if (assign == null || assign == "") {
				return;
			}else{
				$("#cwf_assign").val(assign);
				$("#createWF").submit();
			}
		});
		
		//批准按钮确认
		$("#approveBtnConfirm").click(function() {
			var assign = $("#modalNextAssign").val();
			if (assign == null || assign == "") {
				return;
			}else{
				$("#awf_assign").val(assign);
				$("#approveWF").submit();
			}
			
		});
	</script>
</body>
</html>