<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>主页</title>
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
</head>
<body>
<!-- //end-smoth-scrolling -->
<!--header start here-->
<div class="header">
	<div class="container">
		<div class="header-main">
			<div class="logo">
				<a href="index.jsp"> <img src="images/logo.png" alt="" title=""> </a>
			</div>
			<div class="head-right">
			  <div class="top-nav">
					<span class="menu"> <img src="images/icon.png" alt=""/></span>
				<ul class="res">
					<li><a onclick="skipahomePage()" >主页</a></li>
					<li><a onclick="skipaboutPage()">关于我们</a></li>
					<li><a onclick="skipblogPage()">网上报修</a></li>
					<li><a onclick="skipcontactPage()">客户投诉</a></li>
					<li><a href="#"></a></li>
					<c:if test="${users == null || users.id == 0}">
					<li><a a href="javascript:;" onClick="ShowLoginBox()">登录</a></li>
					</c:if>
	                <c:if test="${users != null && users.id != 0}">
	                
	                <li><a class="am-cf" style="color:blue;fond-size:2px;" id="usersname" class="state" data-am-collapse="{target: '#logout'}">${session.users.username}</a>  
	                </li>
	                 <li><a class="am-cf" style="cursor: pointer;" href="logout.action"><span class="am-icon-check"></span>退出</a></li>
					</c:if>
				<div class="clearfix"> </div>
				</ul>
			 </div>
			 
			<div id="dloginbox">
              <form name="form1" method="post" action="usersLogin.action">
                <div class="loginitem"><input type="text"  id="username" name="username" placeholder="请输入用户名"/></div>
                <div class="loginitem"><input type="password" id="password" name="password" placeholder="请输入密码" /></div>
              <div class="loginitem"><a href="javascript:document.form1.submit();">登录</a></div>
             </form> 
    </div>	
		<div class="clearfix"> </div>
				<script>
					new UISearch( document.getElementById( 'sb-search' ) );
				</script>
		</div>
		
		<div class="clearfix"> </div>
		</div>
	</div>
</div>
<div id="context">
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
</div>

<!--banner strip end here--> 
<!--footer start here-->
<div class="footer">
	<div class="copyright">
	<div class="container">
		<div class="copy-main">
			<div class="copy-left">
			</div>
			<div class="copy-right"> 
				<ul>
					<li><a class="active" href="index.jsp">主页</a></li>/
					<li><a onclick="skipaboutPage()">关于我们</a></li>/
					<li><a onclick="skipblogPage()">网上报修</a></li>/
					<li><a onclick="skipcontactPage()">客户投诉</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
</div>
<!--footer end here-->
</body>
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
</html>