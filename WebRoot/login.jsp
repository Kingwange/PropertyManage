<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
	
    <link href="assets/css/demo.css" rel="stylesheet" />
	
    <script src="assets/js/jquery-1.10.2.min.js"></script>
    <script src="assets/layer/layer.js"></script>
    <script src="assets/js/demo.js"></script>
	
</head>
<body>
<div id="header">
        <div class="hitem dlogin"><a href="javascript:;" onClick="ShowLoginBox()">登录</a></div>
    </div>
	 <div id="name">
	    <scan>上海公馆物业管理系统</scan>
	 </div>
	<div id="pic"><div class="img"><img src="assets/img/background.jpg"/></div> </div>
    <div id="dloginbox">
        <form name="form1" method="post" action="usersLogin.action">
        <div class="loginitem"><input type="text"  id="username" name="username" placeholder="请输入用户名"/></div>
        <div class="loginitem"><input type="password" id="password" name="password" placeholder="请输入密码" /></div>
        <div class="loginitem"><a href="javascript:document.form1.submit();">登录</a></div>
    </div>
    </form> 
</body>
</html>
