/*业主管理*/
function addOwer(){
	 $("#admin-content").load("addowerPage.action");
 }
function saveOwer(){
    var addOwerInfo = $("#addOwerForm").serialize();
	  $.post("saveOwer.action",addOwerInfo,function(data){
		  $("#admin-content").html(data);
	  });
 }
function findAllOwer(page){
	var queryOwerInfo = $("#owerconditionForm").serialize();
	  $.post("findAllOwer.action?page="+page,queryOwerInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function getUpdateOwerPage(i){
	$("#admin-content").load("modifyOwerpage.action",{"oid":i});
}
function updateOwer(){
	 var owerInfo = $("#updateOwerForm").serialize();
 $.post("updateOwer.action",owerInfo,function(data){
	  $("#admin-content").html(data);
  });
 }
 function deleteOwer(i){
		$("#admin-content").load("deleteOwer.action",{"oid":i});
 }
//楼宇管理
 function addBuilding(){
	 $("#admin-content").load("addbuildingPage.action");
 }
function saveBuilding(){
    var addBuildingInfo = $("#addBuildingForm").serialize();
	  $.post("saveBuilding.action",addBuildingInfo,function(data){
		  $("#admin-content").html(data);
	  });
 }
function findAllBuilding(page){
	var queryBuildingInfo = $("#buildingconditionForm").serialize();
	  $.post("findAllBuilding.action?page="+page,queryBuildingInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function getUpdateBuildingPage(i){
	$("#admin-content").load("modifyBuildingpage.action",{"bid":i});
}
function updateBuilding(){
	 var buildingInfo = $("#updateBuildingForm").serialize();
$.post("updateBuilding.action",buildingInfo,function(data){
	  $("#admin-content").html(data);
 });
}
function deleteBuilding(i){
		$("#admin-content").load("deleteBuilding.action",{"bid":i});
}
//保安管理
function addSecurity(){
	 $("#admin-content").load("addSecurityPage.action");
}
function saveSecurity(){
   var addSecurityInfo = $("#addSecurityForm").serialize();
	  $.post("saveSecurity.action",addSecurityInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function findAllSecurity(page){
	var querySecurityInfo = $("#securityconditionForm").serialize();
	  $.post("findAllSecurity.action?page="+page,querySecurityInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function getUpdateSecurityPage(i){
	$("#admin-content").load("modifySecuritypage.action",{"sid":i});
}
function updateSecurity(){
	 var securityInfo = $("#updateSecurityForm").serialize();
$.post("updateSecurity.action",securityInfo,function(data){
	  $("#admin-content").html(data);
});
}
function deleteSecurity(i){
		$("#admin-content").load("deleteSecurity.action",{"sid":i});
}
//保洁管理
function addCleanmanage(){
	 $("#admin-content").load("addCleanmanagePage.action");
}
function saveCleanmanage(){
  var addCleanmanageInfo = $("#addCleanmanageForm").serialize();
	  $.post("saveCleanmanage.action",addCleanmanageInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function findAllCleanmanage(page){
	var queryCleanmanageInfo = $("#cleanmanageconditionForm").serialize();
	  $.post("findAllCleanmanage.action?page="+page,queryCleanmanageInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function getUpdateCleanmanagePage(i){
	$("#admin-content").load("modifyCleanmanagepage.action",{"cmid":i});
}
function updateCleanmanage(){
	 var cleanmanageInfo = $("#updateCleanmanageForm").serialize();
      $.post("updateCleanmanage.action",cleanmanageInfo,function(data){
	  $("#admin-content").html(data);
    });
}
function deleteCleanmanage(i){
		$("#admin-content").load("deleteCleanmanage.action",{"cmid":i});
}
//房间管理
function addRoom(){
	 $("#admin-content").load("addRoomPage.action");
}
function saveRoom(){
  var addRoomInfo = $("#addRoomForm").serialize();
	  $.post("saveRoom.action",addRoomInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function findAllRoom(page){
	var queryRoomInfo = $("#roomconditionForm").serialize();
	  $.post("findAllRoom.action?page="+page,queryRoomInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function getUpdateRoomPage(i){
	$("#admin-content").load("modifyRoompage.action",{"rid":i});
}
function updateRoom(){
	
	 var updateroomInfo = $("#updateRoomForm").serialize();
    $.post("updateRoom.action",updateroomInfo,function(data){
	  $("#admin-content").html(data);
      });
}
function deleteRoom(i){
		$("#admin-content").load("deleteRoom.action",{"rid":i});
}

