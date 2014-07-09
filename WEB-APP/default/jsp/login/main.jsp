<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<title></title>
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<script type="text/javascript">
	function locale(url, loca_home) {
		if ("zh_CN" == loca_home) {
			window.location.href = url + "en_US";
		} else {
			window.location.href = url + "zh_CN";
		}
	}
</script>
</head>
<body style="padding: 0px; background: #EAEEF5;">
	<div id="pageloading"></div>
	<div class="l-topmenu" style="width: 99%; margin: 0 auto;">
		<div class="l-topmenu-logo">易口英语</div>
		<div class="l-topmenu-welcome">

			<a class="l-scroll"
				href="javascript:f_addTab('updatepassword','<s:text name="COM.SCHOOL.LOGIN.UPDATE.PASSWORD" />','home/main!initPwd.jspa');"><s:text
					name="COM.SCHOOL.LOGIN.UPDATE.PASSWORD" /></a> <span class="space">|</span>
			<!-- <a  href="javascript:locale('main.jspa?language=','${language}');" ><s:text name="COM.SCHOOL.MAIN.LOCALE" /></a>
				<span class="space">|</span> -->
			<a
				href="javascript:window.location.href='<%=path%>/login/login.jspa';"
				class="l-scroll">退出</a>
		</div>
		<input type="hidden" name="language" value="${language}" />
	</div>
	<div id="layout1" style="width: 99%; margin: 0 auto; margin-top: 4px;">


	</div>
	<div style="height: 32px; line-height: 32px; text-align: center;">
		Copyright © 2013 email: taozhaoping@gmail.com</div>
	<div style="display: none"></div>
</body>
</html>
