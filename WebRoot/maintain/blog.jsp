<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>投诉管理</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }>
</script>
<meta name="keywords" content="Auction Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndriodCompatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<link href="assets/css/demo.css" rel="stylesheet" />
    <script src="assets/js/jquery-1.10.2.min.js"></script>
    <script src="assets/layer/layer.js"></script>
    <script src="assets/js/demo.js"></script>
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
<style>
	.table_content{
		width:45%;
		margin:0 auto;
	}
	
	.table_content tr th{
		width:20%;
		padding:5px 0 5px 0px;
	}
	.table_content tr td{
		width:35%;
		padding:5px 0 5px 0px;
	}
	.table_content tr td input{
		width:25%;
	}
	.table_content tr td select{
		width:45%;
	}
	.table_content tr td textarea{
		width:95%;
		
	}
</style>
</head>
<body>
<!-- //end-smoth-scrolling -->
<div class="contact" style="heigth:423px;width:1349px;background-image:url(images/blog11.jpg);background-size: cover">
	<div class="contact-main">
	   <div class="container">
			<div class="contact-top">
				<h3>填写报修信息</h3>
			</div>
			<div class="contact-bottom">
			
				<div class="col-md-7 contact-left" style="boder:1px;color:black">
					
				</div>
				<form id="addMaintainForm" action="saveMaintain.action" method="post">
				 <div class="tableBox"> 
				 <table class="table_content">
					<tr><th>姓名</th>
		             <td><input type="text" style="width:200px" name="mname" id="name" onblur="checkName('name')"/><small id="errname" style="color:red"></small></td>
		             </tr>
		            <tr>
		            
		            <th>联系电话</th>
		             <td><input type="text" style="width:200px" name="mtel"/></td></tr>
		            <tr><th>房间号</th>
		            <td>
		            <select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
						id="rid" name="room.rid" required="required">
					  <option value="">请选择</option>
				        <s:iterator value="roomlist" >	
                      <option value='<s:property value="rid" />'><s:property value="rname" /></option>
                        </s:iterator>
			        </select>
			        </td>
			        </tr>
		            <tr>
		            	<th>报修类别</th>
		            	<td><select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
						 name="maintainman.mmid" required="required">
					  <option value="">请选择</option>
				        <s:iterator value="maintainmanlist" >	
                      <option value='<s:property value="mmid" />'>
                        <s:if test="repairtype.equals('Wood')">木工类</s:if>
                        <s:elseif test="repairtype.equals('Warm')">气暖类</s:elseif>
                        <s:elseif test="repairtype.equals('Lock')">锁具类</s:elseif>
                        <s:elseif test="repairtype.equals('Air')">空调类</s:elseif>
                        <s:elseif test="repairtype.equals('Water')">水类</s:elseif>
                        <s:elseif test="repairtype.equals('Power')">电类</s:elseif>
                        <s:else>其它</s:else>
                      </option>
                        </s:iterator>
			        </select></td>
		            </tr>
				
					<tr>
						<th>报修内容</th>
						<td>
						<textarea name="mcontent" style= "background:transparent;"/> </textarea>
						</td>
					</tr>
		            <tr>
		            	<td>
		            		<input type="button" style="width:50%" onclick="saveMaintain()" value="报修"><small id="maintain" style="color:red"></small>
		            	</td>
		            </tr>
				</table>
				 </div>
				  </form>
				</div>
		</div>
	</div>
</div>
<!--contact end here-->
<!--map start here-->


</body>
</html>