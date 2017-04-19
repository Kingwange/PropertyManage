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
	 $("#admin-content").load("findAllBuilding.action?page="+page);
}