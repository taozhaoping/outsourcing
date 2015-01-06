<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
						<!-- 
							<button class="btn" type="button" id="rejectBtn">
								<i class="icon-remove"></i> 拒绝
							</button>
							 -->
					</div>
				</div>
				<input type="hidden" id="tabID" name="tabID" value="${tabID}">
				<input type="hidden" id="formChanged" name="formChanged" value="0" />
				<s:set name="ProcessId"
					value="technologicalProcess.id!=null&&technologicalProcess.id!=''" />
				<div class="well">
					<ul class="nav nav-tabs">
						<li><a id="homeButt" href="#home" data-toggle="tab">基本信息</a></li>

						<s:if test="#ProcessId">
							<li><a id="certificatesButt" href="#certificates"
								data-toggle="tab">证件信息</a></li>
							<li><a id="flightButt" href="#flight" data-toggle="tab">航班信息</a></li>
							<li><a id="expressButt" href="#express" data-toggle="tab">快递信息</a></li>
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
								<input type="hidden" name="spaceId" value="${spaceId}">
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
													name="technologicalProcess.description"
													value="${technologicalProcess.description}"
													data-required="true" desc="描述" class="input-large">
											</div>
										</div>
									</div>

								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="inputName">姓名：</label>
											<div class="controls">
												<input type="text" data-required="true" desc="姓名"
													maxlength="15" id="inputName"
													name="technologicalProcess.name"
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
													data-required="true" desc="英文名" class="input-large">
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
													data-required="true" desc="国籍" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputCurrentlocation">目前所在地(国家)：</label>
											<div class="controls">
												<input type="text" id="inputCurrentlocation"
													name="technologicalProcess.currentlocation" 
													value="${technologicalProcess.currentlocation}"
													data-required="true" desc="目前所在地(国家)" class="input-large">
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
													data-required="true" data-pattern="^[0-9]{4}$" desc="出生年份" class="input-large">
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
													data-required="true" desc="生日" readonly class="form_datetime input-large">
											</div>
										</div>
									</div>

								</dir>

								<dir class="row">
									<div class="span5 left">
										<div class="control-group">
											<label class="control-label" for="contracttype">合同种类：</label>
											<div class="controls">
												<select id="contracttype" class="input-large" data-required="true" desc="合同种类"
													name="technologicalProcess.contracttype">
													<option value=""></option>
													<option value="A">A类</option>
													<option value="B">B类</option>
													<option value="C">C类</option>
												</select>
											</div>
										</div>
									</div>
									
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputContractdate">合同有效期：</label>
											<div class="controls">
												<input type="text" id="inputContractdate"
													name="technologicalProcess.contractdate"
													value="${technologicalProcess.contractdate}"
													data-required="true" desc="合同有效期" readonly class="form_datetime input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5 left">
										<div class="control-group">
											<label class="control-label" for="inputPassportno">护照号：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputPassportno"
													name="technologicalProcess.passportno"
													value="${technologicalProcess.passportno}"
													data-required="true" desc="护照号" class="input-large">
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
													data-required="true" desc="护照有效期" readonly class="form_datetime input-large">
											</div>
										</div>
									</div>
								</dir>
								
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputMail">电子邮箱：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputMail"
													name="technologicalProcess.mail"
													value="${technologicalProcess.mail}" data-required="true"
													data-pattern="^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$"
													desc="电子邮箱" class="input-large">
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
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputWechat">WeChat：</label>
											<div class="controls">
												<input type="text" id="inputWechat"	
													name="technologicalProcess.wechat"
													value="${technologicalProcess.wechat}"
													class="input-large">
											</div>
										</div>
									</div>

									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputSkype">Skype：</label>
											<div class="controls">
												<input type="text" id="inputSkype"
													name="technologicalProcess.skype"
													value="${technologicalProcess.skype}" class="input-large">
											</div>
										</div>
									</div>
								</dir>
								
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputWorkuserid">创建者：</label>
											<div class="controls">
												<s:set id="userNameid" value="technologicalProcess.workuserid"></s:set>
												<input type="text" id="inputWorkuserid" disabled="disabled"
													name="technologicalProcess.workUserName"
													value="${technologicalProcess.workUserName}"
													readonly class="input-large">
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
											<label class="control-label" for="inputDomicile">户籍地址：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputDomicile"
													name="technologicalProcess.domicile"
													value="${technologicalProcess.domicile}"
													desc="户籍地址" class="input-large">
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
										<th>证件编号</th>
										<th>办理日期</th>
										<th>领取日期</th>
										<th>有效日期</th>
										<th>结束日期</th>
										<!-- 
										<th>修改时间</th>
										 -->
										<th style="width: 50px;">操作</th>
									</tr>
								</thead>
								<tbody id="certificatesSearch">
									
								</tbody>
							</table>
						</div>
						<!-- 航班信息 -->
						<div class="tab-pane fade" id="flight">
							<form id="flightForm" class="form-horizontal"
								action="${menu2Id}!saveFlight.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}"> 
								<input type="hidden" name="menu2Id" value="${menu2Id}"> 
								<input type="hidden" name="spaceId" value="${spaceId}">
								<input type="hidden" name="formId" value="${technologicalProcess.id}">
								<input type="hidden" name="flight.id" value="${flight.id}">
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="flightnumber">航班号：</label>
											<div class="controls">
												<input type="text" maxlength="25"  data-required="true" desc="航班号" id="flightnumber"
													name="flight.flightnumber" value="${flight.flightnumber}"
													class="input-large" />
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="airportPeopleId">接机人：</label>
											<div class="controls">
												<!-- 
												<select id="airportPeopleId" class="input-large"
													name="flight.airportPeopleId">
													<option value="A">测试1</option>
													<option value="B">测试2</option>
												</select>
												 -->
												
												<select id="airportPeopleId" class="input-large" name="flight.airportpeopleid" data-required="true" desc="接机人" selectId ="${flight.airportpeopleid}">
													<option id="airportPeopleIdOption" value=""></option>
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
												<input type="text" data-required="true" desc="起飞时间" id="inputstartdate"
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
												<input type="text" data-required="true" desc="到达时间" id="inputenddate"
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
												<input type="text" maxlength="25" id="place" data-required="true" desc="到达机场"
													name="flight.place" value="${flight.place}"
													class="input-large" />
											</div>
										</div>
									</div>
								</dir>
							</form>
						</div>
						
						<!-- 快递信息 -->
						<div class="tab-pane fade" id="express">
							<form id="expressForm" class="form-horizontal"
								action="${menu2Id}!saveExpress.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}"> 
								<input type="hidden" name="menu2Id" value="${menu2Id}"> 
								<input type="hidden" name="spaceId" value="${spaceId}">
								<input type="hidden" name="formId" value="${technologicalProcess.id}">
								<input type="hidden" name="express.id" value="${express.id}">
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="expressnumber">快递号：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="expressnumber" data-required="true" desc="快递号"
													name="express.expressnumber" value="${express.expressnumber}"
													class="input-large" />
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="company">快递公司：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="company" data-required="true" desc="快递公司"
													name="express.company" value="${express.company}"
													class="input-large" />
												
											</div>
										</div>
									</div>
								</dir>
								
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="inputTelephone">公司电话：</label>
											<div class="controls">
												<input type="text" size="20" id="inputTelephone"
													name="express.telephone" data-required="true" desc="公司电话"
													value="${express.telephone}" class=" input-large" />
											</div>
										</div>
									</div>
									
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="inputAddress">收货地址：</label>
											<div class="controls">
												<input type="text" size="20" id="inputAddress"
													name="express.address" data-required="true" desc="收货地址"
													value="${express.address}" class="input-large" />
											</div>
										</div>
									</div>
								</dir>
								
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="delivergoodsdate">发货日期：</label>
											<div class="controls">
												<input type="text" id="delivergoodsdate"
													name="express.delivergoodsdate" data-required="true" desc="发货日期"
													value="<s:date name="express.delivergoodsdate" format="yyyy-MM-dd" />"
													readonly class="form_datetime input-large" />
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="arrivedate">到货日期：</label>
											<div class="controls">
												<input type="text" id="arrivedate" desc="到货日期"
													name="express.arrivedate" value="<s:date name="express.arrivedate" format="yyyy-MM-dd" />"
													readonly class="form_datetime input-large" />
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
								test="%{technologicalProcess.state != null && technologicalProcess.state != ''&& technologicalProcess.state != '发起' && technologicalProcess.state != '结束'}">
								<img alt="流程没有发起或已结束"
									src="${menu2Id}!loadTraceImg.jspa?menuId=workflow&menu2Id=recruitment&processInstanceId=${technologicalProcess.workflowid}"
									id="workflowShowPic">
							</s:if>
							<s:else>
								<span>没有匹配的工作流(没有发起或已结束)</span>
							</s:else>
						</div>

						<!-- 附件 -->
						<div class="tab-pane fade" id="annex">
							<button class="btn btn-small icon-file btn-primary" type="button"
								data-toggle="modal" data-target="#filefirm">上传附件</button>
							<table class="table">
								<thead>
									<tr>
										<th>编号</th>
										<th>文件名</th>
										<th>类型</th>
										<th>描述</th>
										<th>创建时间</th>
										<th style="width: 50px;">操作</th>
									</tr>
								</thead>
								<tbody id="FileInfoSearch">

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- 创建工作流 -->
			<form action="${menu2Id}!createWorkflow.jspa" method="post"
				id="createWF">
				<input type="hidden" name="formId" id="cwf_formId"
					value="${technologicalProcess.id}"> 
				<input type="hidden" name="assign" id="cwf_assign"> 
				<input type="hidden" name="menu2Id" value="${menu2Id}"> 
				<input type="hidden" name="menuId" value="${menuId}">
				<input type="hidden" name="spaceId" value="${spaceId}">
			</form>

			<!-- 批准工作流 -->
			<form action="${menu2Id}!approveWorkflow.jspa" method="post"
				id="approveWF">
				<input type="hidden" name="formId" id="awf_formId"
					value="${technologicalProcess.id}"> 
				<input type="hidden" name="technologicalProcess.workflowid" id="awf_formId"
					value="${technologicalProcess.workflowid}"> 
				<input type="hidden" name="technologicalProcess.taskId" id="taskId"
					value="${technologicalProcess.taskId}"> 
				<input type="hidden" name="assign" id="awf_assign"> 
				<input type="hidden" name="assignFlag" id="awf_assignFlag"> 
				<input type="hidden" name="menu2Id" value="${menu2Id}"> 
				<input type="hidden" name="menuId" value="${menuId}">
				<input type="hidden" name="spaceId" value="${spaceId}">
			</form>
		</div>
	</div>

	<!-- 保存证件列表 -->
	<div class="hide">
		<form id="certificatesForm" class="form-horizontal"
			action="${menu2Id}!saveCertificates.jspa" method="post">
			<input type="hidden" name="formId" value="${technologicalProcess.id}">
			<input type="hidden" name="menu2Id" value="${menu2Id}"> 
			<input type="hidden" name="menuId" value="${menuId}">
			<input type="hidden" name="spaceId" value="${spaceId}">
			<input type="hidden" id="jsonList" name="jsonList" />
		</form>
	</div>

	<!-- 上传文件 -->
	<div class="modal small hide fade" id="filefirm" tabindex="-1"
		style="width: 550px;" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="startModalLabel">附件上传</h3>
		</div>
		<form id="fileForm" class="form-horizontal" enctype="multipart/form-data"
			action="${menu2Id}!saveFile.jspa" method="post">
			<input type="hidden" name="menuId" value="${menuId}"> 
			<input type="hidden" name="menu2Id" value="${menu2Id}"> 
			<input type="hidden" name="spaceId" value="${spaceId}">
			<input type="hidden" name="formId" value="${technologicalProcess.id}">
			<input type="hidden" name="tabID" value="annexButt">
			<div class="modal-body">
				<dir class="row">
					<div class="control-group">
						<label class="control-label" for="inputId">文件</label>
						<div class="controls">
							<input type="file" data-required="true" title="上传" id="files"
								name="files" class="input-large" />
						</div>
					</div>
				</dir>
				<dir class="row">
					<div class="control-group">
						<label class="control-label" for="inputId">类型</label>
						<div class="controls">
							<select id="fileInfoNametype" data-required="true" class="input-large"
								name="fileInfo.nametype">
								<option value="1">护照</option>
								<option value="2">毕业证</option>
								<option value="3">简历</option>
								<option value="4">Profile Form</option>
								<option value="5">其他证件(TEFL、家属证明)</option>
								<option value="6">合同word版本</option>
								<option value="7">合同签字版本</option>
								<option value="8">工作许可证</option>
								<option value="9">邀请函</option>
								<option value="10">公司邀请函</option>
								<option value="11">外国专家证</option>
								<option value="12">居留许可</option>
							</select>
						</div>
					</div>
				</dir>
				<dir class="row">
					<div class="control-group">
						<label class="control-label" for="inputId">描述</label>
						<div class="controls">
							<input type="text" maxlength="15" class="input-large"
								id="fileInfoDescr" name="fileInfo.descr" value="">
						</div>
					</div>
				</dir>

			</div>
			<div class="modal-footer">
				<button class="btn btn-danger" type="submit">确认</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
			</div>
		</form>
	</div>
	
	<!-- 修改上传文件信息 -->
	<div class="modal small hide fade" id="fileEditorfirm" tabindex="-1"
		style="width: 550px;" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="startModalLabel">附件上传</h3>
		</div>
		<form id="fileEditorForm" class="form-horizontal"
			action="${menu2Id}!saveFile.jspa" method="post">
			<input type="hidden" name="menuId" value="${menuId}"> 
			<input type="hidden" name="menu2Id" value="${menu2Id}"> 
			<input type="hidden" name="spaceId" value="${spaceId}">
			<input type="hidden" name="formId" value="${technologicalProcess.id}">
			<input type="hidden" name="tabID" value="annexButt">
			<input type="hidden" id="FileInfoId" name="fileInfo.id" value="">
			<div class="modal-body">
				<dir class="row">
					<div class="control-group">
						<label class="control-label" for="inputId">文件</label>
						<div class="controls">
							<input type="text" readonly="readonly" title="上传" id="FileInfoName"
								name="fileInfo.name" class="input-large" />
						</div>
					</div>
				</dir>
				<dir class="row">
					<div class="control-group">
						<label class="control-label" for="inputId">类型</label>
						<div class="controls">
							<select id="fileInfoNametype" data-required="true" class="input-large"
								name="fileInfo.nametype">
								<option value="1">护照</option>
								<option value="2">毕业证</option>
								<option value="3">简历</option>
								<option value="4">Profile Form</option>
								<option value="5">其他证件(TEFL、家属证明)</option>
								<option value="6">合同word版本</option>
								<option value="7">合同签字版本</option>
								<option value="8">工作许可证</option>
								<option value="9">邀请函</option>
								<option value="10">公司邀请函</option>
								<option value="11">外国专家证</option>
								<option value="12">居留许可</option>
							</select>
						</div>
					</div>
				</dir>
				<dir class="row">
					<div class="control-group">
						<label class="control-label" for="inputId">描述</label>
						<div class="controls">
							<input type="text" maxlength="15" class="input-large"
								id="fileInfoDescr" name="fileInfo.descr" value="">
						</div>
					</div>
				</dir>

			</div>
			<div class="modal-footer">
				<button class="btn btn-danger" type="submit">确认</button>
				<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
			</div>
		</form>
	</div>
	
	<div class="hide">
		<a id="Ejectfirm" name="Ejectfirm" href="#forMchangefirm"
			data-toggle="modal"></a>
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
				<!-- 
			<input type="text" id="modalAssign" class="input-large pull-right">
			 -->
				<select id="modalAssign" class="input-large pull-right">
					<option selected="selected" id="modalAssignOption">&nbsp;</option>
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
				<!-- 
			<input type="text" id="modalNextAssign" class="input-large pull-right">
			 -->
				<select id="modalNextAssign" class="input-large pull-right">
					<option selected="selected" id="modalNextAssignOption">&nbsp;</option>
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
		$("#navigation1").text(headText);
		$("select").select2();
		var localObj = window.location;
		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol + "//" + localObj.host + "/"
				+ contextPath;

		//是否具有编辑权限
		var hasEdit = $("#hasEditAuth").val();
		if (hasEdit == "1") {

		} else {
			$(".container-fluid input").attr("disabled", "disabled");
			$(".container-fluid select").attr("disabled", "disabled");
			$(".container-fluid button").attr("disabled", "disabled");
		}

		
		//基本信息
		//$("#contracttype").select2();
		$("#contracttype").val("${technologicalProcess.contracttype}").trigger(
				"change");

		//证件信息初始化
		//$("#certificatesType").select2();
		//$("#certificatesType").val("${certificates.type}").trigger("change");
		certificatesListStr = '${certificatesListJson}';
		certificatesList = new Array();
		if ("" != certificatesListStr) {
			certificatesList = JSON2.parse(certificatesListStr);
		}
		for ( var x = 0; x < certificatesList.length; x++) {
			var certificates = certificatesList[x];
			//获取最后一行数据进行赋值
			addNew();
			$("#certificatesSearch input[id='certificatesId']").last().val(certificates.id);
			$("#certificatesSearch input[id='certificatesSerialNumber']").last().val(certificates.serialNumber);
			$("#certificatesSearch select[id='certificatesType']").last().val(certificates.type).trigger(
					"change");
			//$("#certificatesType").last().select2();
			$("#certificatesSearch input[id='certificatesHandledate']").last().val(
					new Date(certificates.handledate).format("yyyy-MM-dd"));
			$("#certificatesSearch input[id='certificatesReceivedate']").last().val(
					new Date(certificates.receivedate).format("yyyy-MM-dd"));
			$("#certificatesSearch input[id='certificatesValidstartdate']").last().val(
					new Date(certificates.validstartdate).format("yyyy-MM-dd"));
			$("#certificatesSearch input[id='certificatesValidenddate']").last().val(
					new Date(certificates.validenddate).format("yyyy-MM-dd"));
			//$("#certificatesUpdateDate").last().val(new Date(certificates.updateDate).format("yyyy-MM-dd"));
			
		}
		if(certificatesList.length == 0 )
		{
			addNew();
		}
		//航班信息
		//$("#airportPeopleId").select2();
		$("#airportpeopleid").val("${flight.airportpeopleid}").attr("selectId","${flight.airportpeopleid}")
				.trigger("change");
		//初始化接机人
		selectUsers("airportPeopleId");

		//附件
		//
		//$('#fileForm').validate();
		//$('#fileEditorForm').validate();
		
		//快递信息
		//$('#expressForm').validate();
		
		
		//附件信息列表初始化
		fileInfoListStr = '${fileInfoListJson}';
		fileInfoList = new Array();
		if ("" != fileInfoListStr) {
			fileInfoList = JSON2.parse(fileInfoListStr);
		}
		for ( var x = 0; x < fileInfoList.length; x++) {
			var fileInfo = fileInfoList[x];
			addNewFile(fileInfo);
			
		}

		//新增证件行信息

		function addNew() {
			row_count++;
			var search = $('#certificatesSearch');
			var row = $("<tr></tr>");
			addTd(row, "<input type='hidden' size='15' id='certificatesId'>");
			addTd(row,
					"<select id='certificatesType' class='input-medium' ><option value='1'>工作许可证</option><option value='2'>邀请函</option><option value='3'>公司邀请函</option> <option value='4'>暂住证</option><option value='5'>工作签</option><option value='6'>入境章页</option><option value='7'>保险</option><option value='8'>外国专家证</option><option value='9'>居留许可</option></select>");
			addTd(row,
					"<input type='text' size='15' id='certificatesSerialNumber' class='input-small'>");
			addTd(row,
					"<input type='text' size='15' id='certificatesHandledate' readonly class='form_datetime input-small'>");
			addTd(row,
					"<input type='text' size='15' id='certificatesReceivedate' readonly class='form_datetime input-small'>");
			addTd(row,
					"<input type='text' size='15' id='certificatesValidstartdate' readonly class='form_datetime input-small'>");
			addTd(row,
					"<input type='text' size='15' id='certificatesValidenddate' readonly class='form_datetime input-small'>");
			/*
			addTd(row,
					"<input type='text' size='15' id='certificatesUpdateDate' readonly class='form_datetime input-small'>");
			*/
			addTd(row,
					"<p><button class='btn btn-mini icon-plus' onclick='addNew();' type='button'></button><button class='btn btn-mini icon-minus' onclick='del(this);' type='button'></button></p>");
			search.append(row);
			$("select[id='certificatesType']").last().select2();
			$("#certificatesSearch .form_datetime").datetimepicker({
				language : 'zh-CN',
				format : 'yyyy-mm-dd',
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : true
			});
		}

		//获取证件 table中行的的对象
		function queryCertificates(index) {
			var obj = new Object();
			obj.id = $("input[id='certificatesId']")[index].value;
			obj.serialNumber = $("input[id='certificatesSerialNumber']")[index].value;
			obj.type = $("select[id='certificatesType']")[index].value;
			obj.handledate = $("input[id='certificatesHandledate']")[index].value;
			obj.receivedate = $("input[id='certificatesReceivedate']")[index].value;
			obj.validstartdate = $("input[id='certificatesValidstartdate']")[index].value;
			obj.validenddate = $("input[id='certificatesValidenddate']")[index].value;
			obj.technologicalprocessid = $("#inputId").val();
			return obj;
		}

		//新增上传文件行
		
		function addNewFile(fileInfo) {
			var search = $('#FileInfoSearch');
			var row = $("<tr></tr>");
			addTd(row,"<lable id='id'>" + fileInfo.id + "</label>");
			addTd(row,"<lable  id='name'>" + fileInfo.name + "</label>");
			var nametype = "";
			switch(fileInfo.nametype)
			{
				case '2':
					nametype="毕业证";
				  break;
				case '3':
					nametype="简历";
				  break;
				case '4':
					nametype="Profile Form";
				  break;
				case '5':
					nametype="其他证件(TEFL、家属证明)";
				  break;
				case '6':
					nametype="合同word版本";
				  break;
				case '7':
					nametype="合同签字版本";
				  break;
				case '8':
					nametype="工作许可证";
				  break;
				case '9':
					nametype="邀请函";
				  break;
				case '10':
					nametype="公司邀请函";
				  break;
				case '11':
					nametype="外国专家证";
				  break;
				case '12':
					nametype="居留许可";
				  break;
				default:
					nametype="护照";
			}
			addTd(row,"<lable  id='nametype'>" + nametype + "</label>");
			addTd(row,"<lable>" + fileInfo.descr + "</label>");
			addTd(row,"<lable>" + fileInfo.createdate + "</label>");
			addTd(row,
					"<p><button class='btn btn-mini icon-pencil' data-toggle='modal' data-target='#fileEditorfirm' onclick='initFileInfo(this," + fileInfo.nametype + ")' type='button'></button><button class='btn btn-mini icon-minus hide' onclick='delFile(this);' type='button'></button></p>");
			search.append(row);
		}
		
		function initFileInfo(obj,nameType)
		{
			var tr = obj.parentNode.parentNode.parentNode;
			cells = tr.cells;
			var id=cells[0].textContent;
			var name=cells[1].textContent;
			//var nametype=cells[2].textContent;
			var descr=cells[3].textContent;
			$("#fileEditorForm input[id='FileInfoId']").val(id);
			$("#fileEditorForm input[id='FileInfoName']").val(name);
			$("#fileInfoNametype").last().val(nameType).trigger(
			"change");
			$("#fileEditorForm input[id='fileInfoDescr']").val(descr);
		}

		function addTd(row, str) {
			var td = $("<td></td>");
			td.append($(str));
			row.append(td);

		}

		function delFile(butt) {
			var tr = butt.parentNode.parentNode.parentNode;
			tr.parentNode.removeChild(tr);
		}

		function del(butt) {
			var tr = butt.parentNode.parentNode.parentNode;
			tr.parentNode.removeChild(tr);
			row_count--;
			$("#formChanged").val("1");
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

		//当前tbs
		var currTab = tabID;

		//判读当前tab，需要保存那个form
		function saveForm() {
			var action;
			if ("homeButt" == currTab) {
				action = $("#editForm").attr("action");
				setTabID("editForm",action);
				//validate = $('#editForm').validate();
				$("#editForm").submit();
			} else if ("certificatesButt" == currTab) {
				var arrCertificates = new Array();
				for ( var index = 0; index < row_count; index++) {
					arrCertificatesIndex = queryCertificates(index);
					if (arrCertificatesIndex.handledate != ""
						&& arrCertificatesIndex.receivedate != ""
						&& arrCertificatesIndex.validstartdate != ""
						&& arrCertificatesIndex.validenddate != ""
						&& arrCertificatesIndex.serialNumber != "") {
						
						arrCertificates[index] = arrCertificatesIndex;
					}
				}
				var tex = JSON2.stringify(arrCertificates);
				$("input[id='jsonList']").val(tex);
				action = $("#certificatesForm").attr("action");
				setTabID("certificatesForm",action);
				$("#certificatesForm").submit();
			} else if ("flightButt" == currTab) {

				action = $("#flightForm").attr("action");
				setTabID("flightForm",action);
				$("#flightForm").submit();
			} else if ("expressButt" == currTab) {

				//validate = $('#expressForm').validate();
				action = $("#expressForm").attr("action");
				setTabID("expressForm",action);
				$("#expressForm").submit();
			}
		}
		
		function setTabID(name,action)
		{
			var index=action.indexOf("?tabID=");
			actionName=action;
			if(  index > 0 )
			{
				actionName = action.substring(0,index);
			}
			$("#" + name).attr("action",
					actionName + "?tabID=" + $("#tabID").val());	
		}

		/*判断当前form是否变更*/
		var technologicalProcessId = "${technologicalProcess.id}";
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

		//tab页签添加事件
		$("li a[data-toggle='tab']").click(function() {
			ischangeForm(this.id);
		});

		//开始选择，用户选择框打开
		$('#startConfirm').on('show.bs.modal', function() {
			// 执行一些动作...
			selectUsers("modalAssign");
			//审核状态
			var auditRet = auditStatus();
			//存在必填没有填写
			if (auditRet.length > 0) {
				$("#startBtnConfirm").attr("disabled", "disabled");
				$("#startBtnConfirm").removeClass("btn-danger");
				$("#startConfirmMsg").html("缺少下列必填字段：" + auditRet);
			}
		});

		//选择框隐藏
		$('#startConfirm').on('hidden.bs.modal', function() {
			// 执行一些动作...
		});

		//批准选择，用户选择框打开
		$('#approveConfirm').on('show.bs.modal', function() {
			// 执行一些动作...
			selectUsers("modalNextAssign");
			//审核状态
			var auditRet = auditStatus();
			//存在必填没有填写
			if (auditRet.length > 0) {
				$("#approveBtnConfirm").attr("disabled", "disabled");
				$("#approveBtnConfirm").removeClass("btn-danger");
				$("#approveConfirmMsg").html("缺少下列必填字段：" + auditRet);

			}
		});

		//选择框隐藏
		$('#approveConfirm').on('hidden.bs.modal', function() {
			// 执行一些动作...
		});

		/*
		// 选择用户
		function selectUsers(id) {
			$.ajax({
				type : "POST", //访问WebService使用Post方式请求
				url : basePath + "/home/userInfo!queryUsers.jspa", //调用WebService的地址和方法名称组合 ---- WsURL/方法名
				data : {}, //这里是要传递的参数，格式为 data: "{paraName:paraValue}",下面将会看到       
				dataType : 'json', //WebService 会返回Json类型
				traditional : false, //不要序列化参数
				error : function(err, textStatus) {
					//alert("error: " + err + " textStatus: " + textStatus);
				},
				success : function(result) {//回调函数，result，返回值
					//填充到table中
					fillUserList(result, id);
				}
			});
		}

		//展示用户选择列表
		function fillUserList(userList, id) {
			//清空上次的查询结果
			$("#" + id + "Option").nextAll("option").remove();
			var selectOptionValue = $("#" + id).attr("selectId");
			//动态生成用户列表
			for ( var i = 0; i < userList.length; i++) {
				var user = userList[i];
				if("airportPeopleId" == id){
					if(user.id == selectOptionValue){
						$("#" + id + "Option").clone(true).attr("selected", "selected").attr(
								"id", user.id).val(user.id).html(
								user.name + "(" + user.loginName + ")").insertAfter(
								"#" + id + "Option");
						
					}else{
						$("#" + id + "Option").clone(true).removeAttr("selected").attr(
								"id", user.id).val(user.id).html(
								user.name + "(" + user.loginName + ")").insertAfter(
								"#" + id + "Option");
						
					}
				}else{
					$("#" + id + "Option").clone(true).removeAttr("selected").attr(
							"id", user.id).val(user.loginName).html(
							user.name + "(" + user.loginName + ")").insertAfter(
							"#" + id + "Option");
				}
			}
		}

		*/
		//发起按钮确认
		$("#startBtnConfirm").click(function() {
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
		$("#approveBtnConfirm").click(function() {
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
		$("#rejectBtnConfirm").click(function() {
			$("#awf_assignFlag").val("0");
			$("#approveWF").submit();
		});

		/**
		 * 审核当前的必填字段是否填写
		 * 
		 */
		function auditStatus() {
			var curState = "${technologicalProcess.state}";
			var formId = "${technologicalProcess.id}";
			var auditRet = new Array();

			$.ajax({
				type : "POST", //访问WebService使用Post方式请求
				async:false,//同步操作
				url : basePath + "/workflow/recruitment!auditRelease.jspa", //调用WebService的地址和方法名称组合 ---- WsURL/方法名
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
			
			/*
			if (curState == "发起") {
				//检查必填字段
				$("#myTabContent input[data-required='true']").each(function() {
					var inputValue = $.trim($(this).val());
					if (inputValue == null || inputValue == "") {
						var desc = $(this).attr("desc");
						auditRet.push(desc);
					}
				});

			}
			*/
			return auditRet;
		}
	</script>
</body>
</html>
