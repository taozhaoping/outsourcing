<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<div class="navbar">
	<div class="navbar-inner">
		<ul class="nav pull-right">
			<li>
				<a href="#" class="hidden-phone visible-tablet visible-desktop" role="button">设置</a>
			</li>
			<li id="fat-menu" class="dropdown">
				<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
					<i	class="icon-user"></i>${sessionScope.userInfo.loginName} <i class="icon-caret-down"></i>
				</a>
				<ul class="dropdown-menu">
					<li><a tabindex="-1" href="#">我的账号</a></li>
					<li class="divider"></li>
					<li><a tabindex="-1" class="visible-phone" href="#">设置</a></li>
					<li class="divider visible-phone"></li>
					<li><a tabindex="-1" href="#">退出</a></li>
				</ul>
			</li>
		</ul>
		<a class="brand" href="#"><span class="first">Your</span>
			<span class="second">信息管理平台</span></a>
	</div>
</div>
