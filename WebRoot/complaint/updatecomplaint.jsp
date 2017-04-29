
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

<title>处理投诉信息</title>

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
			<strong class="am-text-primary am-text-lg">投诉管理</strong> / <small><a
				href="user.action">投诉信息</a></small> / <small>投诉信息处理</small>
		</div>
	</div>
	<div class="am-tabs am-margin">
		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
				<form class="am-form" id="updateComplaintForm" method="post">
					<input type="hidden" name="cpid" value='<s:property value="cpid"/>'>
					<hr>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*住户姓名</div>
						<div class="am-u-sm-4 am-text-left">
							<span><s:property value="resident.rsname"/> <span/>
							<input type="hidden"  name="resident.rsid" value='<s:property value="resident.rsid"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*投诉内容</div>
						<div class="am-u-sm-4 am-text-left">
						    <span><s:property value="cpcontent"/></span>
							<input type="hidden" name="cpcontent" value='<s:property value="cpcontent"/>' >
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*投诉时间</div>
						<div class="am-u-sm-4 am-text-left">
						    <span><s:property value="submissiontime"/></span>
							<input  type="hidden" name="submissiontime"  value='<s:property value="submissiontime"/>'>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*处理状态</div>
						<div class="am-u-sm-4 am-text-left">
							<select class="am-input-sm" name="state" required="required" style="width:150px">
								<s:if test="state=='N'.toString()" >
                                 <option value="N">未处理</option>
					             <option value="Z">正在处理</option>
					             <option value="Y">已处理</option>
					             </s:if>
                                <s:elseif test="state=='Z'.toString()">
                                 <option value="Z">正在处理</option>
                                 <option value="N">未处理</option>
                                 <option value="Y">已处理</option>
					            </s:elseif>
                                <s:else>
                                 <option value="Y">已处理</option>
                                 <option value="Z">正在处理</option>
                                 <option value="N">未处理</option>
                                </s:else>
							</select>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
                   
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*处理信息</div>
						<div class="am-u-sm-4 am-text-left">
							<textarea type="text" class="am-checkbox-inline" name="handleinfo"
								width="50">
					       </textarea>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					
					<br>
					<br>
					<div class="roomupdate">
						<button style="" type="button"
							class="am-btn am-btn-primary am-btn-xs"
							onclick="updateComplaint()" id="buttonBtn">确认修改</button>
					</div>
				</form>

			</div>
		</div>
	</div>


</body>
</html>

