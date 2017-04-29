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
    
    <title>保安信息添加</title>
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加保安信息</strong> / <small>Add Security</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form am-form-horizontal" id="addSecurityForm" data-am-validato>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">保安名称 </label>
            <div class="am-u-sm-9">
              <input type="text" id="sname" placeholder="保安名/ Name" name="sname">
            </div>
          </div>

          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">保安性别</label>
            <div class="am-u-sm-9">
              <select  class="am-input-sm" name="sex" required="required">
					<option value="">请选择</option>
					<option value="M">男</option>
					<option value="F">女</option>		
			</select>
            </div>
          </div>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">身份证 </label>
            <div class="am-u-sm-9">
              <input type="text" id="identity" placeholder="身份证/ Identity" name="identity">
            </div>
          </div>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">联系方式</label>
            <div class="am-u-sm-9">
           <input type="text"  id="tel" name="tel" placeholder="联系方式/ Tel"  >
            </div>
          </div>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">职位</label>
            <div class="am-u-sm-9">
               <select  class="am-input-sm" name="job" required="required">
					<option value="">请选择</option>
					<option value="S">保安队长</option>
					<option value="C">普通保安</option>		
			   </select>
            </div>
          </div>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">家庭住址</label>
            <div class="am-u-sm-9">
           <input type="text"  id="address" name="address" placeholder="家庭住址/ Address"  >
            </div>
          </div>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">负责区域</label>
            <div class="am-u-sm-9">
           <input type="text"  id="territory" name="territory" placeholder="负责区域/ Territory"  >
            </div>
          </div>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">工作时间</label>
            <div class="am-u-sm-9">
            <select  class="am-input-sm" name="worktype" required="required">
					<option value="">请选择</option>
					<option value="D">白班</option>
					<option value="N">夜班</option>		
			   </select>
            </div>
          </div>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">备注</label>
            <div class="am-u-sm-9">
           <textarea type="text"  id="remark" name="remark" placeholder=""  />
            </div>
          </div>
          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="button" class="am-btn am-btn-primary" onclick="saveSecurity()">保存</button>
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
