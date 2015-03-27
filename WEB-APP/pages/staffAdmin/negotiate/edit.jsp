<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  page import="com.zh.base.util.JspUtil"%>
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
	<jsp:useBean id="userName" class="com.zh.base.util.JspUtil"
		scope="session"></jsp:useBean>
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
					<a class="btn" id="backList" href=""> 返回 </a>
				</div>
				<div class="well">
					<ul class="nav nav-tabs">
						<li><a id="homeButt" href="#home" data-toggle="tab">基本信息</a></li>
						<li><a id="certificatesButt" href="#certificates"
							data-toggle="tab">证件信息</a></li>
						<li><a id="trainingButt" href="#training" data-toggle="tab">培训信息</a></li>
						<li><a id="activityButt" href="#activity" data-toggle="tab">公司活动</a></li>
						<li><a id="assignmentrecordButt" href="#assignmentrecord" data-toggle="tab">外派记录</a></li>
						<li><a id="annexButt" href="#annex" data-toggle="tab">附件</a></li>
					</ul>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane active" id="home">
							<form id="editForm" class="form-horizontal" action=""
								method="post">
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputId">编号：</label>
											<div class="controls">
												<input type="text" maxlength="15" disabled="disabled"
													id="inputId" name="personnel.id" value="${personnel.id}"
													class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="description">描述：</label>
											<div class="controls">
												<input type="text" id="description"
													name="personnel.description"
													value="${personnel.description}" data-required="true"
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
												<input type="text" data-required="true" placeholder="姓名"
													maxlength="15" id="inputName" name="personnel.name"
													value="${personnel.name}" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputEnglishName">英文名：</label>
											<div class="controls">
												<input type="text" id="inputEnglishName"
													name="personnel.englishName"
													value="${personnel.englishName}" data-required="true"
													placeholder="英文名" class="input-large">
											</div>
										</div>
									</div>
								</dir>
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputnationality">国籍：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputnationality"
													name="personnel.nationality"
													value="${personnel.nationality}" data-required="true"
													placeholder="国籍" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputDomicile">户籍地址：</label>
											<div class="controls">
												<input type="text" maxlength="15" id="inputDomicile"
													name="personnel.domicile" value="${personnel.domicile}"
													placeholder="户籍地址" class="input-large">
											</div>
										</div>
									</div>
								</dir>
								<dir class="row">
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputyearBirth">出生年份：</label>
											<div class="controls">
												<input type="text" id="inputyearBirth"
													name="personnel.yearBirth" value="${personnel.yearBirth}"
													data-required="true" placeholder="出生年份" class="input-large">
											</div>
										</div>
									</div>
									<div class="span5">
										<div class="control-group">
											<label class="control-label" for="inputBirthDay">生日：</label>
											<div class="controls">
												<input type="text" size="15" id="inputBirthDay"
													name="personnel.birthDay"
													value="<s:date name="personnel.birthDay" format="yyyy-MM-dd" />"
													data-required="true" placeholder="生日" 
													class="form_datetime input-large">
											</div>
										</div>
									</div>
									<dir class="row">
										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="contracttype">合同种类：</label>
												<div class="controls">
													<select id="contracttype" class="input-large"
														data-required="true" placeholder="合同种类"
														name="personnel.contracttype">
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
													<input type="text" id="inputContractDate"
														name="personnel.contractDate"
														value="<s:date name="personnel.contractDate" format="yyyy-MM-dd" />"
														data-required="true" placeholder="合同有效期"
														class="form_datetime input-large">
												</div>
											</div>
										</div>
									</dir>
									<dir class="row">
										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="inputPassportno">护照号：</label>
												<div class="controls">
													<input type="text" maxlength="15" id="inputPassportno"
														name="personnel.passportno"
														value="${personnel.passportno}" data-required="true"
														placeholder="护照号" class="input-large">
												</div>
											</div>
										</div>

										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="inputPassportDate">护照有效期：</label>
												<div class="controls">
													<input type="text" id="inputPassportDate"
														name="personnel.passportDate"
														value="<s:date name="personnel.passportDate" format="yyyy-MM-dd" />"
														data-required="true" placeholder="护照有效期"
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
													<input type="text" maxlength="15" id="inputMail"
														name="personnel.mail" value="${personnel.mail}" placeholder="电子邮箱" class="input-large">
												</div>
											</div>
										</div>
										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="inputPhone">手机号码：</label>
												<div class="controls">
													<input type="text" id="inputPhone" name="personnel.Phone"
														value="${personnel.phone}" class="input-large">
												</div>
											</div>
										</div>
									</dir>

									<dir class="row">
										<div class="span5">
											<div class="control-group">
												<label class="control-label" for="inputState">当前状态：</label>
												<div class="controls">
													<input type="text" id="inputState" name="personnel.state"
														readonly="readonly" value="${personnel.state}"
														class="input-large">
												</div>
											</div>
										</div>
									</dir>
								</dir>
							</form>
						</div>
						<!-- 证件信息 -->
						<div class="tab-pane fade" id="certificates">
							<table class="table">
								<thead>
									<tr>
										<th>编号</th>
										<th>证件类型</th>
										<th>证件编号</th>
										<th>办理日期</th>
										<th>领取日期</th>
										<th>有效日期</th>
										<th>结束日期</th>
									</tr>
								</thead>
								<tbody id="certificatesSearch">
									<s:iterator value="certificatesList" var="certificates" status="index">
									<tr>
										<td>
											<s:property value="#certificates.id"/>
										</td>
										<td>
											<s:if test="#certificates.type==1">
												护照
											</s:if>
											<s:elseif test="#certificates.type==2">
												毕业证
											</s:elseif>
											<s:elseif test="#certificates.type==3">
												简历
											</s:elseif>
											<s:elseif test="#certificates.type==4">
												Profile Form
											</s:elseif>
											<s:elseif test="#certificates.type==5">
												其他证件(TEFL、家属证明)
											</s:elseif>
											<s:elseif test="#certificates.type==6">
												合同word版本
											</s:elseif>
											<s:elseif test="#certificates.type==7">
												合同签字版本
											</s:elseif>
											<s:elseif test="#certificates.type==8">
												工作许可证
											</s:elseif>
											<s:elseif test="#certificates.type==9">
												邀请函
											</s:elseif>
											<s:elseif test="#certificates.type==10">
												公司邀请函
											</s:elseif>
											<s:elseif test="#certificates.type==11">
												外国专家证
											</s:elseif>
											<s:elseif test="#certificates.type==12">
												居留许可
											</s:elseif>
										</td>
										<td>
											<s:property value="#certificates.serialNumber"/>
										</td>
										<td>
											<s:property value="#certificates.handledate"/>
										</td>
										<td>
											<s:property value="#certificates.receivedate"/>
										</td>
										<td>
											<s:property value="#certificates.validstartdate"/>
										</td>
										<td>
											<s:property value="#certificates.validenddate"/>
										</td>
									</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>

					<!-- 外派记录 -->
					<div class="tab-pane fade" id="assignmentrecord">
						外派记录
					</div>
						<!-- 培训信息 -->
						<div class="tab-pane fade" id="training">

							<table class="table">
								<thead>
									<tr>
										<th>序号</th>
										<th>培训类型</th>
										<th>预定时间</th>
										<th>名称</th>
										<th>地址</th>
										<th>课程教师</th>
										<th>状态</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="trainCourseList" var="trainCourse"
										status="index">
										<tr>
											<td><s:property value="#index.index + 1" /></td>
											<s:if test="#trainCourse.trainType==1">
												<td>入职培训</td>
											</s:if>
											<s:elseif test="#trainCourse.trainType==2">
												<td>岗位培训</td>
											</s:elseif>
											<s:else>
												<td>其他培训</td>
											</s:else>
											<td><s:property value="#trainCourse.scheduleDate" /></td>
											<td><s:property value="#trainCourse.name" /></td>
											<td><s:property value="#trainCourse.address" /></td>
											<td><s:set id="userNameid" value="#trainCourse.userId"></s:set>
												<%=userName.queryUserName(request.getAttribute(
						"userNameid").toString())%>
											</td>
											<s:if test="#trainCourse.enabled==0">
												<td>有效</td>
											</s:if>
											<s:else>
												<td>无效</td>
											</s:else>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>

						<!-- 公司活动 -->
						<div class="tab-pane fade" id="activity">

							<table class="table">
								<thead>
									<tr>
										<th>序号</th>
										<th>活动名称</th>
										<th>预定时间</th>
										<th>集合地点</th>
										<th>活动耗时</th>
										<th>负责人</th>
										<th>电话</th>
										<th>状态</th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="activitiesList" var="activities"
										status="index">
										<tr>
											<td><s:property value="#index.index + 1" /></td>
											<td><s:property value="#activities.name" /></td>
											<td><s:property value="#activities.scheduleDate" /></td>
											<td><s:property value="#activities.setPlace" /></td>
											<td><s:property value="#activities.scheduleTime" /></td>
											<td><s:property value="#activities.userName" /></td>
											<td><s:property value="#activities.telephone" /></td>
											<s:if test="#activities.enabled==0">
												<td>有效</td>
											</s:if>
											<s:else>
												<td>无效</td>
											</s:else>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>

						<!-- 附件 -->
						<div class="tab-pane fade" id="annex">
							<table class="table">
								<thead>
									<tr>
										<th>编号</th>
										<th>文件名</th>
										<th>类型</th>
										<th>描述</th>
										<th>创建时间</th>
										<th style="width: 50px;">操作</th>
									</tr>
								</thead>
								<tbody id="FileInfoSearch">
									<s:iterator value="fileInfoList" var="fileInfo"
										status="index">
										<tr>
											<td><s:property value="#index.index + 1" /></td>
											<td><s:property value="#fileInfo.name" /></td>
											<td>
												<s:if test="#fileInfo.nametype==1">
													工作许可证
												</s:if>
												<s:elseif test="#fileInfo.nametype==2">
													邀请函
												</s:elseif>
												<s:elseif test="#fileInfo.nametype==3">
													公司邀请函
												</s:elseif>
												<s:elseif test="#fileInfo.nametype==4">
													暂住证
												</s:elseif>
												<s:elseif test="#fileInfo.nametype==5">
													工作签
												</s:elseif>
												<s:elseif test="#fileInfo.nametype==6">
													入境章页
												</s:elseif>
												<s:elseif test="#fileInfo.nametype==7">
													保险
												</s:elseif>
												<s:elseif test="#fileInfo.nametype==8">
													外国专家证
												</s:elseif>
												<s:elseif test="#fileInfo.nametype==8">
													居留许可
												</s:elseif>
												<s:property value="#fileInfo.nametype" />
											</td>
											<td><s:property value="#fileInfo.descr" /></td>
											<td><s:property value="#fileInfo.createdate" /></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<%@ include file="/pages/common/footer.jsp"%>
	<script src="<%=path%>/js/bootstrap.js"></script>
	<script src="<%=path%>/js/collapsePulg.js"></script>
	<script src="<%=path%>/js/jquery-validate.js"></script>
	<script src="<%=path%>/js/common.js"></script>
	<script src="<%=path%>/js/datetimepicker/bootstrap-datetimepicker.js"></script>
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
		$(".container-fluid input").attr("disabled", "disabled");
		$(".container-fluid select").attr("disabled", "disabled");
		$(".container-fluid button").attr("disabled", "disabled");
	</script>
</body>
</html>