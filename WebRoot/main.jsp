<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html class="no-js">
<head>
   <base href="<%=basePath%>">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>上海公馆物业管理系统</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
  <link href='http://fonts.googleapis.com/css?family=Roboto'>
  <link rel="stylesheet" href="assets/css/demo.css">
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/amazeui.min.js"></script>
  <script src="assets/js/app.js"></script>
  <script type="text/javascript" src="assets/js/main.js"></script>
</head>
<body>
<header class="am-topbar admin-header">
  <div class="am-topbar-brand">
    <strong>上海公馆</strong> <small>物业管理系统</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span>${session.users.username}<span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="logout.action"><span class="am-icon-power-off"></span> 退出</a></li>
        </ul>
      </li>
      <li><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar">
    <ul class="am-list admin-sidebar-list">
    <li><a href="main.jsp"><span class="am-icon-home"></span> 首页</a></li>
      <c:if test="${users != null && users.authority =='A'}">
      <li><a class="am-cf" data-am-collapse="{target: '#collapse-nav-1'}"><span class="am-icon-file"></span> 用户管理</a>
       <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav-1">
            <li><a class="am-cf" style="cursor: pointer;" onclick="findAllUsers(1)"><span class="am-icon-check"></span>用户查询 <span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a style="cursor: pointer;" onclick="addUsers()"><span class="am-icon-puzzle-piece"></span> 用户添加 </a></li>
      </ul>
    </li>
    <li><a class="am-cf" data-am-collapse="{target: '#collapse-nav-'}"><span class="am-icon-file"></span>楼宇信息管理</a>
         <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav-">
            <li><a class="am-cf" style="cursor: pointer;" onclick="findAllBuilding(1)"><span class="am-icon-check"></span>楼宇信息查询 <span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a style="cursor: pointer;" onclick="addBuilding()"><span class="am-icon-puzzle-piece"></span> 楼宇信息添加 </a></li>
      </ul>
     </li>
      <li><a class="am-cf" data-am-collapse="{target: '#collapse-nav-2'}"><span class="am-icon-file"></span>房间信息管理</a>
         <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav-2">
             <li><a class="am-cf" style="cursor: pointer;" onclick="findAllRoom(1)"><span class="am-icon-check"></span>房间信息查询 <span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a style="cursor: pointer;" onclick="addRoom()"><span class="am-icon-puzzle-piece"></span> 房间信息添加 </a></li>
      </ul>
     </li>
      <li><a class="am-cf" data-am-collapse="{target: '#collapse-nav-3'}"><span class="am-icon-file"></span>业主信息管理</a>
           <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav-3">
            <li><a class="am-cf" style="cursor: pointer;" onclick="findAllOwer(1)"><span class="am-icon-check"></span>业主信息查询 <span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a style="cursor: pointer;" onclick="addOwer()"><span class="am-icon-puzzle-piece"></span> 业主信息添加 </a></li>
      </ul>
      </li>
      <li><a class="am-cf" data-am-collapse="{target: '#collapse-nav-4'}"><span class="am-icon-file"></span> 住户管理</a>
       <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav-4">
            <li><a class="am-cf" style="cursor: pointer;" onclick="findAllResident(1)"><span class="am-icon-check"></span>住户信息查询 <span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a style="cursor: pointer;" onclick="addResident()"><span class="am-icon-puzzle-piece"></span> 住户信息添加 </a></li>
       </ul>
      </li>
      <li><a class="am-cf" data-am-collapse="{target: '#collapse-nav-5'}"><span class="am-icon-file"></span> 租赁管理</a>
         <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav-5">
            <li><a class="am-cf" style="cursor: pointer;" onclick="findAllHire(1)"><span class="am-icon-check"></span>租赁信息查询 <span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a style="cursor: pointer;" onclick="addHire()"><span class="am-icon-puzzle-piece"></span> 租赁信息添加 </a></li>
       </ul>
      </li>
      <li><a class="am-cf" data-am-collapse="{target: '#collapse-nav-6'}"><span class="am-icon-file"></span> 收费管理</a>
        <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav-6">
            <li><a class="am-cf" style="cursor: pointer;" onclick="findAllCharge(1)"><span class="am-icon-check">收费信息查询 <span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a style="cursor: pointer;" onclick="addCharge()"><span class="am-icon-puzzle-piece"></span> 收费信息添加 </a></li>
       </ul>
      </li>
      <li><a class="am-cf" data-am-collapse="{target: '#collapse-nav-7'}"><span class="am-icon-file"></span> 设备管理</a>
        <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav-7">
            <li><a class="am-cf" style="cursor: pointer;" onclick="findAllEquipment(1)"><span class="am-icon-check"></span>设备信息查询 <span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a style="cursor: pointer;" onclick="addEquipment()"><span class="am-icon-puzzle-piece"></span> 设备信息添加 </a></li>
       </ul>
      </li>
      <li><a class="am-cf" data-am-collapse="{target: '#collapse-nav-8'}"><span class="am-icon-file"></span> 保安管理</a>
        <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav-8">
            <li><a class="am-cf" style="cursor: pointer;" onclick="findAllSecurity(1)"><span class="am-icon-check"></span>保安信息查询 <span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a style="cursor: pointer;" onclick="addSecurity()"><span class="am-icon-puzzle-piece"></span> 保安信息添加 </a></li>
       </ul>
      </li>
      <li><a class="am-cf" data-am-collapse="{target: '#collapse-nav-9'}"><span class="am-icon-file"></span> 保洁环卫管理</a>
       <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav-9">
            <li><a class="am-cf" style="cursor: pointer;" onclick="findAllCleanmanage(1)"><span class="am-icon-check"></span>保洁信息查询 <span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
            <li><a style="cursor: pointer;" onclick="addCleanmanage()"><span class="am-icon-puzzle-piece"></span> 保洁信息添加 </a></li>
       </ul>
      </li>
      </c:if>
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-sign-out"></span> 客户服务管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
          <li><a data-am-collapse="{target: '#collapse-nav-10'}" class="am-cf"><span class="am-icon-sign-out"></span> 维修管理<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a>
            <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav-10">
            <li><a class="am-cf" style="cursor: pointer;" onclick="findAllMaintain(1) "><span class="am-icon-sign-out"></span>维修信息管理 </a>
            </li>
             <c:if test="${users != null && users.authority =='A'}">
            <li><a style="cursor: pointer;" data-am-collapse="{target: '#collapse-nav-12'}" "><span class="am-icon-sign-out"></span> 维修人员管理 </a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav-12">
                  <li><a class="am-cf" style="cursor: pointer;" onclick="findAllMaintainman(1)"><span class="am-icon-check"></span>维修人员查询 <span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
                  <li><a style="cursor: pointer;" onclick="addMaintainman()"><span class="am-icon-puzzle-piece"></span> 维修人员添加 </a></li>
               </ul>
            </li>
            </c:if>
       </ul>
          </li>
           <c:if test="${users != null && users.authority =='A'}">
          <li><a onclick="findAllComplaint(1)" ><span class="am-icon-sign-out"></span> 投诉管理<span class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
          </c:if>
        </ul>
      </li>
    </ul>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      
    </div>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-tag"></span> 欢迎</p>
        <p>Welcome to use PropertyManage!</p>
      </div>
    </div>
  </div>
  <!-- sidebar end -->

  <!-- content start -->
  <div class="admin-content" id="admin-content">
  </div>
  <!-- content end -->

</div>

<footer>
  <hr>
</footer>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<script type="text/javascript">
$(function(){
	$( "#admin-content" ).load( "welcome.html");
})

</script>
</body>
</html>