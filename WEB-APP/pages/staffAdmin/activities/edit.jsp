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
					<span class="number"><s:property value="#session.taskSize"/></span>tasks
				</p>
				<p class="stat">
					<span class="number">15</span>waiting
				</p>
			</div>

			<h1 class="page-title" id="menu2Name">&nbsp;</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="<%=path%>/home/main.jspa">主页</a> <span class="divider">/</span></li>
			<li><a href="" id="navigation"></a> <span class="divider">/</span></li>
			<li class="active">编辑</li>
		</ul>
		
		<div class="container-fluid">
		<form id="editForm" class="form-horizontal" action="${menu2Id}!save.jspa" method="post">
			<div class="row-fluid">
				<div class="row-fluid">
				
					<div class="btn-toolbar">
						<button class="btn btn-primary" type="submit">
							<i class="icon-save"></i> 保存
						</button>
						<a class="btn" id="backList" href="">
							返回</a>
						<div class="btn-group"></div>
					</div>
					<div class="well">
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active" id="home">
									<input type="hidden" name="activities.id" value="${activities.id}">
									<input type="hidden" name="menuId" value="${menuId}">
									<input type="hidden" name="menu2Id" value="${menu2Id}">
									<dir class="row">
										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="inputname">活动名称：</label>
												<div class="controls">
													<input type="text" maxlength="15" id="inputname"
														name="activities.name"
														value="${activities.name}"
														data-required="true" desc="活动名称" class="input-large">
												</div>
											</div>
										</div>
										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="inputscheduleDate">预定时间：</label>
												<div class="controls">
													<input type="text" size="15" id="inputscheduleDate"
														name="activities.scheduleDate"
														value="<s:date name="activities.scheduleDate" format="yyyy-MM-dd" />"
														data-required="true" desc="预定时间" readonly class="form_datetime input-large">
												</div>
											</div>
										</div>
								</dir>					
								<dir class="row">
										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="inputsetPlace">集合地点：</label>
												<div class="controls">
													<input type="text" maxlength="15" id="inputsetPlace"
														name="activities.setPlace"
														value="${activities.setPlace}"
														data-required="true" desc="集合地点" class="input-large">
												</div>
											</div>
										</div>
										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="inputsetTime">集合时间：</label>
												<div class="controls">
													<input type="text" size="15" id="inputsetTime"
														name="activities.setTime"
														value="<s:date name="activities.setTime" format="yyyy-MM-dd" />"
														data-required="true" desc="集合时间" readonly class="form_datetime input-large">
												</div>
											</div>
										</div>
								</dir>
								<dir class="row">
										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="inputuserName">负责人：</label>
												<div class="controls">
													<input type="text" maxlength="15" id="inputuserName"
														name="activities.userName"
														value="${activities.userName}"
														data-required="true" desc="负责人" class="input-large">
												</div>
											</div>
										</div>
										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="inputtelephone">电话：</label>
												<div class="controls">
													<input type="text" maxlength="15" id="inputtelephone"
														name="activities.telephone"
														value="${activities.telephone}"
														data-required="true" desc="电话" class="input-large">
												</div>
											</div>
										</div>
								</dir>
								<dir class="row">
										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="inputscheduleTime">活动耗时：</label>
												<div class="controls">
													<input type="text" maxlength="15" id="inputscheduleTime"
														name="activities.scheduleTime"
														value="${activities.scheduleTime}"
														data-required="true" desc="活动耗时" class="input-large">
												</div>
											</div>
										</div>
										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="inputenabled">状态：</label>
												<div class="controls">
													<select id="inputenabled" class="input-large" data-required="true" desc="状态"
													name="activities.enabled">
													<option value="0">有效</option>
													<option value="1">无效</option>
												</select>
												</div>
											</div>
										</div>
								</dir>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		</div>
		</div>
		<%@ include file="/pages/common/footer.jsp"%>
		<script src="<%=path%>/js/bootstrap.js"></script>
		<script src="<%=path %>/js/collapsePulg.js"></script>
		<script src="<%=path %>/js/common.js"></script>
		<script src="<%=path %>/js/jquery-validate.js"></script>
		<script type="text/javascript">
			$("[rel=tooltip]").tooltip();
			var id='${menuId}';
			var menuId='${menu2Id}';
			var url=$("#"+menuId).attr('url');
			
			
		</script>
</body>
</html>