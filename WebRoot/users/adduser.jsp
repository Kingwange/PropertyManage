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
    
    <title>用户添加</title>
  <meta name="keywords" content="ower">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <script type="text/javascript" src="jedate/jedate.min.js"></script>
  <script type="text/javascript" src="jedate/jedate.js"></script>
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/amazeui.min.js"></script>
  <script src="assets/js/app.js"></script>
 </head>
<body>
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加用户信息</strong> / <small>Add Users</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form am-form-horizontal" id="addUsersForm" data-am-validato>
          <div class="am-form-group">
            <label for="building-name" class="am-u-sm-3 am-form-label">用户名称 </label>
            <div class="am-u-sm-9">
              <input type="text" style="width:200px"  placeholder="用户名/ Name" name="username" onblur="checkUsername(this)">
              <small class="error"></small>
            </div>
          </div>

          <div class="am-form-group">
            <label for="building-piles" class="am-u-sm-3 am-form-label">密码 </label>
            <div class="am-u-sm-9">
              <input type="password" style="width:200px"  placeholder="密码/ password" name="password" onblur="checkPassword(this)">
              <small class="error"></small>
            </div>
          </div>

          <div class="am-form-group">
            <label for="building-state" class="am-u-sm-3 am-form-label">用户类别</label>
            <div class="am-u-sm-9">
              <select  class="am-input-sm" name="authority" required="required" style="width:150px" onchange="checktype(this)">
					<option value="">请选择</option>
					<option value="B">普通住户</option>
					<option value="C">维修人员</option>	
			</select>
			<small class="error"></small>
			 <small id="maintain"></small>
            </div>
          </div>
          <br><br>
          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="button" class="am-btn am-btn-primary" onclick="saveUsers()">保存</button>
             
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- content end -->
  <script type="text/javascript">
 
</script>
</body>
</html>
