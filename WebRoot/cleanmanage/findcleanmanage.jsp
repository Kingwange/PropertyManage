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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">保洁信息</strong> / <small>Cleanmanage</small></div>
      
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
        <form id="cleanmanageconditionForm" >
          <div class="am-input-group am-input-group-sm">
          
			<input type="text" class="am-form-field" id="queryInfo" name="queryInfo" placeholder="清洁工姓名/ Name" value="${queryInfo}">
                <span class="am-input-group-btn">
                  <button class="am-btn am-btn-default" type="button" onclick="findAllCleanmanage(1)">搜索</button>
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
                <th >ID</th>
                <th >姓名</th>
                <th >性别</th>
                <th >联系方式</th> 
                <th >家庭地址</th> 
                <th >保洁区域</th> 
                <th >备注</th>               
                <th width="150px">操作</th>
              </tr>
          </thead>
          	<s:iterator value="pageBean.list"  >
          		<tr>
          			<td ><s:property value="cmid"/></td>
          			<td ><s:property value="cmname"/></td>
                    <td ><s:if test="sex=='M'.toString()">男</s:if>
                    <s:else>女</s:else>
                    </td>
          			<td ><s:property value="tel"/></td> 
                    <td ><s:property value="address"/></td>
                    <td ><s:property value="cleanarea"/></td>
                    <td ><s:property value="remark"/></td> 
          		    <td><button type="button" class="am-btn am-btn-xs am-btn-default am-radius" onclick='getUpdateCleanmanagePage(<s:property value="cmid"/>)'>修改</button>
          			<button type="button" class="am-btn am-btn-xs am-btn-default am-radius" style="color: red" onclick='deleteCleanmanage(<s:property value="cmid"/>)'>删除</button>
          			</td>
          			
          		</tr>
          	</s:iterator>
          	  <tr>
          	  <td></td>
          	  
                     <td  class="tocenter">
                         共
                         <s:property value="pageBean.totalPage" />
                          页
                    </td>
                    <td></td>
                     <td  class="tocenter">
                         共
                         <s:property value="pageBean.allRow" />
                        条记录
                     </td>
                     <td  class="tocenter">
                         当前第
                         <s:property value="pageBean.currentPage" />
                         页
                     </td>
                     <td colspan="4"  class="tocenter">
                         <s:if test="%{pageBean.currentPage == 1}">第1页&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;</s:if>
                        <s:else>
                             <a onclick="findAllCleanmanage(1)">第1页&nbsp;&nbsp;&nbsp;&nbsp;</a>
                             <a onclick='findAllCleanmanage(<s:property value="%{pageBean.currentPage-1}"/>)'>上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
                         </s:else>
                         <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
                             <a onclick='findAllCleanmanage(<s:property value="%{pageBean.currentPage+1}"/>)'>下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
                             <a onclick='findAllCleanmanage(<s:property value="pageBean.totalPage"/>)'>末页</a>
                         </s:if>
                         <s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp; 末页</s:else>
                   </td>
               </tr>
          </tbody>
        </table>
        </form>
        </div>
        </div>
  </body>
</html>
