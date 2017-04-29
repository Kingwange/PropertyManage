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

<title>My JSP 'findSecurity.jsp' starting page</title>

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
			<strong class="am-text-primary am-text-lg">保安信息</strong> / <small>Security</small>
		</div>

	</div>


	<div class="am-g">
		<form id="securityconditionForm">
			<div class="am-u-md-6 am-cf">
				<div class="am-fl am-cf">
					<div class="am-btn-toolbar am-fl">
						<div class="am-btn-group am-btn-group-xs"></div>

						<div class="am-form-group am-margin-left am-fl">
							<select class="class=" am-form-field"" id="querytype"
								name="querytype" required="required">

								<s:if test="querytype=='N'.toString()">
									<option value="N">夜班</option>
									<option value="D">白班</option>
									<option value="">全部</option>
								</s:if>
								<s:elseif test="querytype=='D'.toString()">
									<option value="D">白班</option>
									<option value="N">夜班</option>
									<option value="">全部</option>
								</s:elseif>
								<s:else>
									<option value="">全部</option>
									<option value="D">白班</option>
									<option value="N">夜班</option>
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
							name="queryInfo" placeholder="保安名/ Name" value="${queryInfo}">
						<span class="am-input-group-btn">
							<button class="am-btn am-btn-default" type="button"
								onclick="findAllSecurity(1)">搜索</button>
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
							<th>性别</th>
							<th>身份证</th>
							<th>联系方式</th>
							<th>保安职位</th>
							<th>家庭地址</th>
							<th>负责区域</th>
							<th>工作时间</th>
							<th>备注</th>
							<th width="150px">操作</th>
						</tr>
					</thead>
					<s:iterator value="pageBean.list">
						<tr>
							<td><s:property value="sid" /></td>
							<td><s:property value="sname" /></td>
							<td><s:if test="sex=='M'.toString()">男</s:if> <s:else>女</s:else>
							</td>
							<td><s:property value="identity" /></td>
							<td><s:property value="tel" /></td>
							<td><s:if test="job=='S'.toString()">保安队长</s:if> <s:else>普通保安</s:else>
							</td>
							<td><s:property value="address" /></td>
							<td><s:property value="territory" /></td>
							<td><s:if test="worktype=='D'.toString()">白班</s:if> <s:else>夜班</s:else>
							</td>

							<td><s:property value="remark" /></td>

							<td><button type="button"
									class="am-btn am-btn-xs am-btn-default am-radius"
									onclick='getUpdateSecurityPage(<s:property value="sid"/>)'>修改</button>
								<button type="button"
									class="am-btn am-btn-xs am-btn-default am-radius"
									style="color: red"
									onclick='deleteSecurity(<s:property value="sid"/>)'>删除</button>
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
								<a onclick="findAllSecurity(1)">第1页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a
									onclick='findAllSecurity(<s:property value="%{pageBean.currentPage-1}"/>)'>上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</s:else> <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
								<a
									onclick='findAllSecurity(<s:property value="%{pageBean.currentPage+1}"/>)'>下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a
									onclick='findAllSecurity(<s:property value="pageBean.totalPage"/>)'>末页</a>
							</s:if> <s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp; 末页</s:else></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
