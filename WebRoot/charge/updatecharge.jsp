
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

<title>My JSP 'updatecharge.jsp' starting page</title>
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
			<strong class="am-text-primary am-text-lg">收费管理</strong> / <small><a
				href="user.action">收费信息</a></small> / <small>收费信息修改</small>
		</div>
	</div>
	<div class="am-tabs am-margin">
		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
				<form class="am-form" id="updateChargeForm" method="post">
					<input type="hidden" name="cid" value='<s:property value="cid"/>'>
					<hr>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*房间号</div>
						<div class="am-u-sm-4 am-text-left">
							<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
						id="rid" name="room.rid" required="required">
				               <s:iterator value="roomlist">
				               <s:if test="room.rid==rid">
                               <option  selected="selected" value='<s:property value="rid"/>' ><s:property value="rname" /></option>
                               </s:if>
                               <s:else>
                                <option value='<s:property value="rid"  />'><s:property value="rname" /></option>
                               </s:else>
                               </s:iterator>
			               </select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*收费项目</div>
						<div class="am-u-sm-4 am-text-left">
							<select  class="am-input-sm" name="cname" required="required">
							<s:if test="cname=='W'.toString()">
					           <option selected="selected" value="W">水费</option>
					           <option value="E">电费</option>
					           <option value="F">燃气费</option>
					           <option value="P">物业费</option>
					         </s:if>
					         <s:elseif test="cname=='E'.toString()">
					           <option value="W">水费</option>
					           <option selected="selected" value="E">电费</option>
					           <option value="F">燃气费</option>
					           <option value="P">物业费</option>
					          </s:elseif>
					          <s:elseif test="cname=='F'.toString()">
					           <option value="W">水费</option>
					           <option value="E">电费</option>
					           <option selected="selected" value="F">燃气费</option>
					           <option value="P">物业费</option>
					          </s:elseif>
					          <s:else>
					           <option value="W">水费</option>
					           <option value="E">电费</option>
					           <option value="F">燃气费</option>
					           <option selected="selected" value="P">物业费</option>
					          </s:else>			
			                </select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*价格(元)</div>
						<div class="am-u-sm-4 am-text-left">
							<scan><input type="text" class="am-checkbox-inline" name="price"
								width="50" value='<s:property value="price"/>'></scan>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					
                   <div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*收费状态</div>
						<div class="am-u-sm-4 am-text-left">
							<select  class="am-input-sm" name="chargestate" required="required">
							<s:if test="chargestate=='Y'.toString">
					           <option selected="selected" value="Y">已缴费</option>
					           <option value="N">未缴费</option>
					         </s:if>
					          <s:else>
					           <option value="Y">已缴费</option>
					           <option selected="selected" value="N">未缴费</option>
					          </s:else>			
			                </select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*缴费日期</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="chargedate"
								id="chargedate" width="50" value='<s:property value="chargedate"/>'>
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
							onclick="updateCharge()" id="buttonBtn">确认修改</button>
					</div>
				</form>

			</div>
		</div>
	</div>

<script>
 $('#chargedate').datetimepicker({
	  format: 'yyyy-mm-dd hh:ii'
	});
 </script>
</body>
</html>

