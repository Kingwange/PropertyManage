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

<title>My JSP 'findEquipment.jsp' starting page</title>

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
			<strong class="am-text-primary am-text-lg">设备信息</strong> / <small>
				Equipment</small>
		</div>

	</div>


	<div class="am-g">
		<form id="equipmentconditionForm">
			<div class="am-u-md-6 am-cf">
				<div class="am-fl am-cf">
					<div class="am-btn-toolbar am-fl">
						<div class="am-btn-group am-btn-group-xs"></div>

						<div class="am-form-group am-margin-left am-fl">
							<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
								id="queryman" name="queryman" required="required">
								<option value="">请选择检修人员</option>
								<s:iterator value="securitylist">
									<s:if test="sid==queryman">
										<option selected="selected" value='<s:property value="sid" />'><s:property
												value="sname" /></option>
									</s:if>
									<s:else>
										<option value='<s:property value="sid" />'><s:property
												value="sname" /></option>
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
						<input type="text" class="am-form-field" id="queryInfo"
							name="queryInfo" placeholder="设备名称/ Name" value="${queryInfo}">
						<span class="am-input-group-btn">
							<button class="am-btn am-btn-default" type="button"
								onclick="findAllEquipment(1)">搜索</button>
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
							<th>设备名</th>
							<th>数量</th>
							<th>生产厂商</th>
							<th>生产日期</th>
							<th>检修周期</th>
							<th>检查人员</th>
							<th>备注</th>
							<th width="150px">操作</th>
						</tr>
					</thead>
					<s:iterator value="pageBean.list">
						<tr>
							<td><s:property value="eid" /></td>
							<td><s:property value="ename" /></td>
							<td><s:property value="enumber" /></td>
							<td><s:property value="vendor" /></td>
							<td><s:property value="producedate" /></td>
							<td><s:property value="maintenancetime" /></td>
							<td><s:property value="security.sname" /></td>
							<td><s:property value="remark" /></td>
							<td><button type="button"
									class="am-btn am-btn-xs am-btn-default am-radius"
									onclick='getUpdateEquipmentPage(<s:property value="eid"/>)'>修改</button>
								<button type="button"
									class="am-btn am-btn-xs am-btn-default am-radius"
									style="color: red"
									onclick='deleteEquipment(<s:property value="eid"/>)'>删除</button>
							</td>

						</tr>
					</s:iterator>
					</tbody>
				</table>
				<table>
					<tr>
						<td width="7%"></td>

						<td width="14%" class="tocenter">共 <s:property
								value="pageBean.totalPage" /> 页
						</td>
						<td width="25%" class="tocenter">共 <s:property
								value="pageBean.allRow" /> 条记录
						</td>
						<td width="10%" class="tocenter">当前第 <s:property
								value="pageBean.currentPage" /> 页
						</td>
						<td width="7%"></td>
						<td colspan="4" width="37%" class="tocenter"><s:if
								test="%{pageBean.currentPage == 1}">第1页&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;</s:if>
							<s:else>
								<a onclick="findAllEquipment(1)">第1页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a
									onclick='findAllEquipment(<s:property value="%{pageBean.currentPage-1}"/>)'>上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</s:else> <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
								<a
									onclick='findAllEquipment(<s:property value="%{pageBean.currentPage+1}"/>)'>下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a
									onclick='findAllEquipment(<s:property value="pageBean.totalPage"/>)'>末页</a>
							</s:if> <s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp; 末页</s:else></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
</body>
</html>
