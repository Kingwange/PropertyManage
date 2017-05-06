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

<title>维修人员信息</title>

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
	<div>
		<div class="am-cf am-padding">
			<div class="am-fl am-cf">
				<strong class="am-text-primary am-text-lg">维修人员信息</strong> / <small>Maintainman</small>
			</div>

		</div>

		<form id="maintainmanconditionForm">
			<div class="am-g">
				<div class="am-u-md-6 am-cf">
					<div class="am-fl am-cf">
						<div class="am-btn-toolbar am-fl">
							<div class="am-btn-group am-btn-group-xs"></div>
							<div class="am-form-group am-margin-left am-fl">
								<select class="class=" am-form-field"" id="querytype"
									name="querytype" required="required">

									<s:if test="querytype.equals('Wood')">
										<option value="Wood">木工类</option>
										<option value="Air">空调类</option>
										<option value="Warm">气暖</option>
										<option value="Lock">锁具</option>
										<option value="Water">水类</option>
										<option value="Power">电类</option>
										<option value="Other">其它</option>
										<option value="">全部</option>
									</s:if>
									<s:elseif test="querytype.equals('Air')">
										<option value="Air">空调类</option>
										<option value="Wood">木工类</option>
										<option value="Warm">气暖</option>
										<option value="Lock">锁具</option>
										<option value="Water">水类</option>
										<option value="Power">电类</option>
										<option value="Other">其它</option>
										<option value="">全部</option>
									</s:elseif>
									<s:elseif test="querytype.equals('Warm')">
										<option value="Warm">气暖</option>
										<option value="Air">空调类</option>
										<option value="Wood">木工类</option>
										<option value="Lock">锁具</option>
										<option value="Water">水类</option>
										<option value="Power">电类</option>
										<option value="Other">其它</option>
										<option value="">全部</option>
									</s:elseif>
									<s:elseif test="querytype.equals('Lock')">
										<option value="Lock">锁具</option>
										<option value="Air">空调类</option>
										<option value="Wood">木工类</option>
										<option value="Warm">气暖</option>
										<option value="Water">水类</option>
										<option value="Power">电类</option>
										<option value="Other">其它</option>
										<option value="">全部</option>
									</s:elseif>
									<s:elseif test="querytype.equals('Water')">
										<option value="Water">水类</option>
										<option value="Air">空调类</option>
										<option value="Wood">木工类</option>
										<option value="Warm">气暖</option>
										<option value="Lock">锁具</option>
										<option value="Power">电类</option>
										<option value="Other">其它</option>
										<option value="">全部</option>
									</s:elseif>
									<s:elseif test="querytype.equals('Power')">
										<option value="Power">电类</option>
										<option value="Air">空调类</option>
										<option value="Wood">木工类</option>
										<option value="Warm">气暖</option>
										<option value="Lock">锁具</option>
										<option value="Water">水类</option>
										<option value="Other">其它</option>
										<option value="">全部</option>
									</s:elseif>
									<s:elseif test="querytype.equals('Other')">
										<option value="Other">其它</option>
										<option value="Air">空调类</option>
										<option value="Wood">木工类</option>
										<option value="Warm">气暖</option>
										<option value="Lock">锁具</option>
										<option value="Water">水类</option>
										<option value="Power">电类</option>
										<option value="">全部</option>
									</s:elseif>
									<s:else>
										<option value="">全部</option>
										<option value="Air">空调类</option>
										<option value="Wood">木工类</option>
										<option value="Warm">气暖</option>
										<option value="Lock">锁具</option>
										<option value="Water">水类</option>
										<option value="Power">电类</option>
										<option value="Other">其它</option>
									</s:else>
								</select>
							</div>

						</div>
					</div>
				</div>
				<div class="am-u-md-3 am-cf">
					<div class="am-fr">
						<div class="am-input-group am-input-group-sm">
							<input type="text" class="am-form-field" id="queryInfo"
								name="queryInfo" placeholder="姓名 / Name" value="${queryInfo}">
							<span class="am-input-group-btn">
								<button class="am-btn am-btn-default" type="button"
									onclick="findAllMaintainman(1)">搜索</button>
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
							<th>姓名</th>
							<th>维修类别</th>
							<th>联系电话</th>
							<th>用户账号</th>
							<th width="150px">操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pageBean.list">
							<tr>
								<td class="tocenter"><s:property value="mmid" /></td>
								<td class="tocenter"><s:property value="name" /></td>
								<td class="tocenter"><s:if test="repairtype.equals('Wood')">木工类</s:if>
									<s:elseif test="repairtype.equals('Air')">空调类</s:elseif> <s:elseif
										test="repairtype.equals('Warm')">气暖类</s:elseif> <s:elseif
										test="repairtype.equals('Lock')">锁具</s:elseif> <s:elseif
										test="repairtype.equals('Water')">水类</s:elseif> <s:elseif
										test="repairtype.equals('Power')">电类</s:elseif> <s:else>其它</s:else>
								</td>
								<td class="tocenter"><s:property value="tel" /></td>
								<td class="tocenter"><s:property value="users.username" /></td>
								<td><button type="button"
										class="am-btn am-btn-xs am-btn-default am-radius"
										onclick='getUpdateMaintainmanPage(<s:property value="mmid"/>)'>修改</button>
									<button type="button"
										class="am-btn am-btn-xs am-btn-default am-radius"
										style="color: red"
										onclick='deleteMaintainman(<s:property value="mmid"/>)'>删除</button></td>
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
								<a onclick="findAllMaintainman(1)">第1页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a
									onclick='findAllMaintainman(<s:property value="%{pageBean.currentPage-1}"/>)'>上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</s:else> <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
								<a
									onclick='findAllMaintainman(<s:property value="%{pageBean.currentPage+1}"/>)'>下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a
									onclick='findAllMaintainman(<s:property value="pageBean.totalPage"/>)'>末页</a>
							</s:if> <s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp; 末页</s:else></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
