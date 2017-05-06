<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>维修人员添加</title>
<meta name="keywords" content="ower">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="assets/css/amazeui.min.css" />
<link rel="stylesheet" href="assets/css/amazeui.datetimepicker.css" />
<link rel="stylesheet" href="assets/css/admin.css">
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.datetimepicker.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/app.js"></script>
</head>
<body>
	<div class="am-cf am-padding">
		<div class="am-fl am-cf">
			<strong class="am-text-primary am-text-lg">添加维修人员</strong> / <small>Add
				Maintainman</small>
		</div>
	</div>

	<hr />

	<div class="am-g">

		<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8"></div>

		<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
			<form class="am-form am-form-horizontal" id="addMaintainmanForm"
				data-am-validato>
				<div class="am-form-group">
					<label for="user-name" class="am-u-sm-3 am-form-label">姓名 </label>
					<div class="am-u-sm-9">
						<input type="text" style="width:150px" placeholder="姓名 / Name"
							name="name" onblur="checkName(this)" /> <small class="error"></small>
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-u-sm-3 am-form-label">维修类别
					</label>
					<div class="am-u-sm-9">
						<select style="width:150px" class="am-input-sm" name="repairtype"
							required="required" onblur="checktype(this)">
							<option value="">请选择</option>
							<option value="Wood">木工类</option>
							<option value="Air">空调类</option>
							<option value="Warm">气暖类</option>
							<option value="Lock">锁具</option>
							<option value="Water">水类</option>
							<option value="Power">电类</option>
							<option value="Other">其它</option>
						</select><small class="error"></small>
					</div>
				</div>

				<div class="am-form-group">
					<label for="user-phone" class="am-u-sm-3 am-form-label">联系方式
					</label>
					<div class="am-u-sm-9">
						<input type="text" style="width:250px" id="ower-tel"
							placeholder="输入你的联系方式 / Tel" name="tel" onblur="checkTel(this)">
						<small class="error"></small>
					</div>
				</div>
				<div class="am-form-group">
					<label class="am-u-sm-3 am-form-label">用户账号</label>
					<div class="am-u-sm-9">
						<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
							id="id" name="users.id" required="required" style="width:150px"
							onblur="checktype(this)">
							<option value="">请选择</option>
							<s:iterator value="userslist">
								<option value='<s:property value="id" />'><s:property
										value="username" /></option>
							</s:iterator>
						</select> <small class="error"></small><small id="maintain"></small>
					</div>
					<br> <br> <br>
					<div class="am-form-group">
						<div class="am-u-sm-9 am-u-sm-push-3">
							<button type="button" class="am-btn am-btn-primary"
								onclick="saveMaintainman()">保存</button>
						</div>
					</div>
			</form>
		</div>
	</div>
	</div>
	<!-- content end -->
	<script>
 </script>
</body>
</html>
