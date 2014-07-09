<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zh.core.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 1.0 Transitional//EN">
<html>
	<head>
		<link
			href="../default/ligerUI/ligerUI/skins/Aqua/css/ligerui-all.css"
			rel="stylesheet" type="text/css" />
		<link
			href="../default/ligerUI/ligerUI/skins/Gray/css/all.css"
			rel="stylesheet" />
		<script src="../default/js/jquery/jquery-1.8.2.min.js"
			type="text/javascript"></script>
		<script src="../default/ligerUI/ligerUI/js/ligerui.all.js"
			type="text/javascript"></script>
		<script src="../default/js/main/jquery.form.js"
			type="text/javascript"></script>
		<script src="../default/js/main/LG.js"
			type="text/javascript"></script>
		<script src="../default/js/json/json2.js"
			type="text/javascript"></script>
		<script
			src="../default/ligerUI/jquery-validation/jquery.validate.min.js"
			type="text/javascript"></script>
		<script
			src="../default/ligerUI/jquery-validation/jquery.metadata.js"
			type="text/javascript"></script>
		<script src="../default/js/main/validator.js"
			type="text/javascript"></script>
		<s:if test="#session.language=='zh_CN'">
			<script
				src="../default/ligerUI/jquery-validation/messages_cn.js"
				type="text/javascript"></script>
		</s:if>
		<script>
	var mainform;
	$(function() {

		//表单底部按钮 
		LG.setFormDefaultBtn(cancel,save);

		mainform = $("form").ligerForm();


		//验证配置
		//mainform.attr("validate", true);
		$.metadata.setType("attr", "validate");
		LG.validate(mainform.form);

	});
	function save() {
		if (mainform.form.valid()) {
			mainform.form.ajaxSubmit( {
				dataType : 'json',
				success : function(data) {
					if (data.IsError) {
						LG.showError('错误:' + data.Message);
					} else {
						LG.showSuccess('保存成功', function() {
							LG.closeAndReloadParent(null, null);
						});
					}
				},
			beforeSend : function(a, b, c) {
				$.ligerDialog.waitting('正在保存中,请稍候...');
			},
			complete : function() {
				LG.hideLoading();
			},
			error : function(result) {
				LG.tip('发现系统错误：' + result.status);
				$.ligerDialog.closeWaitting();
			}
			});
		} else {
			LG.showInvalid();
		}
	}

	function cancel() {
		top.tab.removeSelectedTabItem();
	}
</script>
	</head>
	<body style="padding: 4px; overflow: hidden;">
		<fieldset style="height: 90%">
			<form class="l-form" id="mainform" action="main!updatepwd.jspa"
				method="post">
				<input type="hidden" ltype="hidden" id="userID" name="user.id" value="${user.id}"></input>
				<div class="l-group l-group-hasicon">
					<img
						src="../default/ligerUI/ligerUI/skins/icons/communication.gif" />
					<span> <s:label key="COM.SCHOOL.LOGIN.UPDATE.PASSWORD" /> </span>
					<div class="togglebtn"></div>
				</div>
				<ul class="l-fieldcontainer l-fieldcontainer-first">
					<li style="width: 150px; text-align: right; font-size: 14px;">
						<s:label key="COM.SCHOOLCONTORL.LOGIN.USERNAME" />
					</li>
					<li id="mainform1" style="width: 180px; text-align: left;">
						<div style="width: 178px; height: 23px;">
						<s:label name="user.userName" />
						</div>
						<div class="l-text-l"></div>
						<div class="l-text-r"></div>
					</li>
				</ul>
				<ul class="l-fieldcontainer l-fieldcontainer-first">
					<li style="width: 150px; text-align: right; font-size: 14px;">
						<s:label key="COM.SCHOOLCONTORL.LOGIN.NEWPASSWORD" />
					</li>
					<li id="mainform2" style="width: 180px; text-align: left;">
						<div style="width: 178px; height: 23px;">
							<input name="newPassWord" type="password" id="newPassWord" ltype="text" validate="{required:true,minlength:3,maxlength:10}" 
								style="width: 174px;" />
						</div>
					</li>
					<li style="width: 80px;">
						<span class="l-star"> * </span>
					</li>
				</ul>
				<ul class="l-fieldcontainer l-fieldcontainer-first">
					<li style="width: 150px; text-align: right; font-size: 14px;">
							<s:label key="COM.SCHOOLCONTORL.LOGIN.NEWPASSWORDTWO" />
					</li>
					<li id="mainform3" style="width: 180px; text-align: left;">
						<div style="width: 178px; height: 23px;">
							<input name="password2" type="password" id="password2" ltype="text" validate="{required:true,minlength:3,maxlength:10,equalTo:'#newPassWord'}"
								style="width: 174px;" />
						</div>
					</li>
					<li style="width: 80px;">
						<span class="l-star"> * </span>
					</li>
				</ul>
				<div style="display: none;">
				</div>
			</form>
			<div id="maingrid"></div>
		</fieldset>

	</body>
</html>
