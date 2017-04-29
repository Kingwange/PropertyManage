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
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
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
	<script src="assets/js/main.js"></script>
	<script src="js/responsiveslides.min.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/uisearch.js"></script>
	
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
 <div class="banner" id="banner">
       <div class="container">
		<div class="banner-main">
			<ul class="rslides" id="slider">
	        <li>
	  			<h3>上海公馆物业管理系统</h3>
				<p>ShangHai Property Management System</p>
	        </li>
	       <li>
	  			<h3>欢迎您的使用</h3>
				<p>Welcome You to use</p>
	        </li>
	        <li>
	        	<h3>愿您的生活丰富多彩</h3>
				<p>May your Life rich and colorful</p>
	        </li>
	      </ul>
		</div>
       </div>
   </div>
<script >
	$(function () {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
		
		$("#slider").responsiveSlides({
	      	auto: true,
	      	speed: 500,
	        namespace: "callbacks",
	        pager: false,
	        nav:true,
	    });
	});
	
	$( "span.menu" ).click(function() {
		$( "ul.res" ).slideToggle( 300, function() {
		// Animation complete.
		});
	});
</script>

</body>
</html>