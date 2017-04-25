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

<title>My JSP 'findCleanmanage.jsp' starting page</title>

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
			<strong class="am-text-primary am-text-lg">房间信息</strong> / <small>Room</small>
		</div>

	</div>


	<div class="am-g">
		<form id="roomconditionForm">
			<div class="am-u-md-6 am-cf">
				<div class="am-fl am-cf">
					<div class="am-btn-toolbar am-fl">
						<div class="am-btn-group am-btn-group-xs">
							<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
								id="querybuild" name="querybuild" required="required">
								<option value="">请选择楼宇</option>
								<s:iterator value="buildlist">
									<s:if test="bid==querybuild">
										<option selected="selected" value='<s:property value="bid" />'><s:property
												value="bname" /></option>
									</s:if>
									<s:else>
										<option value='<s:property value="bid" />'><s:property
												value="bname" /></option>
									</s:else>
								</s:iterator>
							</select>
						</div>

						<div class="am-form-group am-margin-left am-fl">
							<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
								id="queryower" name="queryower" required="required">
								<option value="">请选择业主</option>
								<s:iterator value="owerlist">
									<s:if test="oid==queryower">
										<option selected="selected" value='<s:property value="oid" />'><s:property
												value="oname" /></option>
									</s:if>
									<s:else>
										<option value='<s:property value="oid" />'><s:property
												value="oname" /></option>
									</s:else>
								</s:iterator>
							</select>
						</div>
					</div>
				</div>
			</div>

			<div class="am-u-md-3 am-cf">
				<div class="am-fr">
					<div class="am-input-group am-input-group-sm">
						<input type="text" class="am-form-field" id="queryroom"
							name="queryroom" placeholder="房间号/ Rname" value="${queryroom}">
						<span class="am-input-group-btn">
							<button class="am-btn am-btn-default" type="button"
								onclick="findAllRoom(1)">搜索</button>
						</span>
					</div>
				</div>
			</div>
		</form>
	</div>


	<div class="am-g">
		<div class="am-u-sm-12">

			<form class="am-form">
				<table class="am-table am-table-striped am-table-hover table-main">
					<thead>
						<tr>
							<th>ID</th>
							<th>楼宇名称</th>
							<th>房间号</th>
							<th>业主名</th>
							<th>入住时间</th>
							<th>房型</th>
							<th>建筑面积</th>
							<th>用户</th>
							<th width="150px">操作</th>
						</tr>
					</thead>
					<s:iterator value="pageBean.list">
						<tr>
							<td><s:property value="rid" /></td>
							<td><s:property value="building.bname" /></td>
							<td><s:property value="rname" /></td>
							<td><s:property value="ower.oname" /></td>
							<td><s:property value="ower.intime" /></td>
							<td><s:if test="type.equals('One')">
                                                            一居室</s:if> <s:elseif
									test="type.equals('Two')">
                                                             二居室</s:elseif> <s:elseif
									test="type.equals('Three')">
                                                             三居室</s:elseif> <s:else>
                                                            四居室</s:else></td>
							<td><s:property value="rarea" />平方米</td>
							<td><s:property value="users.username" /></td>

							<td><button type="button"
									class="am-btn am-btn-xs am-btn-default am-radius"
									onclick='getUpdateRoomPage(<s:property value="rid"/>)'>修改</button>
								<button type="button"
									class="am-btn am-btn-xs am-btn-default am-radius"
									style="color: red"
									onclick='deleteRoom(<s:property value="rid"/>)'>删除</button></td>

						</tr>
					</s:iterator>
					<tr>
						<td></td>

						<td class="tocenter">共 <s:property value="pageBean.totalPage" />
							页
						</td>
						<td></td>
						<td class="tocenter">共 <s:property value="pageBean.allRow" />
							条记录
						</td>
						<td class="tocenter">当前第 <s:property
								value="pageBean.currentPage" /> 页
						</td>
						<td colspan="4" class="tocenter"><s:if
								test="%{pageBean.currentPage == 1}">第1页&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;</s:if>
							<s:else>
								<a onclick="findAllRoom(1)">第1页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a
									onclick='findAllRoom(<s:property value="%{pageBean.currentPage-1}"/>)'>上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</s:else> <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
								<a
									onclick='findAllRoom(<s:property value="%{pageBean.currentPage+1}"/>)'>下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a
									onclick='findAllRoom(<s:property value="pageBean.totalPage"/>)'>末页</a>
							</s:if> <s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp; 末页</s:else></td>
					</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
