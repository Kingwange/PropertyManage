
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>保安信息修改</title>

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
			<strong class="am-text-primary am-text-lg">保安信息管理</strong> / <small><a
				href="user.action">保安信息</a></small> / <small>保安信息修改</small>
		</div>
	</div>
	<div class="am-tabs am-margin">
		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
				<form class="am-form" id="updateSecurityForm" method="post">
					<input type="hidden" name="sid" value='<s:property value="sid"/>'>
					<hr>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*保安姓名</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" style="width:200px" class="am-checkbox-inline"
								name="sname" width="50" value='<s:property value="sname"/>'
								onblur="checkName(this)"> <small class="error"></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>

					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*性别</div>
						<div class="am-u-sm-4 am-text-left">
							<select class="am-input-sm" style="width:150px" name="sex"
								required="required">
								<s:if test="sex=='M'.toString()">
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
							<input type="text" style="width:200px" class="am-checkbox-inline"
								name="identity" width="50"
								value='<s:property value="identity"/>'
								onblur="checkIdentity(this)"><small class="error"></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*联系方式</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" style="width:200px" class="am-checkbox-inline"
								name="tel" width="50" value='<s:property value="tel"/>'
								onblur="checkTel(this)"><small class="error"></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*职位</div>
						<div class="am-u-sm-4 am-text-left">
							<select class="am-input-sm" style="width:150px" name="job"
								required="required">
								<s:if test="job=='S'.toString()">
									<option value="S">保安队长</option>
									<option value="C">普通保安</option>

								</s:if>
								<s:else>
									<option value="C">普通保安</option>
									<option value="S">保安队长</option>
								</s:else>

							</select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*家庭地址</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" style="width:200px" class="am-checkbox-inline"
								name="address" width="50" value='<s:property value="address"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*负责区域</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" style="width:200px" class="am-checkbox-inline"
								name="territory" width="50"
								value='<s:property value="territory"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*工作时间</div>
						<div class="am-u-sm-4 am-text-left">
							<select class="am-input-sm" style="width:150px" name="worktype"
								required="required">
								<s:if test="worktype=='D'.toString()">
									<option value="D">白班</option>
									<option value="N">夜班</option>

								</s:if>
								<s:else>
									<option value="N">夜班</option>
									<option value="D">白班</option>
								</s:else>

							</select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>

					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*备注</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" style="width:300px" name="remark"
								placeholder="" value='<s:property value="remark"/>'> <small
								id="maintain"></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<br> <br>
					<div class="owerupdate">
						<button style="" type="button"
							class="am-btn am-btn-primary am-btn-xs"
							onclick="updateSecurity()" id="buttonBtn">确认修改</button>
					</div>
				</form>

			</div>
		</div>
	</div>


</body>
</html>

