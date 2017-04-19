<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findTask.jsp' starting page</title>
    
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">业主信息</strong> / <small>Ower</small></div>
      
    </div>


    <div class="am-g">
      <div class="am-u-md-6 am-cf">
        <div class="am-fl am-cf">
          <div class="am-btn-toolbar am-fl">
            <div class="am-btn-group am-btn-group-xs">
            </div>

            <div class="am-form-group am-margin-left am-fl">
            </div>
          </div>
        </div>
      </div>
      
      <div class="am-u-md-3 am-cf">
        <div class="am-fr">
         <form id="owerconditionForm" >
          <div class="am-input-group am-input-group-sm">
            <input type="text" class="am-form-field" id="queryInfo" name="queryInfo" placeholder="业主名 / Name" value="${queryInfo}">
                <span class="am-input-group-btn">
                  <button class="am-btn am-btn-default" type="button" onclick="findAllOwer(1)">搜索</button>
                </span>       
          </div>
          </form>
        </div>
      </div>
        
    </div>

 
    <div class="am-g">
      <div class="am-u-sm-12">
      
        <form class="am-form">
          <table class="am-table am-table-striped am-table-hover table-main">
            <thead>
              <tr>
                <th class="building-ID">ID</th><th class="building-name">楼宇名称</th><th class="building-piles">楼宇层数</th><th class="building-state">楼盘状态</th><th class="building-remark">备注</th>
               
                <th width="150px">操作</th>
             
              </tr>
          </thead>
          <tbody>
          	<s:iterator value="pageBean.list"  >
          		<tr>
          			<td class="tocenter"><s:property value="bid"/></td>
          			<td class="tocenter"><s:property value="bname"/></td>
          			<td class="tocenter"><s:property value="piles"/></td> 
          			<s:if value=" state == 0><s:property value="未竣工" /></s:if>
                    <s:elseif value="state == 0><s:property value="已竣工" /></s:elseif> 
          			<td class="tocenter"><s:property value="remark"/></td> 	
          			<s:if test="#session.users.rsid==null">	
          			<td><button type="button" class="am-btn am-btn-xs am-btn-default am-radius" onclick='getUpdateBuildingPage(<s:property value="bid"/>)'>修改</button>
          			<button type="button" class="am-btn am-btn-xs am-btn-default am-radius" style="color: red" onclick='deleteBuilding(<s:property value="bid"/>)'>删除</button>
          			</td>
          			</s:if>
          		</tr>
          	</s:iterator>
          	  <tr>
                     <td width="13%" class="tocenter">
                         共
                         <s:property value="pageBean.totalPage" />
                          页
                    </td>
                     <td width="17%" class="tocenter">
                         共
                         <s:property value="pageBean.allRow" />
                        条记录
                     </td>
                     <td width="15%" class="tocenter">
                         当前第
                         <s:property value="pageBean.currentPage" />
                         页
                     </td>
                     <td colspan="4" width="55%" class="tocenter">
                         <s:if test="%{pageBean.currentPage == 1}">第1页&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;</s:if>
                        <s:else>
                             <a onclick="findAllOwer(1)">第1页&nbsp;&nbsp;&nbsp;&nbsp;</a>
                             <a onclick='findAllOwer(<s:property value="%{pageBean.currentPage-1}"/>)'>上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
                         </s:else>
                         <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
                             <a onclick='findAllOwer(<s:property value="%{pageBean.currentPage+1}"/>)'>下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
                             <a onclick='findAllOwer(<s:property value="pageBean.totalPage"/>)'>末页</a>
                         </s:if>
                         <s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp; 末页</s:else>
                   </td>
               </tr>
          </tbody>
        </table>
  </body>
</html>
