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

<title>设备信息添加</title>
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
			<strong class="am-text-primary am-text-lg">添加设备信息</strong> / <small>Add
				Equipment</small>
		</div>
	</div>

	<hr />

	<div class="am-g">

		<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8"></div>

		<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
			<form class="am-form am-form-horizontal" id="addEquipmentForm"
				data-am-validato>
				<div class="am-form-group">
					<label class="am-u-sm-3 am-form-label">设备名称</label>
					<div class="am-u-sm-9">
						<input type="text" style="width:200px" name="ename"
							placeholder="设备名称/ Ename" / onblur="checkEquipmentname(this)">
						<small class="error"></small>
					</div>
				</div>
				<div class="am-form-group">
					<label class="am-u-sm-3 am-form-label">数量</label>
					<div class="am-u-sm-9">
						<input type="text" style="width:200px" name="enumber"
							placeholder="设备数量/ Number" onblur="checkNumber(this)" /> <small
							class="error"></small>
					</div>
				</div>
				<div class="am-form-group">
					<label class="am-u-sm-3 am-form-label">生产厂商</label>
					<div class="am-u-sm-9">
						<input type="text" style="width:200px" name="vendor"
							placeholder="生产厂商/ Vendor" onblur="checkNametype(this)" /> <small
							class="error"></small>
					</div>
				</div>
				<div class="am-form-group">
					<label class="am-u-sm-3 am-form-label">生产日期</label>
					<div class="am-u-sm-9">
						<input type="text" style="width:200px"id="producedate" name="producedate"
							placeholder="生产日期/ Producedate" onblur="checkTime(this)" /> <small
							class="error"></small>
					</div>
				</div>
				<div class="am-form-group">
					<label class="am-u-sm-3 am-form-label">检修周期</label>
					<div class="am-u-sm-9">
						<input type="text" style="width:200px" name="maintenancetime"
							placeholder="检修周期/ Maintenancetime" /> <small class="error"></small>
					</div>
				</div>
				<div class="am-form-group">
					<label class="am-u-sm-3 am-form-label">检查人员 </label>
					<div class="am-u-sm-9">
						<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
							style="width:150px" name="security.sid" required="required"
							onblur="checktype(this)">
							<option value="">请选择</option>
							<s:iterator value="securitylist">
								<option value='<s:property value="sid" />'><s:property
										value="sname" /></option>
							</s:iterator>
						</select> <small class="error"></small>
					</div>
				</div>


				<div class="am-form-group">
					<label class="am-u-sm-3 am-form-label">备注</label>
					<div class="am-u-sm-9">
						<textarea type="text" id="remark" name="remark" placeholder="" />
						<small id="maintain"></small>
					</div>
				</div>

				<br>
				<br>

				<div class="am-form-group">
					<div class="am-u-sm-9 am-u-sm-push-3">
						<button type="button" class="am-btn am-btn-primary"
							onclick="saveEquipment()">保存</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	</div>
	<!-- content end -->
	<script type="text/javascript">
  $('#producedate').datetimepicker({
 	  format: 'yyyy-mm-dd'
 	});
  $(function(){
 	 var today=new Date();
     var y=today.getFullYear();
     var m=today.getMonth()+1;
     var d=today.getDate();
     var localtime =  y+"-"+m+"-"+d;
 	$("#producedate").val(localtime);
  }); 
</script>
</body>
</html>
