<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
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
					<span class="number">27</span>tasks
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
			<form id="editForm" class="form-horizontal"
				action="${menu2Id}!save.jspa" method="post">
				<div class="row-fluid">
					<div class="btn-toolbar">
						<button class="btn btn-primary" type="submit">
							<i class="icon-save"></i> 保存
						</button>

						<div class="pull-right">
							<button class="btn" type="button" id="approveBtn">
								<i class="icon-ok"></i> 同意
							</button>
							<button class="btn" type="button" id="rejectBtn">
								<i class="icon-remove"></i> 拒绝
							</button>
						</div>
					</div>
					<div class="well">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#home" data-toggle="tab">基本信息</a></li>
							<li><a href="#certificates" data-toggle="tab">证件信息</a></li>
							<li><a href="#flight" data-toggle="tab">航班信息</a></li>
							<li><a href="#workflow" data-toggle="tab">工作流</a></li>
							<li><a href="#annex" data-toggle="tab">附件</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active" id="home">
								<input type="hidden" name="menuId" value="${menuId}"> <input
									type="hidden" name="menu2Id" value="${menu2Id}">

								<dir class="row">
									<div class="span5">
										<div class="control-group" id="name_div">
											<label class="control-label" for="inputId">编号:</label>
											<div class="controls">
												<input type="text" maxlength="15" disabled="disabled"
													id="inputId" name="technologicalProcess.id"
													value="${technologicalProcess.id}" class="input-large">
											</div>
										</div>
									</div>

								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group" id="name_div">
											<label class="control-label" for="inputName">姓名:</label>
											<div class="controls">
												<input type="text" data-required="true" maxlength="15"
													data-required="true" id="inputName"
													name="technologicalProcess.name"
													value="${technologicalProcess.name}" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputEnglishname">英文名:</label>
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
										<div class="control-group" id="name_div">
											<label class="control-label" for="inputnationality">国籍:</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputnationality"
													name="technologicalProcess.nationality"
													value="${technologicalProcess.name}" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputState">状态:</label>
											<div class="controls">
												<input type="text" id="inputState"
													name="technologicalProcess.state"
													value="${technologicalProcess.state}" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputyearbirth">出生年份:</label>
											<div class="controls">
												<input type="text" id="inputyearbirth"
													name="technologicalProcess.yearbirth"
													value="${technologicalProcess.yearbirth}"
													class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group" id="name_div">
											<label class="control-label" for="inputBirthday">生日:</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputBirthday"
													name="technologicalProcess.birthday"
													value="${technologicalProcess.birthday}"
													class="input-large">
											</div>
										</div>
									</div>

								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group" id="name_div">
											<label class="control-label" for="inputMail">邮件:</label>
											<div class="controls">
<input type="text" maxlength="15" id="inputMail"
													name="technologicalProcess.mail"
													value="${technologicalProcess.mail}" class="input-large">
												
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputPhone">手机号码:</label>
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
										<div class="control-group" id="name_div">
											<label class="control-label" for="inputContracttype">合同种类:</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputContracttype"
													name="technologicalProcess.contracttype"
													value="${technologicalProcess.contracttype}"
													class="input-large">
											</div>
										</div>
									</div>
									<div class="span5 left">
										<div class="control-group">
											<label class="control-label" for="inputContractdate">合同有效期:</label>
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
										<div class="control-group" id="name_div">
											<label class="control-label" for="inputPassportno">护照号:</label>
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
											<label class="control-label" for="inputPassportnodate">护照有效期:</label>
											<div class="controls">
												<input type="text" id="inputPassportnodate"
													name="technologicalProcess.passportnodate"
													value="${technologicalProcess.passportnodate}"
													class="input-large">
											</div>
										</div>
									</div>
								</dir>
							</div>
							<div class="tab-pane fade" id="certificates"></div>
							<div class="tab-pane fade" id="flight"></div>
							<div class="tab-pane fade" id="workflow"></div>
							<div class="tab-pane fade" id="annex"></div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="/pages/common/footer.jsp"%>
	<script src="<%=path%>/js/bootstrap.js"></script>
	<script src="<%=path%>/js/collapsePulg.js"></script>
	<script src="<%=path%>/js/common.js"></script>
	<script src="<%=path%>/js/jquery-validate.js"></script>
	<script src="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.js"></script>
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

		$("#inputemailisauth").select2();
		$("#inputemailisauth").val("${sysParam.emailisauth}").trigger("change");
	</script>
</body>
</html>