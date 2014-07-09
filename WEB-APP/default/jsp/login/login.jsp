<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.zh.core.util.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN">
<html>
<head>
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link rel="stylesheet" href="../default/js/formValidator/css/validationEngine.jquery.css"
	type="text/css" />
<link rel="stylesheet" href="../default/js/formValidator/css/template.css" type="text/css" />
<script src="../default/js/formValidator/js/jquery-1.6.min.js" type="text/javascript">
<script src="../default/js/formValidator/js/languages/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">
	
</script>
<script src="../default/js/formValidator/js/jquery.validationEngine.js"
	type="text/javascript" charset="utf-8">
	
</script>
<script type="text/javascript" src="../default/js/login/login.js"></script>
<script src="../default/js/json/json2.js" type="text/javascript"></script>
<SCRIPT type="text/javascript">
	jQuery(document).ready(function() {
		// binds form submission and fields to the validation engine
		jQuery("#loginform").validationEngine(

		);
	});
	function showValidateCode() {
		var url = "../validatecode/validate!showValidateCode.jspa";
		$.ajax({
			type : "POST",
			url : url,
			success : function(data) {
				//var myObject = JSON2.parse(data);
				//var myObject = eval('(' + data + ')');
				document.getElementById('imgUrl').src = data.imgUrl;
			}
		});
	}
</SCRIPT>
<style type="text/css">
<!--
a {
	color: #008EE3
}

a:link {
	text-decoration: none;
	color: #008EE3
}

A:visited {
	text-decoration: none;
	color: #666666
}

A:active {
	text-decoration: underline
}

A:hover {
	text-decoration: underline;
	color: #0066CC
}

A.b:link {
	text-decoration: none;
	font-size: 12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}

A.b:visited {
	text-decoration: none;
	font-size: 12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}

A.b:active {
	text-decoration: underline;
	color: #FF0000;
}

A.b:hover {
	text-decoration: underline;
	color: #ffffff
}

.table1 {
	border: 1px solid #CCCCCC;
}

.font {
	font-size: 12px;
	text-decoration: none;
	color: #999999;
	line-height: 20px;
}

.input {
	font-size: 12px;
	color: #999999;
	text-decoration: none;
	border: 0px none #999999;
}

td {
	font-size: 12px;
	color: #007AB5;
}

form {
	margin: 1px;
	padding: 1px;
}

input {
	border: 0px;
	height: 26px;
	color: #007AB5;
	.
	unnamed1
	{
	border
	:
	thin
	none
	#FFFFFF;
}

.unnamed1 {
	border: thin none #FFFFFF;
}

select {
	border: 1px solid #cccccc;
	height: 18px;
	color: #666666;
	.
	unnamed1
	{
	border
	:
	thin
	none
	#FFFFFF;
}

body {
	background-repeat: no-repeat;
	background-color: #9CDCF9;
	background-position: 0px 0px;
}

.tablelinenotop {
	border-top: 0px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
	border-bottom: 0px solid #CCCCCC;
	border-left: 1px solid #CCCCCC;
}

.tablelinenotopdown {
	border-top: 1px solid #eeeeee;
	border-right: 1px solid #eeeeee;
	border-bottom: 1px solid #eeeeee;
	border-left: 1px solid #eeeeee;
}

.style6 {
	FONT-SIZE: 9pt;
	color: #7b8ac3;
}

-->
</style>
</head>
<body onload="showValidateCode();" style="background-color: #9CDCF9;">
	<table width="681" border="0" align="center" cellpadding="0"
		cellspacing="0" style="margin-top: 120px">
		<tr>
			<td width="353" height="259" align="center" valign="bottom"
				background="../default/images/login_1.gif">
				<table width="90%" border="0" cellspacing="3" cellpadding="0">
					<tr>
						<td align="right" valign="bottom" style="color: #05B8E4">
							版本号： <a target="_blank">v1.0</a> Copyright 2013
						</td>
					</tr>
				</table>
			</td>
			<td width="195" background="../default/images/login_2.gif">
				<form method="post" name="loginform" id="loginform"
					action="login!loginUser.jspa">
					<input type="hidden" name="token" value="${token}" />
					<table width="190" height="106" border="0" align="center"
						cellpadding="2" cellspacing="0">
						<tr>
							<td height="50" colspan="2" align="left">&nbsp;</td>
						</tr>
						<tr>
							<td width="60" height="30" align="left"><s:label
									key="COM.SCHOOLCONTORL.LOGIN.USERNAME" /></td>
							<td><input id="UserName" name="userInfo.userName"
								type="TEXT" class="validate[required]"
								style='background: url("../default/images/login_6.gif") repeat-x; border: solid 1px #27B3FE; height: 20px; width: 120px; background-color: #FFFFFF'
								size="14"></td>
						</tr>
						<tr>
							<td height="30" align="left"><s:label
									key="COM.SCHOOLCONTORL.LOGIN.PASSWORD" /></td>
							<td><input name="userInfo.userPassword" TYPE="PASSWORD"
								class="validate[required]"
								style="background: url(../default/images/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; width: 120px; background-color: #FFFFFF"
								id="Password" size="16"></td>
						</tr>
						<tr>
							<td height="30"><s:label
									key="COM.SCHOOLCONTORL.LOGIN.VERIFICATIONCODE" /></td>
							<td><input name="validecode" type="text" id="validecode"
								size="4" class="validate[required],length[4,4]"
								style="background: url(../default/images/login_6.gif) repeat-x; border: solid 1px #27B3FE; height: 20px; background-color: #FFFFFF">
								<img id="imgUrl" onclick="showValidateCode();" width="50"
								height="20" align="bottom" /></td>
						</tr>
						<tr>
							<td height="40" colspan="2" align="center"><img
								src='../default/images/tip.gif' width="16" height="16">
								请勿非法登陆！</td>
						</tr>
						<tr>
							<td colspan="2" align="center" nowrap="nowrap"><input id="submit"
								type="submit" name="submit" align="middle" 
								style="PADDING-BOTTOM: 5px;MARGIN: auto 1px auto 0px;PADDING-LEFT: 20px;PADDING-RIGHT: 20px;WHITE-SPACE: nowrap;BACKGROUND: url(../default/images/login_5.gif) no-repeat left center;CURSOR: pointer;PADDING-TOP: 5px;-moz-outline-style: none"
								value="提  交 " /> <input type="reset" name="reset"
								style="PADDING-BOTTOM: 5px;MARGIN: auto 1px auto 0px;PADDING-LEFT: 20px;PADDING-RIGHT: 20px;WHITE-SPACE: nowrap;BACKGROUND: url(../default/images/login_5.gif) no-repeat left center;CURSOR: pointer;PADDING-TOP: 5px;-moz-outline-style: none"
								value="取  消 "> <br /> <s:label id="errorMessage">${errorMessage}</s:label>
							</td>
							
						</tr>
						<tr>
							<td height="5" colspan="2"></td>
						</tr>
					</table>
				</form>
			</td>
			<td width="133" background='../default/images/login_3.gif'>
				&nbsp;</td>
		</tr>
		<tr>
			<td height="161" colspan="3"
				background='../default/images/login_4.gif'></td>
		</tr>
	</table>
</body>

</html>