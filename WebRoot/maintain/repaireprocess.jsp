<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>投诉管理</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.0.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }>

</script>
<meta name="keywords"
	content="Auction Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndriodCompatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<link href="assets/css/demo.css" rel="stylesheet" />
<script src="assets/js/jquery-1.10.2.min.js"></script>
<script src="assets/layer/layer.js"></script>
<script src="assets/js/demo.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
<style>
.table_content {
	text-align: center;
}

.table_content th {
	text-align: center;
}
</style>
</head>
<body>
	<!-- //end-smoth-scrolling -->
	<!--header start here-->

	<!--contact start here-->
	<div class="contact"
		style="heigth:400px;width:1348px;background-image:url(images/blog11.jpg);background-size: cover">
		<div class="contact-main">
			<div class="container">
				<div class="contact-top">
					<h3>服务至上</h3>
					<p>努力为客户解决问题！</p>
				</div>
				<div>
					<div class="clearfix">
						<table class="table_content">
							<thead>
								<tr>
									<th style="width:3%">ID</th>
									<th style="width:7%">房间号</th>
									<th style="width:7%">维修类别</th>
									<th style="width:12%">维修内容</th>
									<th style="width:7%">报修人</th>
									<th style="width:10%">联系方式</th>
									<th style="width:15%">报修时间</th>
									<th style="width:7%">维修状态</th>
									<th style="width:7%">备注</th>
									<th style="width:35%">操作</th>
								</tr>
							</thead>
							<tbody>

								<s:iterator value="pageBean.list">

									</form>
									<tr>
										<td><s:property value="mid" /></td>
										<td><s:property value="room.rname" /></td>
										<td><s:if test="maintainman.repairtype.equals('Wood')">木工类</s:if>
											<s:elseif test="maintainman.repairtype.equals('Air')">空调类</s:elseif>
											<s:elseif test="maintainman.repairtype.equals('Warm')">气暖类</s:elseif>
											<s:elseif test="maintainman.repairtype.equals('Lock')">锁具</s:elseif>
											<s:elseif test="maintainman.repairtype.equals('Water')">水类</s:elseif>
											<s:elseif test="maintainman.repairtype.equals('Power')">电类</s:elseif>
											<s:else>其它</s:else></td>
										<td><s:property value="mcontent" /></td>
										<td><s:property value="mname" /></td>
										<td><s:property value="mtel" /></td>
										<td><s:date name="repairdate" format="yyyy-MM-dd HH:mm" /></td>
										<td>
											<form id="updateOwnMaintainForm<s:property value="mid"/>">
												<input type="hidden" name="mid" value='<s:property value="mid"/>' /> 
												<input type="hidden" class="am-checkbox-inline" name="room.rid" width="50"
													value='<s:property value="room.rid"/>' /> 
												<input type="hidden" class="am-checkbox-inline" name="maintainman.mmid" width="50"
													value='<s:property value="maintainman.mmid"/>'> 
												<input
													type="hidden" class="am-checkbox-inline" name="mcontent"
													width="50" value='<s:property value="mcontent"/>' /> 
												<input
													type="hidden" class="am-checkbox-inline" name="mname"
													width="50" value='<s:property value="mname"/>'/> 
												<input
													type="hidden" class="am-checkbox-inline" name="mtel"
													width="50" value='<s:property value="mtel"/>' /> 
												<input
													type="hidden" class="am-checkbox-inline" name="repairdate"
													width="50" value='<s:property value="repairdate"/>' /> 
												<select
													class="class=" am-form-field"" id="type" name="type"
													required="required"><s:if
														test="type=='N'.toString()">
														<option value="N">未处理</option>
														<option value="Y">已处理</option>
													</s:if>
													<s:else>
														<option value="Y">已处理</option>
														<option value="N">未处理</option>
													</s:else>
												</select> 
												<input type="hidden" class="am-checkbox-inline"
													name="remark" width="50"
													value='<s:property value="remark"/>'>
											
										</td>
										<td><s:property value="remark" /></td>
										<td><button type="button" style="width:130px"
												class="am-btn am-btn-xs am-btn-default am-radius"
												onclick='updateOwnMaintain(<s:property value="mid"/>)'>确认修改</button></td>
                                           </form>
									</tr>

								</s:iterator>
							</tbody>
						</table>
						<table>
							<tr>
								<td width="7%"></td>
								<td width="14%" class="tocenter">共 <s:property
										value="pageBean.totalPage" /> 页
								</td>
								<td width="25%" class="tocenter">共 <s:property
										value="pageBean.allRow" /> 条记录
								</td>
								<td width="10%" class="tocenter">当前第 <s:property
										value="pageBean.currentPage" /> 页
								</td>
								<td width="7%"></td>
								<td colspan="4" width="37%" class="tocenter"><s:if
										test="%{pageBean.currentPage == 1}">第1页&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;</s:if>
									<s:else>
										<a onclick="findmaintaininfo(1)">第1页&nbsp;&nbsp;&nbsp;&nbsp;</a>
										<a
											onclick='findmaintaininfo(<s:property value="%{pageBean.currentPage-1}"/>)'>上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
									</s:else> <s:if test="%{pageBean.currentPage != pageBean.totalPage}">
										<a
											onclick='findmaintaininfo(<s:property value="%{pageBean.currentPage+1}"/>)'>下一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
										<a
											onclick='findmaintaininfo(<s:property value="pageBean.totalPage"/>)'>末页</a>
									</s:if> <s:else>下一页&nbsp;&nbsp;&nbsp;&nbsp; 末页</s:else></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!--contact end here-->
		<!--map start here-->
		<div class="map">
			<div class="container">
				<div class="col-md-7 map-left"></div>
			</div>
			<div class="col-md-5 map-right"></div>
		</div>
	</div>
	<!--map end here-->

</body>
</html>