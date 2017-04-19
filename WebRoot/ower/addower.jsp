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
    
    <title>业主添加</title>
  <meta name="keywords" content="ower">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
   <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">
  <script  src="assets/js/bootstrap-datetimepicker.min.js"></script>
  <script src="assets/js/bootstrap-datetimepicker.zh-CN.js"></script>
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/amazeui.min.js"></script>
  <script src="assets/js/app.js"></script>
 </head>
<body>
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加业主</strong> / <small>Add Ower</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form am-form-horizontal" id="addOwerForm" data-am-validato>
          <div class="am-form-group">
            <label for="user-name" class="am-u-sm-3 am-form-label">姓名 </label>
            <div class="am-u-sm-9">
              <input type="text" id="ower-name" placeholder="业主名 / Name" name="oname">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-phone" class="am-u-sm-3 am-form-label">身份证号 </label>
            <div class="am-u-sm-9">
              <input type="text" id="ower-identity" placeholder="输入你的身份证号 / Identity" name="identity">
            </div>
          </div>

          <div class="am-form-group">
            <label for="user-phone" class="am-u-sm-3 am-form-label">联系方式 </label>
            <div class="am-u-sm-9">
              <input type="text" id="ower-tel" placeholder="输入你的联系方式 / Tel" name="tel">
            </div>
          </div>
          <div class="am-form-group">
            <label for="user-phone" class="am-u-sm-3 am-form-label">入住时间 </label>
            <div class="am-u-sm-9">
           <input type="text"  id="intime" name="intime" placeholder="输入你的入住时间 / Date"  readonly>
            </div>
          </div>
           <div class="am-form-group">
            <label for="user-phone" class="am-u-sm-3 am-form-label">备注</label>
            <div class="am-u-sm-9">
              <input type="text" id="ower-tel" placeholder="" name="remark">
            </div>
          </div>
          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="button" class="am-btn am-btn-primary" onclick="saveOwer()">保存</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- content end -->
  <script type="text/javascript">
  $('.date').datetimepicker({
   language: 'zh-CN',//显示中文
   format: 'yyyy-mm-dd',//显示格式
   minView: "month",//设置只显示到月份
   initialDate: new Date(),//初始化当前日期
   autoclose: true,//选中自动关闭
   todayBtn: true//显示今日按钮
   })
    $("#intime").datetimepicker({
    format: 'yyyy-mm-dd',
    minView:'month',
    language: 'zh-CN',
    autoclose:true,
    startDate:new Date()
  });
</script>
</body>
</html>
