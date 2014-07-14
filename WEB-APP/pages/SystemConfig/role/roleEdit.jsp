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
	<%@ include file="/pages/common/sidebarWithNav.jsp"%> 

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

			<h1 class="page-title" id="menu2Name">&nbsp;</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="main.jspa">主页</a> <span class="divider">/</span></li>
			<li><a href="role.jspa" id="navigation"></a> <span class="divider">/</span></li>
			<li class="active">编辑</li>
		</ul>
		
		<div class="container-fluid">
		<form id="editForm" class="form-horizontal" action="role!save.jspa" method="post">
			<div class="row-fluid">
				<div class="row-fluid">
				
					<div class="btn-toolbar">
						<button class="btn btn-primary" type="submit">
							<i class="icon-save"></i> 保存
						</button>
						<a href="role.jspa" class="btn" id="backList">
							返回</a>
						<div class="btn-group"></div>
					</div>
					<div class="well">
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane active" id="home">
								<input type="hidden" name="role.id" value="${role.id}">
								<input type="hidden" name="menuId" value="${menuId}">
								<input type="hidden" name="menu2Id" value="${menu2Id}">
								
								<div class="control-group" id="name_div">
									<label class="control-label" for="nameInput">角色名称:</label>
									<div class="controls">
										<input type="text" data-required="true"  id="nameInput" name="role.name" value="${role.name}" class="input-xlarge">
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="authoritiesListInput">功能权限:</label>
									<div class="controls">
										<input type="text" data-required="true" id="authoritiesListInput" name="role.authoritiesList" value="${role.authoritiesList}" class="input-xlarge">
										<a href='#authoritiesListModal' data-toggle='modal' title="选择"><i class="icon-edit"></i></a>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="menuListInput">菜单权限:</label>
									<div class="controls">
										<input type="text" data-required="true" id="menuListInput" name="role.menuList" value="${role.menuList}" class="input-xlarge">
										<a href='#menuListInputModal' data-toggle='modal' title="选择"><i class="icon-edit"></i></a>
									</div>
								</div>
													
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 功能权限 -->
			<div class="modal small hide fade" id="authoritiesListModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">选择功能权限</h3>
				</div>
				<div class="modal-body" style="height: 150px;">
					<label class="checkbox" style="display: none;" id="authTemplate">
						<input type="checkbox" name="authorities"></label>
					<!-- 
					<s:iterator value="role.authoritiesList" id="auth">
						<label class="checkbox">
							<input type="checkbox" name="authorities" value="<s:property value="#auth.id"/>"><s:property value="#auth.name"/>
						</label>
					</s:iterator>
					 -->
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-danger" data-dismiss="modal" id="selectAuthBtn">确认</button>
				</div>
			</div>
			
			<!-- 菜单权限 -->
			<div class="modal small hide fade" id="menuListInputModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">选择菜单权限</h3>
				</div>
				<div class="modal-body" style="height: 250px;">
					<ul class="nav nav-list">
						<s:iterator value="role.menuList" id="menu">
							<li class="nav-header" >
								<label class="checkbox">
									<input type="checkbox" name="menus" value="<s:property value="#menu.id"/>"><s:property value="#menu.name"/>
								</label>
							</li>
							<s:iterator value="#menu.menuList" id="menu2">
							<li style="margin-left: 30px;">
								<label class="checkbox">
									<input type="checkbox" name="menus" value="<s:property value="#menu2.id"/>"><s:property value="#menu2.name"/>
								</label>
							</li>
							</s:iterator>
							<!-- 
							<label class="checkbox">
								<input type="checkbox" name="menus" value="<s:property value="#menu.id"/>"><s:property value="#menu.name"/>
							</label>
							 -->
						</s:iterator>
						<s:iterator value="role.menuList" id="menu">
							<li class="nav-header" >
								<label class="checkbox">
									<input type="checkbox" name="menus" value="<s:property value="#menu.id"/>"><s:property value="#menu.name"/>
								</label>
							</li>
							<s:iterator value="#menu.menuList" id="menu2">
							<li style="margin-left: 30px;">
								<label class="checkbox">
									<input type="checkbox" name="menus" value="<s:property value="#menu2.id"/>"><s:property value="#menu2.name"/>
								</label>
							</li>
							</s:iterator>
							<!-- 
							<label class="checkbox">
								<input type="checkbox" name="menus" value="<s:property value="#menu.id"/>"><s:property value="#menu.name"/>
							</label>
							 -->
						</s:iterator>
					</ul>
				</div>
				<div class="modal-footer">
					<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
					<button class="btn btn-danger" data-dismiss="modal" id="selectMenuBtn">确认</button>
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
			var url=$("#"+menuId).attr("url");
			
			$("#authoritiesListModal").on('show', function () {
				var localObj = window.location;
				var contextPath = localObj.pathname.split("/")[1];
				var basePath = localObj.protocol+"//"+localObj.host+"/"+contextPath;
				$.ajax({
					type: "POST",   //访问WebService使用Post方式请求
					url: basePath + "/home/role!authoritiesExecute.jspa", //调用WebService的地址和方法名称组合 ---- WsURL/方法名
					data: {},  //这里是要传递的参数，格式为 data: "{paraName:paraValue}",下面将会看到       
					dataType: 'json',   //WebService 会返回Json类型
					traditional: false,	//不要序列化参数
					error: function(err, textStatus){
						//alert("error: " + err + " textStatus: " + textStatus);
					},
					
					success: function(result) {//回调函数，result，返回值
						//填充到table中
						fillAuthList(result);
					}
				});
			});
			
			//展示权限列表
			function fillAuthList(authList){
				$("#authTemplate").nextAll("label").remove();
				//把查询的结果添加到DIV中
				for(var i = 0; i<authList.length; i++){
					var auth = authList[i];
					$("#authTemplate").clone(true).show().attr("id","auth"+auth.id)
					.children("input").val(auth.id).after(auth.name)
					.parent().insertAfter("#authTemplate");
				}
				
				var selAuthList = ${dataMap.authListJson};
				
				if(selAuthList != null && selAuthList != "" && selAuthList.length >0){
					for(var j = 0; j<selAuthList.length; j++){
						var selAuth = selAuthList[j];
						$("#auth"+selAuth.id).children("input").attr("checked", "checked");
					}
				}
			}
			
			
			//选择功能权限
			$("#selectAuthBtn").bind('click', function() {
				
			});
			
			//选择菜单权限
			$("#selectMenuBtn").bind('click', function() {
				
			});
			
		</script>
</body>
</html>