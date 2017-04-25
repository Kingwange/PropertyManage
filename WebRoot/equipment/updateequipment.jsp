
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
</head>
<body>

	<div class="am-cf am-padding">
		<div class="am-fl am-cf">
			<strong class="am-text-primary am-text-lg">设备管理</strong> / <small><a
				href="user.action">设备信息</a></small> / <small>设备信息修改</small>
		</div>
	</div>
	<div class="am-tabs am-margin">
		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
				<form class="am-form" id="updateEquipmentForm" method="post">
					<input type="hidden" name="eid" value='<s:property value="eid"/>'>
					<hr>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*设备名</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="ename"
								width="50" value='<s:property value="ename"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*数量</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="enumber"
								width="50" value='<s:property value="enumber"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*生产厂商</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="vendor"
								width="50" value='<s:property value="vendor"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					
                   <div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*生产日期</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="producedate" id="producedate"
								width="50" value='<s:property value="producedate"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*检修周期</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="maintenancetime"
								width="50" value='<s:property value="maintenancetime"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*检查人员</div>
						<div class="am-u-sm-4 am-text-left">
							<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
						id="sid" name="security.sid" required="required">
				               <s:iterator value="securitylist">
				               <s:if test="security.sid==sid">
                               <option  selected="selected" value='<s:property value="sid"/>' ><s:property value="sname" /></option>
                               </s:if>
                               <s:else>
                                <option value='<s:property value="sid"  />'><s:property value="sname" /></option>
                               </s:else>
                               </s:iterator>
			               </select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*备注</div>
						<div class="am-u-sm-4 am-text-left">
						<input type="text" class="am-checkbox-inline" name="remark"
								width="50" value='<s:property value="remark"/>'>	
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<br>
					<br>
					<div class="update">
						<button style="" type="button"
							class="am-btn am-btn-primary am-btn-xs"
							onclick="updateEquipment()" id="buttonBtn">确认修改</button>
					</div>
				</form>

			</div>
		</div>
	</div>

<script>
 $('#producedate').datetimepicker({
	  format: 'yyyy-mm-dd hh:ii'
	});
 </script>
</body>
</html>

