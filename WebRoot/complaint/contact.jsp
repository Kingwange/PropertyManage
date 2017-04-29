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
</style>
</head>
<body>
<!-- //end-smoth-scrolling -->
<!--header start here-->

<!--contact start here-->
<div class="contact">
	<div class="contact-main">
	   <div class="container">
			<div class="contact-top">
				<h3>联系我们</h3>
				<p>您有任何意见都可以联系我们，我们竭诚为您服务！</p>
			</div>
			<div style="heigth:400px;width:1200px;background-image:url(images/back1234.jpg);background-size: cover">
				<div class="col-md-7 contact-left">
				<input class="search" type="button" onclick="findMycomplaint(1)" value="查询">
				<small id="search" style="color:red"></small>
				<div id="complaint-table" style="height:280px">
				</div>
				</div>
				<div class="col-md-5 contact-right">
				<form id="saveComlaintForm" action="saveComplaint.action" method="post" >
					<p>投诉内容</p>
					  <textarea name="cpcontent"  style= "background:transparent;"/> </textarea>
		             <input type="button" onclick="saveComplaint()" value="提交"/>
		             <p><small style="color:red" id="warn"></small></p>
		        </form>
				</div>
				<div class="clearfix" > </div>
		    </div>
	</div>
</div>
<!--contact end here-->
<!--map start here-->
<div class="map">
	<div class="container">
		<div class="col-md-7 map-left">
			<h3>CONTACT INFO</h3>
				        <div class="addre">
					      <h4>地址</h4>
					      <p>地址 : 江苏省 太仓市</p>
						  <p>街道 : 十洲路 </p>
						  <p>电话 : +123 859 6050</p>
					 </div>
		</div>
		<div class="col-md-5 map-right">
			
	   </div>
	</div>
</div>
<!--map end here-->

</body>
</html>