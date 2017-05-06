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
    
    <title>房间信息添加</title>
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
      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">添加房间信息</strong> / <small>Add Room</small></div>
    </div>

    <hr/>

    <div class="am-g">

      <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
      </div>

      <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
        <form class="am-form am-form-horizontal" id="addRoomForm" data-am-validato>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">楼宇名 </label>
            <div class="am-u-sm-9">
              <select data-am-selected="{btnSize: 'sm'}" style="width:150px" class="am-input-sm"
						id="bid" name="building.bid" required="required" onchange="checktype(this)">
					  <option value="">请选择</option>
				   <s:iterator value="buildlist">	
                      <option value='<s:property value="bid" />'><s:property value="bname" /></option>
                   </s:iterator>
			</select>
			<small class="error"></small>
            </div>
          </div>

          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">房间号</label>
            <div class="am-u-sm-9">
              <input type="text" style="width:200px" placeholder="房间号/ 1B-310" name="rname" onblur="checkRoomName(this)">
               <small class="error"></small>
            </div>
          </div>
          
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">业主姓名</label>
            <div class="am-u-sm-9">
            <select data-am-selected="{btnSize: 'sm'}" style="width:150px" class="am-input-sm"
						id="oid" name="ower.oid" required="required" onchange="checktype(this)">
					  <option value="">请选择</option>
				   <s:iterator value="owerlist">	
                      <option value='<s:property value="oid" />'><s:property value="oname" /></option>
                   </s:iterator>
			</select>
			<small class="error"></small>
            </div>
          </div>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">房型</label>
            <div class="am-u-sm-9">
              <select  style="width:150px"class="am-input-sm" name="type" required="required" onchange="checktype(this)">
					<option value="">请选择</option>
					<option value="One">一居室</option>
					<option value="Two">二居室</option>
					<option value="Three">三居室</option>
					<option value="Four">四居室</option>			
			  </select>
			  <small class="error"></small>
            </div>
          </div>
          <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">房间面积</label>
            <div class="am-u-sm-9">
           <input type="text"  style="width:200px" name="rarea" placeholder="房间面积/ Rarea" onblur="checkArea(this)" />
            <small class="error"></small>
            </div>
          </div>
           <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">用户</label>
            <div class="am-u-sm-9">
            <select data-am-selected="{btnSize: 'sm'}" class="am-input-sm"
						style="width:150px" name="users.id" required="required" onchange="checktype(this)">
					  <option value="">请选择</option>
				   <s:iterator value="userslist">
				     <s:if test="authority=='B'.toString()">	
                      <option value='<s:property value="id" />'><s:property value="username" /></option>
                     </s:if>
                   </s:iterator>
			</select>
			 <small class="error"></small>
			  <small id="maintain"></small>
            </div>
            <br><br>
              <br><br>
          <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
              <button type="button" class="am-btn am-btn-primary" onclick="saveRoom()">保存</button>
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
