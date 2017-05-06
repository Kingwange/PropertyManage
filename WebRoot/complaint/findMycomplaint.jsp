<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findMycomplaint.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
	.table_content{
		width:700px;
		height:230px;
		border:1px solid #F00;
		
	}
	
	

	</style>
  </head>
  
  <body>
    <table class="am-table am-table-striped am-table-hover table-main">
					<thead>
						<tr>
							<th style="width:45px">ID</th>
							<th style="width:100px">住户姓名</th>
							<th style="width:200px">投诉内容</th>
							<th style="width:280px">投诉时间</th>
							<th style="width:130px">处理状态</th>
							<th style="width:250px">处理信息</th>
						</tr>
					</thead>
					<s:iterator value="pageBean.list">
						<tr>
							<td><s:property value="cpid" /></td>
							<td><s:property value="resident.rsname" /></td>
							<td><s:property value="cpcontent" /></td>
							<td><s:date name="submissiontime" format="yyyy-MM-dd HH:mm"/></td>
							<td>
							<s:if test="state=='N'.toString()">未处理</s:if>
							<s:elseif test="state=='Z'.toString()">正在处理</s:elseif>
							<s:else>已处理</s:else>
							</td>
							<td><s:property value="handleinfo" /></td>
						</tr>
					</s:iterator>
			</table>
			<c:if test="${pageBean.list.size()!=0}">
			<table><tr>
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
								<a  onclick="findMycomplaint(1)">第1页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a  
									onclick='findMycomplaint(<s:property value="%{pageBean.currentPage-1}"/>)'>上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</s:else> <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
								<a  
									onclick='findMycomplaint(<s:property value="%{pageBean.currentPage+1}"/>)'>下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
								<a  
									onclick='findMycomplaint(<s:property value="pageBean.totalPage"/>)'>末页</a>
							</s:if> <s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp; 末页</s:else></td>
					</tr>
		
    </table></c:if>
  </body>
</html>
