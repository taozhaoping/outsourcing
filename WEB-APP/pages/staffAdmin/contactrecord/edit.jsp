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
					<a class="btn" id="backList" href=""> 返回</a> <input type="hidden"
						id="hasEditAuth" value="1">

				</div>
				<input type="hidden" id="tabID" name="tabID" value="${tabID}">
				<input type="hidden" id="formChanged" name="formChanged" value="0" />
				<s:set name="ProcessId"
					value="technologicalProcess.id!=null&&technologicalProcess.id!=''" />
				<div class="well">
					<ul class="nav nav-tabs">
						<li><a id="homeButt" href="#home" data-toggle="tab">基本信息</a></li>

						<li><a id="contactrecordButt" href="#contactrecordtab"
							data-toggle="tab">联系记录</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade" id="home">
							<form id="editForm" class="form-horizontal"
								action="${menu2Id}!save.jspa" method="post">
								<input type="hidden" name="menuId" value="${menuId}"> <input
									type="hidden" name="menu2Id" value="${menu2Id}"> <input
									type="hidden" name="spaceId" value="${spaceId}"> <input
									type="hidden" name="technologicalProcess.id"
									value="${technologicalProcess.id}">
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputId">编号：</label>
											<div class="controls">
												<input type="text" maxlength="35" disabled="disabled"
													id="inputId" value="${technologicalProcess.id}"
													class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="description">描述：</label>
											<div class="controls">
												<input type="text" id="description"
													name="technologicalProcess.description"
													value="${technologicalProcess.description}"
													placeholder="描述" class="input-large">
											</div>
										</div>
									</div>

								</dir>
								<dir class="row">
									<div class="span5 pull-left">
										<div class="control-group">
											<label class="control-label" for="inputName">姓名：</label>
											<div class="controls">
												<input type="text" placeholder="姓名" maxlength="35"
													id="inputName" name="technologicalProcess.name"
													value="${technologicalProcess.name}" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputEnglishname">英文名：</label>
											<div class="controls">
												<input type="text" id="inputEnglishname"
													name="technologicalProcess.englishname"
													value="${technologicalProcess.englishname}"
													data-required="true" placeholder="英文名" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputnationality">国籍：</label>
											<div class="controls">
												<input type="text" maxlength="35" id="inputnationality"
													name="technologicalProcess.nationality"
													value="${technologicalProcess.nationality}"
													placeholder="国籍" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputCurrentlocation">目前所在地(国家)：</label>
											<div class="controls">
												<input type="text" id="inputCurrentlocation"
													name="technologicalProcess.currentlocation"
													value="${technologicalProcess.currentlocation}"
													placeholder="目前所在地(国家)" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputyearbirth">出生年份：</label>
											<div class="controls">
												<input type="text" id="inputyearbirth"
													name="technologicalProcess.yearbirth"
													value="${technologicalProcess.yearbirth}"
													placeholder="出生年份" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputBirthday">生日：</label>
											<div class="controls">
												<input type="text" size="35" id="inputBirthday"
													name="technologicalProcess.birthday"
													value="<s:date name="technologicalProcess.birthday" format="yyyy-MM-dd" />"
													placeholder="生日" readonly class="form_datetime input-large">
											</div>
										</div>
									</div>

								</dir>

								<dir class="row">
									<div class="span5 left">
										<div class="control-group">
											<label class="control-label" for="contracttype">合同种类：</label>
											<div class="controls">
												<select id="contracttype" class="input-large"
													placeholder="合同种类" name="technologicalProcess.contracttype">
													<option value=""></option>
													<option value="A">A类</option>
													<option value="B">B类</option>
													<option value="C">C类</option>
												</select>
											</div>
										</div>
									</div>

									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputContractdate">合同有效期：</label>
											<div class="controls">
												<input type="text" id="inputContractdate"
													name="technologicalProcess.contractdate"
													value="${technologicalProcess.contractdate}"
													placeholder="合同有效期" readonly
													class="form_datetime input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5 left">
										<div class="control-group">
											<label class="control-label" for="inputPassportno">护照号：</label>
											<div class="controls">
												<input type="text" maxlength="35" id="inputPassportno"
													name="technologicalProcess.passportno"
													value="${technologicalProcess.passportno}"
													placeholder="护照号" class="input-large">
											</div>
										</div>
									</div>

									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputPassportnodate">护照有效期：</label>
											<div class="controls">
												<input type="text" id="inputPassportnodate"
													name="technologicalProcess.passportnodate"
													value="${technologicalProcess.passportnodate}"
													placeholder="护照有效期" readonly
													class="form_datetime input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputMail">电子邮箱：</label>
											<div class="controls">
												<input type="text" maxlength="35" id="inputMail"
													name="technologicalProcess.mail"
													value="${technologicalProcess.mail}" placeholder="电子邮箱"
													class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputPhone">手机号码：</label>
											<div class="controls">
												<input type="number" id="inputPhone"
													name="technologicalProcess.Phone"
													value="${technologicalProcess.phone}" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputWechat">WeChat：</label>
											<div class="controls">
												<input type="text" id="inputWechat"
													name="technologicalProcess.wechat"
													value="${technologicalProcess.wechat}" class="input-large">
											</div>
										</div>
									</div>

									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputSkype">Skype：</label>
											<div class="controls">
												<input type="text" id="inputSkype"
													name="technologicalProcess.skype"
													value="${technologicalProcess.skype}" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputWorkuserid">创建者：</label>
											<div class="controls">
												<s:set id="userNameid"
													value="technologicalProcess.workuserid"></s:set>
												<input type="text" id="inputWorkuserid" disabled="disabled"
													name="technologicalProcess.workUserName"
													value="${technologicalProcess.workUserName}" readonly
													class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputState">当前状态：</label>
											<div class="controls">
												<input type="text" id="inputState"
													name="technologicalProcess.state" readonly="readonly"
													value="${technologicalProcess.state}" class="input-large">
											</div>
										</div>
									</div>
								</dir>

								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputDomicile">家庭地址：</label>
											<div class="controls">
												<input type="text" maxlength="35" id="inputDomicile"
													name="technologicalProcess.domicile"
													value="${technologicalProcess.domicile}" placeholder="户籍地址"
													class="input-large">
											</div>
										</div>
									</div>
								</dir>
							</form>
						</div>
						<!-- 证件信息 -->
						<div class="tab-pane fade" id="contactrecordtab">
							<form id="contactrecordForm" class="form-horizontal"
								action="${menu2Id}!saveContactRecord.jspa" method="post">
								<input type="hidden" name="formId"
									value="${technologicalProcess.id}"> <input
									type="hidden" name="menu2Id" value="${menu2Id}"> <input
									type="hidden" name="menuId" value="${menuId}"> <input
									type="hidden" name="spaceId" value="${spaceId}">
								<input type="hidden" id="reserveDate" name="contactRecord.reserveDate" value="">
								<input type="hidden" id="type" name="contactRecord.type" value="">
								<input type="hidden" id="descr" name="contactRecord.descr" value="">
								<button class="btn btn-small btn-primary" type="button"
									data-toggle="modal" data-target="#franchiseeRecordfirm">添加通话记录</button>
							</form>
								<table class="table">
									<thead>
										<tr>
											<th style="width: 32px;">序号</th>
											<th style="width: 240px;">联系时间</th>
											<th style="width: 200px;">类型</th>
											<th style="width: 240px;">预约时间</th>
											<th>描述</th>
										</tr>
									</thead>

									<tbody id="ContactRecordSearch">
										<s:iterator value="contactRecordList" var="tp" status="index">
											<tr>
												<td><s:property value="#tp.id" /></td>
												<td><s:property value="#tp.createdate" /></td>
												<td><s:if test="#tp.type==1">
													已经签约
												</s:if> <s:elseif test="#tp.type==2">
													正在洽谈
												</s:elseif> <s:elseif test="#tp.type==3">
													有意向
												</s:elseif> <s:elseif test="#tp.type==4">
													潜在外教
												</s:elseif></td>
												<td><s:date format="yyyy-MM-dd" name="#tp.reserveDate" /></td>
												<td><s:property value="#tp.descr" /></td>
											</tr>
										</s:iterator>
									</tbody>

								</table>
							
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

	<!-- 添加联系记录 -->
	<div class="modal small hide fade" id="franchiseeRecordfirm"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="startModalLabel1">联系记录添加</h3>
		</div>
		<div class="modal-body">
			<dir class="row">
				<div class="span3">
					<div class="control-group">
						<label class="control-label" for="popupcontactRecordType">预约类型：</label>
						<div class="controls">
							<select id="popupcontactRecordType" class="input-large"
								placeholder="预约类型" name="contactRecord.type">
								<option value="">请选择</option>
								<option value="1">已经签约</option>
								<option value="2">正在洽谈</option>
								<option value="3">有意向</option>
								<option value="4">潜在外教</option>
							</select>
						</div>
					</div>
				</div>

			</dir>
			<dir class="row">
				<div class="span3">
					<div class="control-group">
						<label class="control-label" for="popupcontactRecordReserveDate">预约时间：</label>
						<div class="controls">
							<input type="text" id="popupcontactRecordReserveDate"
								placeholder="预约时间" readonly class="form_datetime input-large">
						</div>
					</div>
				</div>

			</dir>
			<dir class="row">
				<div class="span4">
					<div class="control-group">
						<label class="control-label" for="popupcontactRecordDescr">描述：</label>
						<div class="controls">
							<textarea rows="5" id="popupcontactRecordDescr"></textarea>
						</div>
					</div>
				</div>

			</dir>
		</div>
		<div class="modal-footer">
			<button class="btn btn-danger" data-dismiss="modal"
				id="franchiseeRecordBtnConfirm">确认</button>
			<button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
		</div>
	</div>

	<div>
		<form action="${menu2Id}!editor.jspa" id="queryForm" method="post">
			<input id="curPage" name="pageInfo.curPage"
				value="${pageInfo.curPage}" type="hidden" /> <input type="hidden"
				name="formId" value="${technologicalProcess.id}"> <input
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
		var spaceId = '${spaceId}';
		var row_count = 0;
		var url = $("#" + menuId).attr('url');
		var headText = $("#" + menuId).text();
		$("#navigation1").text(headText);

		var totalPage = ${pageInfo.totalPage};
		var totalRow = ${pageInfo.totalRow};
		var pageSize = ${pageInfo.pageSize};
		var curPage = ${pageInfo.curPage};

		var localObj = window.location;
		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol + "//" + localObj.host + "/"
				+ contextPath;

		//基本信息
		$("select").select2();
		$("#contracttype").val("${technologicalProcess.contracttype}").trigger(
				"change");

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

		//提交按钮
		$("#formButton").click(function() {
			currTab = $("#tabID").val();
			saveForm();
		});

		$("#formChangefirmBtn").click(function() {
			saveForm();
		});
		
		$("#franchiseeRecordBtnConfirm").click(function(x) {
			var _contactRecordType = $("#popupcontactRecordType").val();
			var _contactRecordReserveDate = $("#popupcontactRecordReserveDate").val();
			var _contactRecordDescr = $("#popupcontactRecordDescr").val();
			descr = $.trim(_contactRecordDescr);
			if (descr == null || descr == "" || _contactRecordType == "" || _contactRecordReserveDate == ""){
				return;
			}else
			{
				action = $("#contactrecordForm").attr("action");
				$("#type").val(_contactRecordType);
				$("#reserveDate").val(_contactRecordReserveDate);
				$("#descr").val(descr);
				setTabID("contactrecordForm", action);
				$("#contactrecordForm").submit();
			}
	});

		//当前tbs
		var currTab = tabID;

		//判读当前tab，需要保存那个form
		function saveForm() {
			var action;
			if ("homeButt" == currTab) {
				action = $("#editForm").attr("action");
				setTabID("editForm", action);
				//validate = $('#editForm').validate();
				$("#editForm").submit();
			} 
		}

		/*判断当前form是否变更*/
		var entryProcessId = "${technologicalProcess.id}";
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

		$.jqPaginator('#pagination', {
			//设置分页的总页数
			totalPages : totalPage,
			//设置分页的总条目数
			totalCounts : totalRow,
			pageSize : pageSize,
			//最多显示的页码
			visiblePages : 10,
			currentPage : curPage,
			onPageChange : function(num, type) {
				if ("init" == type) {
					return false;
				}
				$('#curPage').val(num);
				action = $("#queryForm").attr("action");
				setTabID("queryForm", action);
				$('#queryForm').submit();
				//document.getElementsByName("operateForm")[0].submit(); 
			}
		});

		//tab页签添加事件
		$("li a[data-toggle='tab']").click(function() {
			ischangeForm(this.id);
		});

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