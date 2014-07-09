<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zh.core.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title></title>
	</head>
	<body style="padding: 5px; overflow: hidden;">
		<fieldset style="height: 90%">
			<legend style="font-size: 20.5px;">
				发生错误
			</legend>
			<div style="text-align:center;">
				<s:if test="%{#request.errorMsg==null}">
				 	<img src="<%=basePath%>default/images/stop.png"/><p style="font-size: 30.5px;">系统发生了未知的错误!请联系管理员</p>
				</s:if>
				<s:else>
				 	<img src="<%=basePath%>default/images/stop.png"/><p style="font-size: 30.5px;">${requestScope.errorMsg}</p>
				</s:else>
			</div>
		</fieldset>

	</body>
</html>
