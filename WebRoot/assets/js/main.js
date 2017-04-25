//用户管理
function addUsers(){
	 $("#admin-content").load("addusersPage.action");
 }
function saveUsers(){
    var addUsersInfo = $("#addUsersForm").serialize();
	  $.post("saveUsers.action",addUsersInfo,function(data){
		  $("#admin-content").html(data);
	  });
 }
function findAllUsers(page){
	var queryUsersInfo = $("#usersconditionForm").serialize();
	  $.post("findAllUsers.action?page="+page,queryUsersInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function getUpdateUsersPage(i){
	$("#admin-content").load("modifyUserspage.action",{"id":i});
}
function updateUsers(){
	 var usersInfo = $("#updateUsersForm").serialize();
 $.post("updateUsers.action",usersInfo,function(data){
	  $("#admin-content").html(data);
  });
 }
 function deleteUsers(i){
		$("#admin-content").load("deleteUsers.action",{"id":i});
 }

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
//住户管理
function addResident(){
	 $("#admin-content").load("addResidentPage.action");
}
function saveResident(){
	var addInfo = $("#addResidentForm").serialize();
	  $.post("saveResident.action",addInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function findAllResident(page){
	var queryResidentInfo = $("#residentconditionForm").serialize();
	  $.post("findAllResident.action?page="+page,queryResidentInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function getUpdateResidentPage(i){
	$("#admin-content").load("modifyResidentpage.action",{"rsid":i});
}
function updateResident(){
	
	 var updateResidentInfo = $("#updateResidentForm").serialize();
   $.post("updateResident.action",updateResidentInfo,function(data){
	  $("#admin-content").html(data);
     });
}
function deleteResident(i){
		$("#admin-content").load("deleteResident.action",{"rsid":i});
}
//收费管理
function addCharge(){
	 $("#admin-content").load("addChargePage.action");
}
function saveCharge(){
	var addInfo = $("#addChargeForm").serialize();
	  $.post("saveCharge.action",addInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function findAllCharge(page){
	var queryChargeInfo = $("#chargeconditionForm").serialize();
	  $.post("findAllCharge.action?page="+page,queryChargeInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function getUpdateChargePage(i){
	$("#admin-content").load("modifyChargepage.action",{"cid":i});
}
function updateCharge(){
	
	 var updateChargeInfo = $("#updateChargeForm").serialize();
  $.post("updateCharge.action",updateChargeInfo,function(data){
	  $("#admin-content").html(data);
    });
}
function deleteCharge(i){
		$("#admin-content").load("deleteCharge.action",{"cid":i});
}
//设备管理
function addEquipment(){
	 $("#admin-content").load("addEquipmentPage.action");
}
function saveEquipment(){
	var addEquipmentInfo = $("#addEquipmentForm").serialize();
	  $.post("saveEquipment.action",addEquipmentInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function findAllEquipment(page){
	var queryEquipmentInfo = $("#equipmentconditionForm").serialize();
	  $.post("findAllEquipment.action?page="+page,queryEquipmentInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function getUpdateEquipmentPage(i){
	$("#admin-content").load("modifyEquipmentpage.action",{"eid":i});
}
function updateEquipment(){
	
	 var updateEquipmentInfo = $("#updateEquipmentForm").serialize();
  $.post("updateEquipment.action",updateEquipmentInfo,function(data){
	  $("#admin-content").html(data);
    });
}
function deleteEquipment(i){
		$("#admin-content").load("deleteEquipment.action",{"eid":i});
}

//租赁管理
function addHire(){
	 $("#admin-content").load("addHirePage.action");
}

function findAllHire(page){
	var queryHireInfo = $("#hireconditionForm").serialize();
	  $.post("findAllHire.action?page="+page,queryHireInfo,function(data){
		  $("#admin-content").html(data);
	  });
}
function getUpdateHirePage(i){
	$("#admin-content").load("modifyHirepage.action",{"hid":i});
}

function deleteHire(i){
		$("#admin-content").load("deleteHire.action",{"hid":i});
}



