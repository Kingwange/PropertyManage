
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
			<strong class="am-text-primary am-text-lg">房间管理</strong> / <small><a
				href="user.action">房间信息</a></small> / <small>房间信息修改</small>
		</div>
	</div>
	<div class="am-tabs am-margin">
		<div class="am-tabs-bd">
			<div class="am-tab-panel am-fade am-in am-active" id="job-tag">
				<form class="am-form" id="updateRoomForm" method="post">
					<input type="hidden" name="rid" value='<s:property value="rid"/>'>
					<hr>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*楼宇名称</div>
						<div class="am-u-sm-4 am-text-left">
							<select data-am-selected="{btnSize: 'sm'}" style="width:150px" class="am-input-sm"
						id="bid" name="building.bid" required="required" onchange="checktype(this)">
				               <s:iterator value="buildlist">
				               <s:if test="building.bid==bid">
                               <option  selected="selected" value='<s:property value="bid"/>' ><s:property value="bname" /></option>
                               </s:if>
                               <s:else>
                                <option value='<s:property value="bid"  />'><s:property value="bname" /></option>
                               </s:else>
                               </s:iterator>
			               </select>
			               <small class="error"></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*房间号</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" style="width:200px" class="am-checkbox-inline" name="rname"
								width="50" value='<s:property value="rname"/>' onchange="checkRoomName(this)">
								<small class="error"></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*业主名</div>
						<div class="am-u-sm-4 am-text-left">
							<select data-am-selected="{btnSize: 'sm'}"style="width:150px" class="am-input-sm"
						id="oid" name="ower.oid" required="required" onchange="checktype(this)">
				               <s:iterator value="owerlist">
				               <s:if test="ower.oid==oid">
                               <option  selected="selected" value='<s:property value="oid" />'><s:property value="oname" /></option>
                               </s:if>
                               <s:else>
                               <option value='<s:property value="oid" />'><s:property value="oname" /></option>
                               </s:else>
                               </s:iterator>
			               </select>
			               <small class="error"></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*房型</div>
						<div class="am-u-sm-4 am-text-left">
							<select style="width:150px" class="am-input-sm" name="type" required="required" onchange="checktype(this)">
								<s:if test="type.equals('One')">
                                 <option value="One">一居室</option>
					             <option value="Two">二居室</option>
					             <option value="Three">三居室</option>
					             <option value="Four">四居室</option></s:if>
                        <s:elseif test="type.equals('Two')">
                             <option value="Two">二居室</option>
                             <option value="One">一居室</option>
                             <option value="Three">三居室</option>
					         <option value="Four">四居室</option></s:elseif>
                        <s:elseif test="type.equals('Three')">
                                 <option value="Three">三居室</option>
                                 <option value="One">一居室</option>
					             <option value="Two">二居室</option>
					             <option value="Four">四居室</option></s:elseif>
                        <s:else>
                                 <option value="Four">四居室</option>
                                 <option value="One">一居室</option>
					             <option value="Two">二居室</option>
					             <option value="Three">三居室</option>
					             </s:else>
							</select>
							<small class="error"></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
                   
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*房间面积</div>
						<div class="am-u-sm-4 am-text-left">
							<input type="text" style="width:200px" class="am-checkbox-inline" name="rarea"
								width="50" value='<s:property value="rarea"/>' onblur="checkArea(this)"/>
						    <small class="error"></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<div class="am-g am-margin-top">
						<div class="am-u-sm-2 am-text-right">*用户</div>
						<div class="am-u-sm-4 am-text-left">
							<select data-am-selected="{btnSize: 'sm'}" style="width:150px" class="am-input-sm"
						id="id" name="users.id" required="required" onchange="checktype(this)">
						        <option   value='<s:property value="users.id" />'><s:property value="users.username" /></option>
				               <s:iterator value="userslist">
				                <option value='<s:property value="id" />'><s:property value="username" /></option>
                                </s:iterator>
			               </select>
			               <small class="error"></small>
			 <small id="maintain"></small>
						</div>
						<div class="am-u-sm-6 am-text-right"></div>
					</div>
					<br>
					<br>
					<div class="owerupdate">
						<button style="" type="button"
							class="am-btn am-btn-primary am-btn-xs"
							onclick="updateRoom()" id="buttonBtn">确认修改</button>
					</div>
					<br>
				</form>

			</div>
		</div>
	</div>


</body>
</html>

