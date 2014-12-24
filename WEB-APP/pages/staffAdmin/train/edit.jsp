<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
<link rel="stylesheet" href="<%=path%>/js/select2/select2.css">
<link rel="stylesheet"
	href="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.css">
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
<link href="<%=path%>/img/favicon_32.ico" rel="bookmark"
	type="image/x-icon" />
<link href="<%=path%>/img/favicon_32.ico" rel="icon" type="image/x-icon" />
<link href="<%=path%>/img/favicon_32.ico" rel="shortcut icon"
	type="image/x-icon" />
<link rel="stylesheet"
	href="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.css" />
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
					<span class="number"><s:property value="#session.taskSize" /></span>tasks
				</p>
				<p class="stat">
					<span class="number">15</span>waiting
				</p>
			</div>

			<h1 class="page-title" id="menu2Name">&nbsp;</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="<%=path%>/home/main.jspa">主页</a> <span
				class="divider">/</span></li>
			<li><span class="active" id="navigation1"></span></li>
		</ul>

		<div class="container-fluid">

			<div class="row-fluid">
				<div class="btn-toolbar">
					<button id="formButton" class="btn btn-primary" type="button">
						<i class="icon-save"></i> 保存
					</button>
					<a class="btn" id="backList" href="">
							返回</a>
					<div class="btn-group"></div>
					<input type="hidden" id="hasEditAuth" value="1">

				</div>
				<input type="hidden" id="tabID" name="tabID" value="${tabID}">
				<input type="hidden" id="formChanged" name="formChanged" value="0" />
				<div class="well">
					<ul class="nav nav-tabs">
						<li><a id="homeButt" href="#home" data-toggle="tab">基本信息</a></li>
						<s:if test="trainCourse.id!=null&&trainCourse.id!=''">
							<li><a id="contactrecordButt" href="#contactrecordtab"
								data-toggle="tab">人员名单</a></li>
						</s:if>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="home">
							<form id="editForm" class="form-horizontal"
								action="${menu2Id}!save.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}"> <input
									type="hidden" name="menu2Id" value="${menu2Id}"> <input
									type="hidden" name="trainCourse.id" value="${trainCourse.id}">
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="inputName">课程名称：</label>
											<div class="controls">
												<input type="text" data-required="true" desc="姓名"
													maxlength="15" id="inputName" name="trainCourse.name"
													value="${trainCourse.name}" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="trainCoursetrainType">课程类型：</label>
											<div class="controls">
												<select id="trainCoursetrainType" class="input-large"
													desc="课程种类" name="trainCourse.trainType">
													<option value="A">A类</option>
													<option value="B">B类</option>
													<option value="C">C类</option>
												</select>
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="userId">讲师：</label>
											<div class="controls">
												<select id="userId" class="input-large"
													name="trainCourse.userId" data-required="true" desc="负责人">
													<option id="userIdOption" value=""></option>
												</select>
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputenabled">状态：</label>
											<div class="controls">
												<select id="inputenabled" class="input-large" desc="状态"
													name="trainCourse.enabled">
													<option value="0">有效</option>
													<option value="1">无效</option>
												</select>
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputyearbirth">预定时间：</label>
											<div class="controls">
												<input type="text" size="15" id="inputBirthday"
													name="trainCourse.scheduleDate"
													value="${trainCourse.scheduleDate}"
													desc="开课时间" readonly class="form_datetime input-large">

											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputcourseDate">课时：</label>
											<div class="controls">
												<select id="inputcourseDate" class="input-large" desc="课时"
													name="trainCourse.courseDate">
													<option value="1">1小时</option>
													<option value="2">1个半小时</option>
													<option value="3">2小时</option>
													<option value="4">2个半小时</option>
												</select>
											</div>
										</div>
									</div>

								</dir>

								<dir class="row">
									<div class="span9">
										<div class="control-group">
											<label class="control-label" for="inputnationality">课程描述：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputnationality"
													name="trainCourse.description"
													value="${trainCourse.description}" desc="描述"
													class="input-xxlarge">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span9">
										<div class="control-group">
											<label class="control-label" for="inputCurrentlocation">地址：</label>
											<div class="controls">
												<input type="text" id="inputCurrentlocation"
													name="trainCourse.address" value="${trainCourse.address}"
													desc="培训地址" class="input-xxlarge">
											</div>
										</div>
									</div>

								</dir>


							</form>
						</div>
						<!-- 报名信息 -->
						<div class="tab-pane fade" id="contactrecordtab">
							<form id="contactrecordForm" class="form-horizontal"
								action="${menu2Id}!saveContactRecord.jspa" method="post">
								<table class="table">
									<thead>
										<tr>
											<th style="width: 32px;">序号</th>
											<th style="width: 240px;">联系时间</th>
											<th>描述</th>
										</tr>
									</thead>

									<tbody id="ContactRecordSearch">
										<tr>
											<!-- 保存证件列表 -->
											<td><input type="hidden" name="formId"
												value="${entryProcess.id}"> <input type="hidden"
												name="menu2Id" value="${menu2Id}"> <input
												type="hidden" name="menuId" value="${menuId}"></td>
											<td></td>
											<td><input style="width: 70%" type="text"
												id="contactRecordDescr" name="contactRecord.descr" /></td>

										</tr>
										<s:iterator value="contactRecordList" var="tp" status="index">
											<tr>
												<td><s:property value="#tp.id" /></td>
												<td><s:property value="#tp.createdate" /></td>
												<td><s:property value="#tp.descr" /></td>
											</tr>
										</s:iterator>
									</tbody>

								</table>
							</form>
							<div class="pagination">
								<ul id="pagination">
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div>
		<form action="${menu2Id}!editor.jspa" id="queryForm" method="post">
			<input id="curPage" name="pageInfo.curPage"
				value="${pageInfo.curPage}" type="hidden" /> <input type="hidden"
				name="formId" value="${entryProcess.id}"> <input
				type="hidden" name="menu2Id" value="${menu2Id}"> <input
				type="hidden" name="menuId" value="${menuId}">
		</form>
	</div>

	<div class="hide">
		<a id="Ejectfirm" name="Ejectfirm" href="#forMchangefirm"
			data-toggle="modal"></a>
	</div>

	<div class="modal small hide fade" id="forMchangefirm" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">警告</h3>
		</div>
		<div class="modal-body">
			<p class="error-text">
				<i class="icon-warning-sign modal-icon"></i>当前页面已经修改过,请先保存."确认" 保存
				"取消" 不保存
			</p>
		</div>
		<div class="modal-footer">
			<button class="btn btn-danger" data-dismiss="modal"
				id="formChangefirmBtn">确认</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		</div>
	</div>

	<%@ include file="/pages/common/footer.jsp"%>
	<script src="<%=path%>/js/bootstrap.js"></script>
	<script src="<%=path%>/js/collapsePulg.js"></script>
	<script src="<%=path%>/js/common.js"></script>
	<script src="<%=path%>/js/jquery-validate.js"></script>
	<script src="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.js"></script>
	<script src="<%=path%>/js/json2.js"></script>
	<script src="<%=path%>/js/select2/select2.js"></script>
	<script src="<%=path%>/js/select2/select2_locale_zh-CN.js"></script>
	<script
		src="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		var id = '${menuId}';
		var menuId = '${menu2Id}';
		var row_count = 0;
		var url = $("#" + menuId).attr('url');
		var headText = $("#" + menuId).text();
		$("#navigation1").text(headText);
		//当前tbs
		var currTab = tabID;
		var totalPage = ${pageInfo.totalPage};
		var totalRow = ${pageInfo.totalRow};
		var pageSize = ${pageInfo.pageSize};
		var curPage = ${pageInfo.curPage};

		var localObj = window.location;
		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol + "//" + localObj.host + "/"
				+ contextPath;
		$("select").select2();
		selectUsers("userId");
		
		$("#userId").val("${trainCourse.userId}").trigger("change");
		
		$("#trainCoursetrainType").val("${trainCourse.trainType}").trigger(
		"change");

		$("#inputenabled").val("${trainCourse.enabled}").trigger("change");

		$("#inputcourseDate").val("${trainCourse.courseDate}")
		.trigger("change");
		
		
		$(".form_datetime").datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd hh:ii:00',
			weekStart : 1,
			todayBtn : 1,
			todayHighlight : 1,
			//startView : 2,
			//minView : 2,
			autoclose : true
		});

		//进入指定的tbs
		var tabID = "${tabID}";
		if (null != tabID && "" != tabID) {
			$("#" + tabID).parent().addClass("active");
			$("#" + tabID.substring(0, tabID.length - 4) + "tab").removeClass(
					"fade").addClass("active");
		} else {
			tabID = "homeButt";
			$("#tabID").val("homeButt");
			$("#homeButt").parent().addClass("active");
			$("#home").removeClass("fade").addClass("active");
		}

		//tab页签添加事件
		$("li a[data-toggle='tab']").click(function() {
			ischangeForm(this.id);
		});
		//提交按钮
		$("#formButton").click(function() {
			currTab = $("#tabID").val();
			saveForm();
		});

		$("#formChangefirmBtn").click(function() {
			saveForm();
		});
	
			//判断表单是否修改过
			$("form :input").change(function() {
				$("#formChanged").val("1");
			});

			//所有时间控件变更
			$(".form_datetime").change(function() {
				$("#formChanged").val("1");
			});

			//所有select控件变更
			$("tbody select").change(function() {
				$("#formChanged").val("1");
			});

		//判读当前tab，需要保存那个form
		function saveForm() {
			var action;
			if ("homeButt" == currTab) {
				action = $("#editForm").attr("action");
				setTabID("editForm", action);
				//validate = $('#editForm').validate();
				$("#editForm").submit();
			} else if ("contactrecordButt" == currTab) {

				action = $("#contactrecordForm").attr("action");
				setTabID("contactrecordForm", action);
				$("#contactrecordForm").submit();
			}
		}

		/*判断当前form是否变更*/
		var entryProcessId = "${entryProcess.id}";
		function ischangeForm(id) {
			//获取当前需要保存的tabid
			currTab = $("#tabID").val();
			//设置新的tab
			$("#tabID").val(id);
			//判断是否变更过
			if ("1" == $("#formChanged").val()) {
				$("#Ejectfirm").click();
				$("#formChanged").val("0");
			}
		}

		function setTabID(name, action) {
			var index = action.indexOf("?tabID=");
			actionName = action;
			if (index > 0) {
				actionName = action.substring(0, index);
			}
			$("#" + name).attr("action",
					actionName + "?tabID=" + $("#tabID").val());
		}
	</script>
</body>
</html>