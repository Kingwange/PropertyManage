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

<title>修改报修信息</title>
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
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<body>

	<div class="am-cf am-padding">
		<div class="am-fl am-cf">
			<strong class="am-text-primary am-text-lg">维修管理</strong> / <small><a
				href="user.action">报修信息</a></small> / <small>报信息处理</small>
		</div>
	</div>
	<div class="am-tabs am-margin">
		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
				<form class="am-form" id="updateMaintainForm" method="post">
					<input type="hidden" name="mid" value='<s:property value="mid"/>'>
					<hr>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*姓名</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="hidden" class="am-checkbox-inline" name="mname"
								width="50" value='<s:property value="mname"/>'>
						    <span><s:property value="mname"/></span>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*联系方式</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="hidden" class="am-checkbox-inline" name="mtel"
								width="50" value='<s:property value="mtel"/>'>
								<span><s:property value="mtel"/></span>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*房间号</div>
						<div class="am-u-sm-4 am-text-left">
						    <input type="hidden" class="am-checkbox-inline" name="room.rid"
								width="50" value='<s:property value="room.rid"/>'>
								<span><s:property value="room.rname"/></span>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*维修类别</div>
						<div class="am-u-sm-4 am-text-left">
							<select class="class=" am-form-field"" id=""
								name="maintainman.mmid" required="required">
                                <s:iterator value="maintainmanlist">
                                <s:if test="mmid==maintainman.mmid">
										<option selected="selected" value='<s:property value="mmid"/>'>
										    <s:if test="repairtype.equals('Wood')">木工类</s:if>
											<s:elseif test="repairtype.equals('Air')">空调类</s:elseif>
											<s:elseif test="repairtype.equals('Warm')">气暖类</s:elseif>
											<s:elseif test="repairtype.equals('Lock')">锁具</s:elseif>
											<s:elseif test="repairtype.equals('Water')">水类</s:elseif>
											<s:elseif test="repairtype.equals('Power')">电类</s:elseif>
								            <s:else>其它</s:else>
										</option>
									</s:if>
									<s:else>
										 <option  value='<s:property value="mmid"/>'>
										    <s:if test="repairtype.equals('Wood')">木工类</s:if>
											<s:elseif test="repairtype.equals('Air')">空调类</s:elseif>
											<s:elseif test="repairtype.equals('Warm')">气暖类</s:elseif>
											<s:elseif test="repairtype.equals('Lock')">锁具</s:elseif>
											<s:elseif test="repairtype.equals('Water')">水类</s:elseif>
											<s:elseif test="repairtype.equals('Power')">电类</s:elseif>
								            <s:else>其它</s:else>
										</option>
									</s:else>
								</s:iterator>
								</select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*维修内容</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="hidden" class="am-checkbox-inline" name="mcontent"
								width="50" value='<s:property value="mcontent"/>' />
						    <span><s:property value="mcontent"/></span>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*维修状态</div>
						<div class="am-u-sm-4 am-text-left">
							<select class="class=" am-form-field"" id="type" name="type"
								required="required"><s:if test="type=='N'.toString()">
									<option value="N">未处理</option>
									<option value="Y">已处理</option>
								</s:if>
								<s:else>
									<option value="Y">已处理</option>
									<option value="N">未处理</option>
								</s:else>
							</select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*备注</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="remark"
								width="50" <s:property value="remark"/> />
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="owerupdate">
						<button style="" type="button"
							class="am-btn am-btn-primary am-btn-xs"
							onclick="updateMaintain()" id="buttonBtn">确认修改</button>
					</div>
				</form>

			</div>
		</div>
	</div>

</body>
</html>

