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
<link href="<%=path%>/img/favicon_32.ico" rel="bookmark" type="image/x-icon" /> 
<link href="<%=path%>/img/favicon_32.ico" rel="icon" type="image/x-icon" /> 
<link href="<%=path%>/img/favicon_32.ico" rel="shortcut icon" type="image/x-icon" />
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
			<li><a href="#">用户列表</a></li>
			<li><a href="#">角色列表</a></li>
			<li><a href="#">资源列表</a></li>
			<li><a href="#">企业列表</a></li>
			<li><a href="#">参数配置</a></li>
		</ul>

		<a href="#accounts-menu" class="nav-header collapsed"
			data-toggle="collapse"><i class="icon-exclamation-sign"></i>我的账号</a>
		<ul id="accounts-menu" class="nav nav-list collapse">
			<li><a href="sign-in.html">登陆</a></li>
			<li><a href="sign-up.html">注册</a></li>
			<li><a href="reset-password.html">修改密码</a></li>
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

			<h1 class="page-title">Dashboard</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="index.html">Home</a> <span class="divider">/</span></li>
			<li class="active">Dashboard</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="row-fluid">
					<div class="alert alert-info">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Just a quick note:</strong> Hope you like the theme!
					</div>

					<div class="block">
						<a href="#page-stats" class="block-heading" data-toggle="collapse">Latest
							Stats</a>
						<div id="page-stats" class="block-body collapse in">
							<div class="stat-widget-container">
								<div class="stat-widget">
									<div class="stat-button">
										<p class="title">2,500</p>
										<p class="detail">Accounts</p>
									</div>
								</div>

								<div class="stat-widget">
									<div class="stat-button">
										<p class="title">3,299</p>
										<p class="detail">Subscribers</p>
									</div>
								</div>

								<div class="stat-widget">
									<div class="stat-button">
										<p class="title">$1,500</p>
										<p class="detail">Pending</p>
									</div>
								</div>

								<div class="stat-widget">
									<div class="stat-button">
										<p class="title">$12,675</p>
										<p class="detail">Completed</p>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="row-fluid">
					<div class="block span6">
						<a href="#tablewidget" class="block-heading"
							data-toggle="collapse">Users<span class="label label-warning">+10</span></a>
						<div id="tablewidget" class="block-body collapse in">
							<table class="table">
								<thead>
									<tr>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Username</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Mark</td>
										<td>Tompson</td>
										<td>the_mark7</td>
									</tr>
									<tr>
										<td>Ashley</td>
										<td>Jacobs</td>
										<td>ash11927</td>
									</tr>
									<tr>
										<td>Audrey</td>
										<td>Ann</td>
										<td>audann84</td>
									</tr>
									<tr>
										<td>John</td>
										<td>Robinson</td>
										<td>jr5527</td>
									</tr>
									<tr>
										<td>Aaron</td>
										<td>Butler</td>
										<td>aaron_butler</td>
									</tr>
									<tr>
										<td>Chris</td>
										<td>Albert</td>
										<td>cab79</td>
									</tr>
								</tbody>
							</table>
							<p>
								<a href="users.html">More...</a>
							</p>
						</div>
					</div>
					<div class="block span6">
						<a href="#widget1container" class="block-heading"
							data-toggle="collapse">Collapsible </a>
						<div id="widget1container" class="block-body collapse in">
							<h2>Using Ruby?</h2>
							<p>
								This template was developed with <a
									href="http://middlemanapp.com/" target="_blank">Middleman</a>
								and includes .erb layouts and views.
							</p>
							<p>All of the views you see here (sign in, sign up, users,
								etc) are already split up so you don't have to waste your time
								doing it yourself!</p>
							<p>The layout.erb file includes the header, footer, and side
								navigation and all of the views are broken out into their own
								files.</p>
							<p>If you aren't using Ruby, there is also a set of plain
								HTML files for each page, just like you would expect.</p>
						</div>
					</div>
				</div>

				<div class="row-fluid">
					<div class="block span6">
						<div class="block-heading">
							<span class="block-icon pull-right"> <a href="#"
								class="demo-cancel-click" rel="tooltip" title="Click to refresh"><i
									class="icon-refresh"></i></a>
							</span> <a href="#widget2container" data-toggle="collapse">History</a>
						</div>
						<div id="widget2container" class="block-body collapse in">
							<table class="table list">
								<tbody>
									<tr>
										<td>
											<p>
												<i class="icon-user"></i> Mark Otto
											</p>
										</td>
										<td>
											<p>Amount: $1,247</p>
										</td>
										<td>
											<p>Date: 7/19/2012</p> <a href="#">View Transaction</a>
										</td>
									</tr>
									<tr>
										<td>
											<p>
												<i class="icon-user"></i> Audrey Ann
											</p>
										</td>
										<td>
											<p>Amount: $2,793</p>
										</td>
										<td>
											<p>Date: 7/12/2012</p> <a href="#">View Transaction</a>
										</td>
									</tr>
									<tr>
										<td>
											<p>
												<i class="icon-user"></i> Mark Tompson
											</p>
										</td>
										<td>
											<p>Amount: $2,349</p>
										</td>
										<td>
											<p>Date: 3/10/2012</p> <a href="#">View Transaction</a>
										</td>
									</tr>
									<tr>
										<td>
											<p>
												<i class="icon-user"></i> Ashley Jacobs
											</p>
										</td>
										<td>
											<p>Amount: $1,192</p>
										</td>
										<td>
											<p>Date: 1/19/2012</p> <a href="#">View Transaction</a>
										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
					<div class="block span6">
						<p class="block-heading">Not Collapsible</p>
						<div class="block-body">
							<h2>Built with Less</h2>
							<p>The CSS is built with Less. There is a compiled version
								included if you prefer plain CSS.</p>
							<p>Fava bean jícama seakale beetroot courgette shallot
								amaranth pea garbanzo carrot radicchio peanut leek pea sprouts
								arugula brussels sprout green bean. Spring onion broccoli
								chicory shallot winter purslane pumpkin gumbo cabbage squash
								beet greens lettuce celery. Gram zucchini swiss chard mustard
								burdock radish brussels sprout groundnut. Asparagus horseradish
								beet greens broccoli brussels.</p>
							<p>
								<a class="btn btn-primary btn-large">Learn more &raquo;</a>
							</p>
						</div>
					</div>
				</div>
				
				<%@ include file="/pages/common/footer.jsp"%>
				<!--  
				<footer>
				<hr>
				<!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
				<!-- 
				<p class="pull-right">
					A <a href="http://www.portnine.com/bootstrap-themes"
						target="_blank">Free Bootstrap Theme</a> by <a
						href="http://www.portnine.com" target="_blank">Portnine</a>
				</p>
				<p>
					&copy; 2012 <a href="http://www.portnine.com" target="_blank">Portnine</a>
				</p>
				</footer>
				 -->

			</div>
		</div>
	</div>
	<script src="<%=path %>/js/bootstrap.js"></script>
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