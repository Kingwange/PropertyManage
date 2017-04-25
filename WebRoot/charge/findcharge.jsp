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

<title>My JSP 'findCharge.jsp' starting page</title>

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
			<strong class="am-text-primary am-text-lg">收费信息</strong> / <small>
				Charge </small>
		</div>

	</div>


	<div class="am-g">
		<form id="chargeconditionForm">
			<div class="am-u-md-6 am-cf">
				<div class="am-fl am-cf">
					<div class="am-btn-toolbar am-fl">
						<div class="am-btn-group am-btn-group-xs"></div>

						<div class="am-form-group am-margin-left am-fl">
							<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
								id="queryroom" name="queryroom" required="required">
								<option value="">请选择房间</option>
								<s:iterator value="roomlist">
									<s:if test="rid==queryroom">
										<option selected="selected" value='<s:property value="rid" />'><s:property
												value="rname" /></option>
									</s:if>
									<s:else>
										<option value='<s:property value="rid" />'><s:property
												value="rname" /></option>
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
						<select class="class=" am-form-field"" id="queryInfo"
							name="queryInfo" required="required">

							<s:if test="queryInfo=='N'.toString()">
								<option value="N">未缴费</option>
								<option value="Y">已缴费</option>
								<option value="">全部</option>
							</s:if>
							<s:elseif test="queryInfo=='Y'.toString()">
								<option value="Y">已缴费</option>
								<option value="N">未缴费</option>
								<option value="">全部</option>
							</s:elseif>
							<s:else>
								<option value="">全部</option>
								<option value="Y">已缴费</option>
								<option value="N">未缴费</option>
							</s:else>
						</select> <span class="am-input-group-btn">
							<button class="am-btn am-btn-default" type="button"
								onclick="findAllCharge(1)">搜索</button>
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
							<th>房间号</th>
							<th>收费项目</th>
							<th>价格</th>
							<th>收费状态</th>
							<th>缴费时间</th>
							<th>备注</th>
							<th width="150px">操作</th>
						</tr>
					</thead>
					<s:iterator value="pageBean.list">
						<tr>
							<td><s:property value="cid" /></td>
							<td><s:property value="room.rname" /></td>
							<td><s:if test="cname=='W'.toString()">水费</s:if> <s:elseif
									test="cname=='E'.toString()">电费</s:elseif> <s:elseif
									test="cname=='F'.toString()">燃气费</s:elseif> <s:else>物业费</s:else>
							</td>
							<td><s:property value="price" />元</td>
							<td><s:if test="chargestate=='Y'.toString()">已缴费</s:if> <s:else>未缴费</s:else>
							</td>
							<td><s:property value="chargedate" /></td>
							<td><s:property value="remark" /></td>
							<td><button type="button"
									class="am-btn am-btn-xs am-btn-default am-radius"
									onclick='getUpdateChargePage(<s:property value="cid"/>)'>修改</button>
								<button type="button"
									class="am-btn am-btn-xs am-btn-default am-radius"
									style="color: red"
									onclick='deleteCharge(<s:property value="cid"/>)'>删除</button></td>

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
								<a onclick="findAllCharge(1)">第1页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a
									onclick='findAllCharge(<s:property value="%{pageBean.currentPage-1}"/>)'>上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</s:else> <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
								<a
									onclick='findAllCharge(<s:property value="%{pageBean.currentPage+1}"/>)'>下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a
									onclick='findAllCharge(<s:property value="pageBean.totalPage"/>)'>末页</a>
							</s:if> <s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp; 末页</s:else></td>
					</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
