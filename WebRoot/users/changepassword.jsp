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
<title>修改密码</title>
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
		width:45%;
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
<div class="contact" style="background-image:url(images/blog11.jpg);background-size: cover">
	<div class="contact-main">
	   <div class="container">
			<div class="contact-top">
				<h3>修改用户密码</h3>
			</div>
			<div class="contact-bottom">
			
				<div class="col-md-7 contact-left" style="boder:1px;color:black">
					
				</div>
				<form id="updatepasswordForm" action="updatepassword.action" method="post">
				 <div class="tableBox"> 
				 <table class="table_content">
				    <tr>
		             <td><input type="hidden" id="id" name="id"  value="${users.id}"></td>
		             </tr>
					<tr><th>请输入原密码</th>
		             <td><input type="password" style="width:150px" name="oldpassword"  onblur="checkIsPassword(this)"/><small class="error"></small></td>
		             </tr>
		            <tr> <th>输入新密码</th>
		             <td><input type="password" style="width:150px" name="password" id="newpassword" onblur="checkPassword(this)"/><small class="error"></small></td>
		             </tr>
		            <tr>
		            	<th>再次输入新密码</th>
		             <td><input type="password" style="width:150px"  name="renewpassword"  onblur="checkIsnewpassword(this)"/><small class="error"></small></td></tr>
		            
		            <tr>
		            	<td>
		            		<input type="button" style="width:50%" onclick="updateOwnpassword()" value="确定修改"><small id="maintain" style="color:red"></small>
		            	</td>
		            </tr>
				</table>
				 </div>
				  </form>
				</div>
		</div>
	</div>

<div class="map">
  <div class="container">
		<div class="col-md-7 map-left">
		<br>
		<br>
		<br>
		</div>
		</div>
		<div class="col-md-5 map-right">
			
	   </div>
	</div>
</div>
</div>


</body>
</html>