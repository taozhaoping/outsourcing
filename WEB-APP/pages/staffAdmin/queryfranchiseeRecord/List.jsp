<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib uri="/struts-tags" prefix="s"%>
<%@  page import="com.zh.base.util.JspUtil" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="getText('COM.OSFI.WINDOW.TITLE')" /></title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/theme.css">
<link rel="stylesheet" href="<%=path%>/css/font-awesome.css">
<script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=path%>/js/jqPaginator.min.js"></script>
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
<link href="<%=path%>/img/favicon_32.ico" rel="bookmark" type="image/x-icon"/>
<link href="<%=path%>/img/favicon_32.ico" rel="icon" type="image/x-icon" />
<link href="<%=path%>/img/favicon_32.ico" rel="shortcut icon" type="image/x-icon"/>
<link rel="stylesheet" href="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.css"/>
<link rel="stylesheet" href="<%=path%>/js/select2/select2.css">
</head>
<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="">
<jsp:useBean id="userName" class="com.zh.base.util.JspUtil" scope="session"></jsp:useBean>
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
					<span class="number"><s:property value="#session.taskSize"/></span>tasks
				</p>
				<p class="stat">
					<span class="number">15</span>waiting
				</p>
			</div>

			<h1 class="page-title" id="menu2Name">&nbsp;</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="<%=path%>/home/main.jspa">主页</a> <span class="divider">/</span></li>
			<li class="active" id="navigation"></li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="row-fluid">
				
					<div>
						<form action="${menu2Id}.jspa?menuId=${menuId}&menu2Id=${menu2Id}" id="queryForm" method="post">
							<input id="curPage" name="pageInfo.curPage" value="${pageInfo.curPage}" type="hidden"/>
							<input type="hidden" name="spaceId" value="${spaceId}">
							<dir class="row">
								<div class="span5">
									<label class="control-label">流程编号：
										<input type="number" maxlength="15" id="inputId" name="franchiseeRecordVW.id"
											value="${franchiseeRecordVW.id}" class="input-large">
										</label>
								</div>
								<div class="span4">
									<label class="control-label">预约类型：
									<select id="contracttype" class="input-large" data-required="true" placeholder="合同种类"
													name="franchiseeRecordVW.type">
													<option value="">请选择</option>
													<option value="1">已经签约</option>
													<option value="2">正在洽谈</option>
													<option value="3">有意向</option>
													<option value="4">潜在外教</option>
									</select>
									</label>	
								</div>
							</dir>
							
							<dir class="row">
								<div class="span5">
									<label class="control-label">创建时间：
										<input type="text" id="createTimeStart"
											name="franchiseeRecordVW.createtimeStart"
											value="${franchiseeRecordVW.createtimeStart}"
											class="form_datetime input-small">
											至
										<input type="text" id="createTimeEnd"
											name="franchiseeRecordVW.createtimeEnd"
											value="${franchiseeRecordVW.createtimeEnd}"
											class="form_datetime input-small">
									</label>
								</div>
								<div class="span4">
									<label class="control-label">预约时间：
										<input type="text" id="reserveDateStart"
											name="franchiseeRecordVW.reserveDateStart"
											value="${franchiseeRecordVW.reserveDateStart}"
											class="form_datetime input-small">
											至
										<input type="text" id="reserveDateEnd"
											name="franchiseeRecordVW.reserveDateEnd"
											value="${franchiseeRecordVW.reserveDateEnd}"
											class="form_datetime input-small">
									</label>
								</div>
							</dir>
							<dir class="row">
								<div class="span5">
										
								</div>
								<div class="span4">
									
								</div>
								
								<div class="span3">
									<button class="btn" type="button" id="btnSubmit">
										<i class=" icon-search"></i> 搜索
									</button>
			
									<button class="btn" type="button" id="btnClear">
										<i class="icon-remove"></i> 清除
									</button>
								</div>
							</dir>
						</form>
					</div>
					
					
					<div class="well">
						<table class="table">
							<thead>
								<tr>
									<th>流程编号</th>
									<th>姓名</th>
									<th>流程发起人</th>
									<th>联系状态</th>
									<th>联系时间</th>
									<th>预约时间</th>
									<th style="width: 32px;">操作</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="franchiseeRecordVWList" var="tp" status="index">
									<tr>
										<td>
											<a href="<%=path%>/${spaceId}/${menu2Id}!editor.jspa?formId=<s:property value='#tp.id'/>&menuId=${menuId}&menu2Id=${menu2Id}&spaceId=${spaceId}">
												<s:property value="#tp.id"/>
											</a>
										</td>
										<td><s:property value="#tp.name"/></td>
										<td>
											<s:set id="userNameid" value="#tp.createUserId"></s:set>
											<%=userName.queryUserName(request.getAttribute("userNameid").toString()) %>
										</td>
										<td>
											<s:if test="#tp.type==1">
												已经签约
											</s:if>
											<s:elseif test="#tp.type==2">
												正在洽谈
											</s:elseif>
											<s:elseif test="#tp.type==3">
												有意向
											</s:elseif>
											<s:elseif test="#tp.type==4">
												潜在外教
											</s:elseif>
										</td>
										<td><s:property value="#tp.createdate"/> </td>
										<td><s:property value="#tp.reserveDate"/> </td>
										<td>
											<a href="<%=path%>/<s:property value="spaceId"/>/${menu2Id}!editor.jspa?formId=<s:property value='#tp.id'/>&menuId=${menuId}&menu2Id=${menu2Id}&spaceId=${spaceId}"><i
												class="icon-pencil"></i></a>
										</td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
					<div class="pagination">
						<ul id="pagination">
						</ul>					
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="/pages/common/footer.jsp"%>
	<script src="<%=path%>/js/bootstrap.js"></script>
	<script src="<%=path %>/js/collapsePulg.js"></script>
	<script src="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.js"></script>
	<script src="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="<%=path%>/js/select2/select2.js"></script>
	<script src="<%=path%>/js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		var id='${menuId}';
		var menuid='${menu2Id}';
		var totalPage = ${pageInfo.totalPage};
		var totalRow = ${pageInfo.totalRow};
		var pageSize = ${pageInfo.pageSize};
		var curPage = ${pageInfo.curPage};
		$(function() {
			$('.demo-cancel-click').click(function() {
				return false;
			});
			var headText = $("#" + menuid).text();
			$("#menu2Name").text(headText);
			$("#navigation").text(headText);
			//展开一级菜单
			collapseMenu(id);
			$("#contracttype").select2();
			//日期控件
			$(".form_datetime").datetimepicker({
				language : 'zh-CN',
				format : 'yyyy-mm-dd',
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : true
			});
			
			//提交按钮
			$("#btnSubmit").click(function(){
				$('#curPage').val("");
				$('#queryForm').submit();
			});
			
			//清空按钮
			$("#btnClear").click(function(){
				$("#inputId").val("");
				$("#inputDescription").val("");
				$("#inputState").val("");
				$("#createTimeStart").val("");
				$("#createTimeEnd").val("");
				$('#curPage').val("");
			});
			
			$.jqPaginator('#pagination', {
				//设置分页的总页数
		        totalPages: totalPage,
		        //设置分页的总条目数
		        totalCounts:totalRow,
		        pageSize:pageSize,
		        //最多显示的页码
		        visiblePages: 10,
		        currentPage: curPage,
		        onPageChange: function (num, type) {
		           if("init"==type){
		        	 	return false;  
		        	}
		           	$('#curPage').val(num);
		        	$('#queryForm').submit();
		        	//document.getElementsByName("operateForm")[0].submit(); 
		        }
		    });
			
		});
		
		function addObject(name)
		{
			var url=url + "?menuId="+id+"&menu2Id="+menuId;
			
		}
		
	</script>
</body>
</html>