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
	<!-- 
	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">
				<li>
					<a href="#" class="hidden-phone visible-tablet visible-desktop" role="button">设置</a>
				</li>
				<li id="fat-menu" class="dropdown">
					<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
						<i	class="icon-user"></i> 陶照平 <i class="icon-caret-down"></i>
					</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#">我的账号</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" class="visible-phone" href="#">设置</a></li>
						<li class="divider visible-phone"></li>
						<li><a tabindex="-1" href="sign-in.html">退出</a></li>
					</ul>
				</li>
			</ul>
			<a class="brand" href="index.html"><span class="first">Your</span>
				<span class="second">信息管理平台</span></a>
		</div>
	</div>
	 -->

	<div class="sidebar-nav">
		<a href="#dashboard-menu" class="nav-header collapsed"
			data-toggle="collapse"><i class="icon-exclamation-sign"></i>系统管理</a>
		<ul id="dashboard-menu" class="nav nav-list collapse in">
			<li><a href="../pages/users.html">用户列表</a></li>
			<li><a href="#">角色列表</a></li>
			<li><a href="#">资源列表</a></li>
			<li><a href="enterprise.jspa">企业列表</a></li>
			<li><a href="#">参数配置</a></li>
		</ul>

		<a href="#accounts-menu" class="nav-header collapsed"
			data-toggle="collapse"><i class="icon-exclamation-sign"></i>我的账号</a>
		<ul id="accounts-menu" class="nav nav-list collapse">
			<li><a href="../pages/sign-in.html">登陆</a></li>
			<li><a href="sign-up.html">注册</a></li>
			<li><a href="reset-password.html">修改密码</a></li>
			<li><a href="../pages/user.html">编辑用户</a></li>
		</ul>

		<a href="#error-menu" class="nav-header collapsed"
			data-toggle="collapse"><i class="icon-exclamation-sign"></i>错误页面</a>
		<ul id="error-menu" class="nav nav-list collapse">
			<li><a href="403.html">403 page</a></li>
			<li><a href="404.html">404 page</a></li>
			<li><a href="500.html">500 page</a></li>
			<li><a href="503.html">503 page</a></li>
		</ul>
	</div>

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

			<h1 class="page-title">企业管理</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="main.jspa">Home</a> <span class="divider">/</span></li>
			<li><a href="enterprise.jspa">企业列表</a> <span class="divider">/</span></li>
			<li class="active">企业编辑</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="row-fluid">
					<div class="btn-toolbar">
						<button class="btn btn-primary">
							<i class="icon-save"></i> 保存
						</button>
						<a href="enterprise.jspa" data-toggle="modal" class="btn">
							返回</a>
						<div class="btn-group"></div>
					</div>
					<div class="well">
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active" id="home">
								<form id="tab" class="form-horizontal">
									<div class="control-group">
										<label class="control-label" for="inputName">企业名称:</label>
										<div class="controls">
											<input type="text" id="inputName" value="${enterprise.name}" class="input-xlarge">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="inputaddress">企业地址:</label>
										<div class="controls">
											<input type="text" id="inputaddress" value="${enterprise.address}" class="input-xlarge">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="inputaddress">企业电话:</label>
										<div class="controls">
											<input type="text" id="inputaddress" value="${enterprise.phonecall}" class="input-xlarge">
										</div>
									</div>						
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/pages/common/footer.jsp"%>
		</div>
		<script src="<%=path%>/js/bootstrap.js"></script>
		<script type="text/javascript">
			$("[rel=tooltip]").tooltip();
			$(function() {
				$('.demo-cancel-click').click(function() {
					return false;
				});
			});
			//一个导航卡打开后，其余的关闭
	        $(".collapse").on('show', function (){
	            $(this).siblings(".collapse").siblings(".in").collapse('hide');
	        });
		</script>
</body>
</html>