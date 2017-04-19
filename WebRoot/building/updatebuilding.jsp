
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
			<strong class="am-text-primary am-text-lg">楼宇信息管理</strong> / <small><a
				href="user.action">楼宇信息</a></small> / <small>楼宇信息修改</small>
		</div>
	</div>
	<div class="am-tabs am-margin">
		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
				<form class="am-form" id="updateBuildingForm" method="post">
					<input type="hidden" name="bid" value='<s:property value="bid"/>'>
					<hr>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*楼宇名称</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="bname"
								width="50" value='<s:property value="bname"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*楼宇层数</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" class="am-checkbox-inline" name="plies"
								width="50" value='<s:property value="plies"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*楼盘状态</div>
						<div class="am-u-sm-4 am-text-left">
							<select class="am-input-sm" name="state" required="required">
								<s:if test="state=='N'.toString()">
									<option value="N">未竣工</option>
									<option value="Y">已竣工</option>
									
								</s:if>
								<s:else>
									<option value="Y">已竣工</option>
									<option value="N">未竣工</option>
								</s:else>
								
							</select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>

					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*备注</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" id="remark" name="remark" placeholder=""
								value='<s:property value="remark"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<br>
					<br>
					<div class="owerupdate">
						<button style="" type="button"
							class="am-btn am-btn-primary am-btn-xs"
							onclick="updateBuilding()" id="buttonBtn">确认修改</button>
					</div>
				</form>

			</div>
		</div>
	</div>


</body>
</html>

