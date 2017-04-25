
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
			<strong class="am-text-primary am-text-lg">住户管理</strong> / <small><a
				href="user.action">住户信息</a></small> / <small>住户信息修改</small>
		</div>
	</div>
	<div class="am-tabs am-margin">
		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
				<form class="am-form" id="updateResidentForm" method="post">
					<input type="hidden" name="rsid" value='<s:property value="rsid"/>'>
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
						<div class="am-u-sm-2 am-text-right">*姓名</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="rsname"
								width="50" value='<s:property value="rsname"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*性别</div>
						<div class="am-u-sm-4 am-text-left">
							<select class="am-input-sm" name="rsex" required="required">
								<s:if test="rsex=='M'.toString()">
									<option value="M">男</option>
									<option value="F">女</option>
									
								</s:if>
								<s:else>
									<option value="F">女</option>
									<option value="M">男</option>
								</s:else>
								
							</select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*身份证</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="identity"
								width="50" value='<s:property value="identity"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					
                   
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*联系方式</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="tel"
								width="50" value='<s:property value="tel"/>'>
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
							onclick="updateResident()" id="buttonBtn">确认修改</button>
					</div>
				</form>

			</div>
		</div>
	</div>


</body>
</html>

