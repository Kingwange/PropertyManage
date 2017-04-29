
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'updateBuilding.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<body>

	<div class="am-cf am-padding">
		<div class="am-fl am-cf">
			<strong class="am-text-primary am-text-lg">用户信息管理</strong> / <small><a
				href="user.action">用户信息</a></small> / <small>用户信息修改</small>
		</div>
	</div>
	<div class="am-tabs am-margin">
		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
				<form class="am-form" id="updateUsersForm" method="post">
					<input type="hidden" name="id" value='<s:property value="id"/>'>
					<hr>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*用户姓名</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="username"
								width="50" value='<s:property value="username"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*密码</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" id="password" name="password" placeholder=""
								value='<s:property value="password"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*用户类别</div>
						<div class="am-u-sm-4 am-text-left">
							<select class="am-input-sm" name="authority" required="required">
								<s:if test="authority=='B'.toString()">
									<option value="B">普通住户</option>
									<option value="C">维修人员</option>
									
									
								</s:if>
								<s:elseif test="authority=='C'.toString()">
									<option value="C">维修人员</option>
									<option value="B">普通住户</option>
									
								</s:elseif>
								<s:else><option value="A">超级管理员</option></s:else>
							</select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>

					
					<br>
					<br>
					<div class="owerupdate">
						<button style="" type="button"
							class="am-btn am-btn-primary am-btn-xs"
							onclick="updateUsers()" id="buttonBtn">确认修改</button>
					</div>
				</form>

			</div>
		</div>
	</div>


</body>
</html>

