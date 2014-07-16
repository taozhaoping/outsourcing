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
					<i	class="icon-user"></i>${sessionScope.userInfo.name} <i class="icon-caret-down"></i>
				</a>
				<ul class="dropdown-menu">
					<li><a tabindex="-1" href="#">我的账号</a></li>
					<li class="divider"></li>
					<li><a tabindex="-1" class="visible-phone" href="#">设置</a></li>
					<li class="divider visible-phone"></li>
					<li>
						<!-- 
						<a tabindex="-1" href="login/login.jspa">退出</a>
						 -->
						<a tabindex="-1" href="#quitConfirm" data-toggle="modal">退出</a>
					</li>
				</ul>
			</li>
		</ul>
		<a class="brand" href="#"><span class="first">Your</span>
			<span class="second">信息管理平台</span></a>
	</div>
</div>

<div class="modal small hide fade" id="quitConfirm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">退出系统</h3>
  </div>
  <div class="modal-body">
    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>您确认要退出系统吗?</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
    <button class="btn btn-danger" data-dismiss="modal" id="exitBtn">确认</button>
  </div>
</div>

<script type="text/javascript">
	$("#exitBtn").click( function () {
		var localObj = window.location;
		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol+"//"+localObj.host+"/"+contextPath;
		//跳转到登陆页面
		window.location.href = basePath + "/login/login.jspa";
	});
</script>
