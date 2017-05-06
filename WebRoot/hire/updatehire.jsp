
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

<title>租赁信息修改</title>
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
			<strong class="am-text-primary am-text-lg">租赁管理</strong> / <small><a
				href="user.action">租赁信息</a></small> / <small>租赁信息修改</small>
		</div>
	</div>
	<div class="am-tabs am-margin">
		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
				<form class="am-form" id="updateHireForm" method="post">
					<input type="hidden" name="hid" value='<s:property value="hid"/>'>
					<hr>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*租客名</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="hname" style="width:200px"
								 value='<s:property value="hname"/>' onblur="checkName(this)"> <small class="error"></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*房间号</div>
						<div class="am-u-sm-4 am-text-left">
							<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm" style="width:150px"
						id="rid" name="room.rid" required="required">
				              <option  value='<s:property value="room.rid"/>' ><s:property value="room.rname" /></option>
				               <s:iterator value="roomlist">
				               <option value='<s:property value="rid"  />'><s:property value="rname" /></option>
                              </s:iterator></select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
				
					
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*联系电话</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" style="width:200px" class="am-checkbox-inline" name="htel"
								 value='<s:property value="htel"/>' onblur="checkTel(this)"><small class="error"></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*入住日期</div>
						<div class="am-u-sm-4 am-text-left">
						 <input type="text" style="width:250px" id="starttime" name="checkindate" placeholder="Checkindate" 
                         value='<s:date name="checkindate" format="yyyy-MM-dd"/>' onBlur="checkNull('starttime')" /><small id="stime" style="color:red" ></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*到期日期</div>
						<div class="am-u-sm-4 am-text-left">
						 <input type="text" style="width:250px" id="endtime" name="duedate" placeholder="Duedate" 
                         value='<s:date name="duedate" format="yyyy-MM-dd"/>' onBlur="checkNull('endtime')" /><small id="etime" style="color:red" ></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*备注</div>
						<div class="am-u-sm-4 am-text-left">
						<input type="text" class="am-checkbox-inline" name="remark"
								style="width:350px;height:50px" value='<s:property value="remark"/>'>
								<small id="maintain"></small>	
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<br>
					
					<div class="owerupdate">
					    <button style="" type="button"
							class="am-btn am-btn-primary am-btn-xs"
							onclick="updateHire()" id="buttonBtn">确认修改</button>
						</div>
						<br>
				</form>

			</div>
		</div>
	</div>

<script>
$('#starttime').datetimepicker({
	  format: 'yyyy-mm-dd '
	});
$('#endtime').datetimepicker({
	  format: 'yyyy-mm-dd '
	});
  
 </script>
</body>
</html>

