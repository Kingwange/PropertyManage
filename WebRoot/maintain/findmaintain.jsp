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

<title>维修信息</title>

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
				<strong class="am-text-primary am-text-lg">维修信息</strong> / <small>Maintain</small>
			</div>

		</div>

		<form id="maintainconditionForm">
			<div class="am-g">
				<div class="am-u-md-6 am-cf">
					<div class="am-fl am-cf">
						<div class="am-btn-toolbar am-fl">
							<div class="am-btn-group am-btn-group-xs">
								<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
									id="queryroom" name="queryroom" required="required">
									<option value="">请选择房间</option>
									<s:iterator value="roomlist">
										<s:if test="rid==queryroom">
											<option selected="selected"
												value='<s:property value="rid" />'><s:property
													value="rname" /></option>
										</s:if>
										<s:else>
											<option value='<s:property value="rid" />'><s:property
													value="rname" /></option>
										</s:else>
									</s:iterator>
								</select>
							</div>
							<div class="am-form-group am-margin-left am-fl">
								<select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
									id="queryrepairtype" name="queryrepairtype" required="required">
									<option value="">请选择维修类别</option>
									<s:iterator value="maintainmanlist">
										<s:if test="mmid==queryrepairtype">
											<option selected="selected"
												value='<s:property value="mmid" />'>
												<s:if test="repairtype.equals('Wood')">木工类</s:if>
												<s:elseif test="repairtype.equals('Air')">空调类</s:elseif>
												<s:elseif test="repairtype.equals('Warm')">气暖类</s:elseif>
												<s:elseif test="repairtype.equals('Lock')">锁具类</s:elseif>
												<s:elseif test="repairtype.equals('Water')">水类</s:elseif>
												<s:elseif test="repairtype.equals('Power')">电类</s:elseif>
												<s:else>其它类</s:else>
											</option>
										</s:if>
										<s:else>
											<option value='<s:property value="mmid" />'>
												<s:if test="repairtype.equals('Wood')">木工类</s:if>
												<s:elseif test="repairtype.equals('Air')">空调类</s:elseif>
												<s:elseif test="repairtype.equals('Warm')">气暖类</s:elseif>
												<s:elseif test="repairtype.equals('Lock')">锁具类</s:elseif>
												<s:elseif test="repairtype.equals('Water')">水类</s:elseif>
												<s:elseif test="repairtype.equals('Power')">电类</s:elseif>
												<s:else>其它类</s:else>
											</option>
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
							<select class="class=" am-form-field"" id="querytype"
								name="querytype" required="required">

								<s:if test="querytype=='N'.toString()">
									<option value="N">未处理</option>
									<option value="Y">已处理</option>
									<option value="">全部</option>
								</s:if>
								<s:elseif test="querytype=='Y'.toString()">
									<option value="Y">已处理</option>
									<option value="N">未处理</option>
									<option value="">全部</option>
								</s:elseif>
								<s:else>
									<option value="">全部</option>
									<option value="Y">已处理</option>
									<option value="N">未处理</option>
								</s:else>
							</select> <span class="am-input-group-btn">
								<button class="am-btn am-btn-default" type="button"
									onclick="findAllMaintain(1)">搜索</button>
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
							<th>维修类别</th>
							<th>维修内容</th>
							<th>报修人</th>
							<th>报修人联系方式</th>
							<th>维修人员</th>
							<th>维修人员联系方式</th>
							<th>报修时间</th>
							<th>维修状态</th>
							<th>备注</th>
							<th width="150px">操作</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="pageBean.list">
							<tr>
								<td class="tocenter"><s:property value="mid" /></td>
								<td class="tocenter"><s:property value="room.rname" /></td>
								<td class="tocenter"><s:if
										test="maintainman.repairtype.equals('Wood')">木工</s:if> <s:elseif
										test="maintainman.repairtype.equals('Air')">空调类</s:elseif> <s:elseif
										test="maintainman.repairtype.equals('Warm')">气暖类</s:elseif> <s:elseif
										test="maintainman.repairtype.equals('Lock')">锁具</s:elseif> <s:elseif
										test="maintainman.repairtype.equals('Water')">水类</s:elseif> <s:elseif
										test="maintainman.repairtype.equals('Power')">电类</s:elseif> <s:else>其它</s:else>
								</td>
								<td class="tocenter"><s:property value="mcontent" /></td>
								<td class="tocenter"><s:property value="mname" /></td>
								<td class="tocenter"><s:property value="mtel" /></td>
								<td class="tocenter"><s:property value="maintainman.name" /></td>
								<td class="tocenter"><s:property value="maintainman.tel" /></td>
								<td class="tocenter"><s:date name="repairdate" format="yyyy-MM-dd HH:mm"/></td>
								<td class="tocenter"><s:if test="type=='N'.toString()">未处理</s:if>
									<s:else>已处理</s:else></td>
								<td class="tocenter"><s:property value="remark" /></td>
								<td><button type="button"
										class="am-btn am-btn-xs am-btn-default am-radius"
										onclick='getUpdateMaintainPage(<s:property value="mid"/>)'>修改</button>
									<c:if test="${users != null && users.authority =='A'}">
									<button type="button"
										class="am-btn am-btn-xs am-btn-default am-radius"
										style="color: red"
										onclick='deleteMaintain(<s:property value="mid"/>)'>删除</button></c:if></td>
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
								<a onclick="findAllMaintain(1)">第1页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a
									onclick='findAllMaintain(<s:property value="%{pageBean.currentPage-1}"/>)'>上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</s:else> <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
								<a
									onclick='findAllMaintain(<s:property value="%{pageBean.currentPage+1}"/>)'>下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a
									onclick='findAllMaintain(<s:property value="pageBean.totalPage"/>)'>末页</a>
							</s:if> <s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp; 末页</s:else></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
