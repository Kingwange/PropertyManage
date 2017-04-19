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
    
    <title>楼宇添加</title>
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加楼宇信息</strong> / <small>Add Building</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form am-form-horizontal" id="addBuildingForm" data-am-validato>
          <div class="am-form-group">
            <label for="building-name" class="am-u-sm-3 am-form-label">楼宇名称 </label>
            <div class="am-u-sm-9">
              <input type="text" id="bname" placeholder="楼宇名/ Name" name="bname">
            </div>
          </div>

          <div class="am-form-group">
            <label for="building-piles" class="am-u-sm-3 am-form-label">楼宇层数 </label>
            <div class="am-u-sm-9">
              <input type="text" id="plies" placeholder="层数/ piles" name="plies">
            </div>
          </div>

          <div class="am-form-group">
            <label for="building-state" class="am-u-sm-3 am-form-label">楼盘状态</label>
            <div class="am-u-sm-9">
              <select  class="am-input-sm" name="state" required="required">
					<option value="">请选择</option>
					<option value="N">未竣工</option>
					<option value="Y">已竣工</option>		
			</select>
            </div>
          </div>
          <div class="am-form-group">
            <label for="user-phone" class="am-u-sm-3 am-form-label">备注</label>
            <div class="am-u-sm-9">
           <input type="text"  id="remark" name="remark" placeholder=""  >
            </div>
          </div>
          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="button" class="am-btn am-btn-primary" onclick="saveBuilding()">保存</button>
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
