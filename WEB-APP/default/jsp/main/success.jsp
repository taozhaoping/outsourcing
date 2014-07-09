<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

		<title>操作成功</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link
			href="<%=basePath%>default/ligerUI/ligerUI/skins/Gray/css/all.css"
			rel="stylesheet" type="text/css" />
		<script src="<%=basePath%>default/ligerUI/jquery/jquery-1.3.2.min.js"
			type="text/javascript"></script>
			<script src="<%=basePath%>default/ligerUI/ligerUI/js/core/base.js"
			type="text/javascript"></script>
		<script
			src="<%=basePath%>default/ligerUI/ligerUI/js/plugins/ligerButton.js"
			type="text/javascript"></script>
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>
	<SCRIPT type="text/javascript">
	function f_removeTab(tabid) {
       	 top.tab.removeTabItem(tabid);
       }
	</SCRIPT>
	<style type="text/css">
body {
	font-size: 12px;
}
</style>
	<body>
		<fieldset style="margin: 5px">
			<legend style="font-size: 18px;">
				<s:label key="COM.SCHOOL.LOGIN.UPDATE.PASSWORD" />
			</legend>
			<div align="center">
				<input type="hidden" name="tabID" id="tabID" />
				<s:label name="messages" cssStyle="align:center;font-size: 25px;"></s:label>
			</div>
			<div align="center">
				<input type="button"
					value="<s:text name="COM.SCHOOL.DEFAULT.SLOCE"/>" class="l-button"
					onclick="f_removeTab('${tabID}')" />
			</div>
		</fieldset>
	</body>
</html>
