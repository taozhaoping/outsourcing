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
		<link
			href="<%=basePath%>default/ligerUI/ligerUI/skins/Aqua/css/ligerui-all.css"
			rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>default/css/common.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>default/css/welcome.css" rel="stylesheet" type="text/css" />
</head>
<body style="padding:10px; overflow:auto; text-align:center;background:#FFFFFF;"> 
        <div class="navbar"><div class="navbar-l"></div><div class="navbar-r"></div>
        <div class="navbar-icon"><img src="<%=basePath%>default/images/hire_me.gif" /></div>
        <div class="navbar-inner"> 
        <b>
        	<s:if test="%{employee.job==1}">
        		销售主管:
        	</s:if>
        	<s:elseif test="%{employee.job==2}">
        		课程顾问:
        	</s:elseif>
        	<s:elseif test="%{employee.job==3}">
        		市场主管:
        	</s:elseif>
        	<s:elseif test="%{employee.job==4}">
        		市场专员:
        	</s:elseif>
        	<s:elseif test="%{employee.job==5}">
        		前台专员:
        	</s:elseif>
        <s:label name="employee.name" ></s:label>,<span>欢迎使用易口英语网站管理系统!</span></b>
        </div>
        </div>
        <div class="navline">
        </div>
	        <div style="font-family: sans-serif;font-size: 15px;"> 
	        <s:if test="%{employee.job==1}">
        		销售主管:
        	</s:if>
	       <s:elseif test="%{employee.job==2}">
        		<p>课程顾问:</p>
        		<br/>
        		<p>您当前的日工作总量为:${systemInfo.marketHouseWork}（个）</p>
        		<br/>
        		<p>您当前的日工作量还需要完成:${systemInfo.marketHouseWork - contactTimeSize}（个）</p>
        		<br/>
        		<p>您当前的已经完成的工作量:${contactTimeSize}（个）</p>
        		<br/>
        		<p>您今天已预约的客户数量:${theNextcontactSize}（个）</p>
        	</s:elseif>
        	<s:elseif test="%{employee.job==3}">
        		市场主管:
        	</s:elseif>
        	<s:elseif test="%{employee.job==4}">
        		市场专员:
        	</s:elseif>
        	<s:elseif test="%{employee.job==5}">
        		前台专员:
        	</s:elseif>
	        </div>
        <div class="navline">
        </div>
           <div class="withicon">
            <div class="icon"> 
                <img src="<%=basePath%>default/images/communication.gif" /></div>
            <span><b>该系统是SSI开发的一套客户资源管理系统，欢迎体验。</b></span>
        </div>
           <p class="p1"><b>特别说明</b>：此程序版权归作者所有，不允许进行任何传播！如有问题，请发邮件至taozhaoping@gmail.com</p>
          
</body>
</html>

