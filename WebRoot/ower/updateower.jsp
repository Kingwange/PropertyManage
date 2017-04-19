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

<title>My JSP 'findTask.jsp' starting page</title>

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
			<strong class="am-text-primary am-text-lg">业主信息管理</strong> / <small><a
				href="user.action">业主信息</a></small> / <small>业主信息修改</small>
		</div>
	</div>
	<div class="am-tabs am-margin">
		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
				<form class="am-form" id="updateOwerForm"  method="post">
							 <input type="hidden" name = "oid"  value='<s:property value="oid"/>'>
							<hr>
							<div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*业主姓名</div>
								<div class="am-u-sm-4 am-text-left">
									<input type="text" class="am-checkbox-inline" name="oname" width="50" value='<s:property value="oname"/>'>
								</div>
								<div class="am-u-sm-6 am-text-right"></div>
							</div>
                            <div class="am-g am-margin-top">
								<div class="am-u-sm-2 am-text-right">*身份证号</div>
								<div class="am-u-sm-4 am-text-left">
									<input type="text" class="am-checkbox-inline" name="identity" width="50" value='<s:property value="identity"/>'>
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
								<div class="am-u-sm-2 am-text-right">*入住时间</div>
								<div class="am-u-sm-4 am-text-left">
									<input type="text" class="am-checkbox-inline" name="intime" width="50" value='<s:property value="intime"/>'>
								</div>
								<div class="am-u-sm-6 am-text-right"></div>
							</div>
							<br><br>
							<div class="owerupdate">
					        <button style="" type="button" class="am-btn am-btn-primary am-btn-xs"
						onclick="updateOwer()" id="buttonBtn">确认修改</button>
						</div>				
                         </form>

			</div>
		</div>
	</div>


</body>
</html>

