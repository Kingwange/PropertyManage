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
    
    <title>收费信息添加</title>
   <meta name="keywords" content="ower">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/amazeui.datetimepicker.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/amazeui.datetimepicker.min.js"></script>
  <script src="assets/js/amazeui.min.js"></script>
  <script src="assets/js/app.js"></script>
 </head>
<body>
    <div class="am-cf am-padding">
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加收费信息</strong> / <small>Add Charge</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form am-form-horizontal" id="addChargeForm" data-am-validato>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">房间号 </label>
            <div class="am-u-sm-9">
              <select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
						id="rid" name="room.rid" required="required">
					  <option value="">请选择</option>
				   <s:iterator value="roomlist" >	
                      <option value='<s:property value="rid" />'><s:property value="rname" /></option>
                   </s:iterator>
			</select>
            </div>
          </div>

          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">收费项目</label>
            <div class="am-u-sm-9">
              <select  class="am-input-sm" name="cname" required="required">
					<option value="">请选择</option>
					<option value="W">水费</option>
					<option value="E">电费</option>
					<option value="F">燃气费</option>
					<option value="P">物业费</option>		
			</select>
            </div>
          </div>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">价格</label>
            <div class="am-u-sm-9">
           <input type="text"  id="price" name="price" placeholder="价格/ Price"  >
            </div>
          </div>
           <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">收费状态</label>
            <div class="am-u-sm-9">
              <select  class="am-input-sm" name="chargestate" required="required">
					<option value="">请选择</option>
					<option value="Y">已缴费</option>
					<option value="N">未缴费</option>	
			</select>
            </div>
          </div>
           <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">缴费日期</label>
            <div class="am-u-sm-9">
             <input type="text"  id="chargedate" name="chargedate" placeholder="缴费日期/ Date"  >
            </div>
            <br><br>
           <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">备注</label>
            <div class="am-u-sm-9">
             <textarea type="text"  id="remark" name="remark" placeholder=""  />
            </div>
            </div>
            <br><br>
            <br>
            <br>
          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="button" class="am-btn am-btn-primary" onclick="saveCharge()">保存</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- content end -->
  <script type="text/javascript">
  $('#chargedate').datetimepicker({
	  format: 'yyyy-mm-dd hh:ii'
	});
 $(function(){
	 var today=new Date();
    var y=today.getFullYear();
    var m=today.getMonth()+1;
    var d=today.getDate();
    var h=today.getHours();
    var min=today.getMinutes();
    var localtime =  y+"-"+m+"-"+d+" "+h+":"+min;
	$("#chargedate").val(localtime);
 }); 
</script>
</body>
</html>
