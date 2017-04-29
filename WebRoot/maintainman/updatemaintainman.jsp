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

<title>修改维修人员信息</title>
 <meta name="keywords" content="ower">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/amazeui.datetimepicker.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/amazeui.datetimepicker.min.js"></script>
  <script src="assets/js/amazeui.min.js"></script>
  <script src="assets/js/app.js"></script>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<body>

	<div class="am-cf am-padding">
		<div class="am-fl am-cf">
			<strong class="am-text-primary am-text-lg">维修管理</strong> / <small><a
				href="user.action">维修人员信息</a></small> / <small>维修人员信息修改</small>
		</div>
	</div>
	<div class="am-tabs am-margin">
		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
				<form class="am-form" id="updateMaintainmanForm"  method="post">
							 <input type="hidden" name = "mmid"  value='<s:property value="mmid"/>'>
							<hr>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*姓名</div>
								<div class="am-u-sm-4 am-text-left">
									<input type="text" class="am-checkbox-inline" name="name" width="50" value='<s:property value="name"/>'>
								</div>
								<div class="am-u-sm-6 am-text-right"></div>
							</div>
                            <div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*维修类别</div>
								<div class="am-u-sm-4 am-text-left">
									<select class="class=" am-form-field"" id="repairtype"
							name="repairtype" required="required">

							<s:if test="repairtype.equals('Wood')">
					            <option value="Wood">木工类</option>
					            <option value="Air">空调类</option>
					            <option value="Warm">气暖</option>
					            <option value="Lock">锁具</option>
					            <option value="Water">水类</option>
					            <option value="Power">电类</option>
					            <option value="Other">其它</option>
					           
							</s:if>
							<s:elseif test="repairtype.equals('Air')">
					            <option value="Air">空调类</option>
					             <option value="Wood">木工类</option>
					            <option value="Warm">气暖</option>
					            <option value="Lock">锁具</option>
					            <option value="Water">水类</option>
					            <option value="Power">电类</option>
					            <option value="Other">其它</option>
					           
							</s:elseif>
							<s:elseif test="repairtype.equals('Warm')">
					            <option value="Warm">气暖</option>
					            <option value="Air">空调类</option>
					             <option value="Wood">木工类</option>
					            <option value="Lock">锁具</option>
					            <option value="Water">水类</option>
					            <option value="Power">电类</option>
					            <option value="Other">其它</option>
					           
							</s:elseif>
							<s:elseif test="repairtype.equals('Lock')">
					            <option value="Lock">锁具</option>
					            <option value="Air">空调类</option>
					             <option value="Wood">木工类</option>
					            <option value="Warm">气暖</option> 
					            <option value="Water">水类</option>
					            <option value="Power">电类</option>
					            <option value="Other">其它</option>
					           
							</s:elseif>
							<s:elseif test="repairtype.equals('Water')">
					            <option value="Water">水类</option>
					            <option value="Air">空调类</option>
					            <option value="Wood">木工类</option>
					            <option value="Warm">气暖</option>
					            <option value="Lock">锁具</option>
					            <option value="Power">电类</option>
					            <option value="Other">其它</option>
					            
							</s:elseif>
							<s:elseif test="repairtype.equals('Power')">
					            <option value="Power">电类</option>
					            <option value="Air">空调类</option>
					            <option value="Wood">木工类</option>
					            <option value="Warm">气暖</option>
					            <option value="Lock">锁具</option>
					            <option value="Water">水类</option>
					            <option value="Other">其它</option>
					           
							</s:elseif>
							<s:else test="repairtype.equals('Other')">
					            <option value="Other">其它</option>
					            <option value="Air">空调类</option>
					            <option value="Wood">木工类</option>
					            <option value="Warm">气暖</option>
					            <option value="Lock">锁具</option>
					            <option value="Water">水类</option>
					            <option value="Power">电类</option>
							</s:else>
						</select>
								</div>
								<div class="am-u-sm-6 am-text-right"></div>
							</div>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*联系方式</div>
								<div class="am-u-sm-4 am-text-left">
									<input type="text" class="am-checkbox-inline" name="tel" width="50" value='<s:property value="tel"/>'>
								</div>
								<div class="am-u-sm-6 am-text-right"></div>
							</div>

							<div class="am-g am-margin-top">
						     <div class="am-u-sm-2 am-text-right">*用户</div>
						     <div class="am-u-sm-4 am-text-left">
							   <select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
						id="id" name="users.id" required="required">
				              <option  selected="selected" value='<s:property value="users.id" />'><s:property value="users.username" /></option>
				               <s:iterator value="userslist">
				               <option value='<s:property value="id" />'><s:property value="username" /></option>
                       
                               </s:iterator>
			               </select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
							<br><br>
							<div class="owerupdate">
					        <button style="" type="button" class="am-btn am-btn-primary am-btn-xs"
						onclick="updateMaintainman()" id="buttonBtn">确认修改</button>
						</div>				
                         </form>

			</div>
		</div>
	</div>
<script>
 $('#intime').datetimepicker({
	  format: 'yyyy-mm-dd hh:ii'
	});
 </script>

</body>
</html>

