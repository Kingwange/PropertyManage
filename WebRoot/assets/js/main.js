/*  
            检测时间是否为空 */
function checkNull(id) {
	// 开始时间
	if (id == "starttime") {
		startTime = $("#starttime").val();

		if (isNull(startTime)) {
			$("#stime").html("入住时间不能为空");
			return false;
		}
		return true;
	}

	// 结束时间
	if (id == "endtime") {
		endTime = $("#endtime").val();

		if (isNull(endTime)) {
			$("#etime").html("到期时间不能为空");
			return false;
		}
		return true;
	}
}

/*
 * 检测开始时间是否小于结束时间（字符串也可以之间比较难控制相差的时间长度，使用毫秒计算）
 */
function checkDate() {
	var startTimeMills = getDateMillsByDateString("starttime");
	var endTIimeMills = getDateMillsByDateString("endtime");
	// 开始时间和结束世间的最大间隔：3天
	// var interval = 365*24*60*60*1000;
	if (startTimeMills < endTIimeMills && (endTIimeMills - startTimeMills) > 0) {
		return true;
	}
	$("#etime").html("到期时间必须大于入住时间");
	return false;
}

/* 
 */

// 将字符串时间(yyyy-MM-dd HH:mm:ss)转换成毫秒
function getDateMillsByDateString(timeId) {
	var timeStr = $("#" + timeId).val();

	var dateAndTimeArray = timeStr.split(" ");
	var dateArray = dateAndTimeArray[0].split("-");

	var date = new Date(dateArray[0], dateArray[1], dateArray[2]);

	var dateMills = date.getTime();

	return dateMills;
}

// 判断字符串时间是否为空
function isNull(timeString) {
	if (timeString == null || timeString == "") {
		return true;
	}
	return false;
}
// 检测姓名是否为空和中文
function checkName(obj) {
	var china = /[\u4e00-\u9fa5]/;
	var name = $(obj).val();
	var error = $(obj).next();
	if (name == "") {
		error.html("姓名不能为空!");
	} else {
		error.html("");
		if (!(name.match(china))) {
			error.html("姓名只能为中文!");

		} else if (!(name.length > 1 && name.length < 4)) {
			error.html("长度2到4位!");
		} else

			return true;
	}
}
// 检测电话是否为空和类型，长度
function checkTel(obj) {
	var phone = $(obj).val();
	var error = $(obj).next();
	if (!(/^1[34578]\d{9}$/.test(phone))) {
		error.html("电话输入有误!");
	} else {
		error.html("");
		return true;
	}
}
// 检测备注内容是否为空
function checkRemark(obj) {
	var remark = $(obj).val();
	var error = $(obj).next();
	if (remark == "") {
		error.html("内容不能为空!");
	} else {
		error.html("");
		return true;
	}
}
// 验证用户
function checkUsername(obj) {
	var username = $(obj).val();
	var error = $(obj).next();
	if (username == "") {
		error.html("用户名不能为空!");
	} else {
		error.html("");
		if (!(/^[A-Za-z0-9]+$/.test(username))) {
			error.html("用户名为英文或数字组成!");
		} else {
			error.html("");
			if (!(username.length > 4 && username.length <= 10)) {
				error.html("长度5到10位!");
			} else {
				error.html("");
				$.post("checkName.action", {
					"username" : username
				}, function(data) {
					if (data == 0) {
						error.html("用户已存在");
					} else {
						error.html("");
					}
				});
			}
		}
	}
}
// 密码验证
function checkPassword(obj) {
	var password = $(obj).val();
	var error = $(obj).next();
	if (password == "") {
		error.html("密码不能为空");
	} else {
		error.html("");
		if (!(/^[A-Za-z0-9]+$/.test(password))) {
			error.html("密码必须为英文或者数字组成");
		} else {
			error.html("");
			if (!(password.length > 5 && password.length < 21)) {
				error.html("密码长度6~20位");
			} else {
				error.html("");
				return true;
			}
		}
	}
}
// 验证下拉框
function checktype(obj) {
	var type = $(obj).val();
	var error = $(obj).next();
	if (type == "") {
		error.html("下拉选项不能为空");

	} else {
		error.html("");
		return true;
	}
}
// 验证楼宇名称
function checkBuildingname(obj) {
	var pram = /^[a-zA-Z0-9\u4e00-\u9fa5]+$/;
	var buildname = $(obj).val();
	var error = $(obj).next();
	if (buildname == "") {
		error.html("楼层名称不能为空!");
	} else {
		error.html("");
		if (!(pram.test(buildname))) {
			error.html("楼层名称由数字英文中文组成!");
		} else {
			error.html("");
			$.post("checkbuildingName.action", {
				"bname" : buildname
			}, function(data) {
				if (data == 0) {
					error.html("楼宇名称已存在");
				} else {
					error.html("");

				}
			});
		}
	}

}
// 楼宇层数
function checkPiles(obj) {
	var plies = $(obj).val();
	var error = $(obj).next();
	if (plies == "") {
		error.html("楼层层数不能为空!");
	} else {
		error.html("");
		if (!(/^[0-9]*$/.test(plies))) {
			error.html("楼层必须为数字!");
		} else {
			error.html("");
			if (plies > 30) {
				error.html("楼层不能超过30层!");
			} else {
				error.html("");
				return true;
			}
		}
	}

}
// 房间管理
function checkRoomName(obj) {
	var pram = /^[A-Za-z0-9]+$/;
	var roomname = $(obj).val();
	var error = $(obj).next();
	if (roomname == "") {
		error.html("房间名称不能为空!");
	} else {
		error.html("");
		if (!(pram.test(roomname))) {
			error.html("房间名称由数字英文组成!");
		} else {
			error.html("");
			$.post("checkroomName.action", {
				"rname" : roomname
			}, function(data) {
				if (data == 0) {
					error.html("房间名称已存在");
				} else {
					error.html("");

				}
			});
		}
	}

}
// 房间面积
function checkArea(obj) {
	var area = $(obj).val();
	var error = $(obj).next();
	if (area == "") {
		error.html("房间面积不能为空!");
	} else {
		error.html("");
		if (!(/^[0-9]*$/.test(area))) {
			error.html("房间面积必须为数字!");
		} else {
			error.html("");
			return true;
		}
	}
}

// 用户管理
function skipaboutPage() {
	$("#context").load("skipaboutPage.action");
}

function skipahomePage() {
	$("#context").load("skipahomePage.action");
}
function addUsers() {
	$("#admin-content").load("addusersPage.action");
}
function saveUsers() {
	if ("" == $(".error").val()) {
		$("#maintain").html("");
		var addUsersInfo = $("#addUsersForm").serialize();
		$.post("saveUsers.action", addUsersInfo, function(data) {
			$("#admin-content").html(data);
		});
	} else {
		$("#maintain").html("新增信息有误！");
	}

}
function findAllUsers(page) {
	var queryUsersInfo = $("#usersconditionForm").serialize();
	$.post("findAllUsers.action?page=" + page, queryUsersInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function getUpdateUsersPage(i) {
	$("#admin-content").load("modifyUserspage.action", {
		"id" : i
	});
}
function updateUsers() {
	if ("" == $(".error").val()) {
		$("#maintain").html("");
		var usersInfo = $("#updateUsersForm").serialize();
		$.post("updateUsers.action", usersInfo, function(data) {
			$("#admin-content").html(data);
		});
	} else {
		$("#maintain").html("更新信息有误");
	}
}
function deleteUsers(i) {
	$("#admin-content").load("deleteUsers.action", {
		"id" : i
	});
}

/* 业主管理 */
function addOwer() {
	$("#admin-content").load("addowerPage.action");
}
function saveOwer() {
	var addOwerInfo = $("#addOwerForm").serialize();
	$.post("saveOwer.action", addOwerInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function findAllOwer(page) {
	var queryOwerInfo = $("#owerconditionForm").serialize();
	$.post("findAllOwer.action?page=" + page, queryOwerInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function getUpdateOwerPage(i) {
	$("#admin-content").load("modifyOwerpage.action", {
		"oid" : i
	});
}
function updateOwer() {
	var owerInfo = $("#updateOwerForm").serialize();
	$.post("updateOwer.action", owerInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function deleteOwer(i) {
	$("#admin-content").load("deleteOwer.action", {
		"oid" : i
	});
}
// 楼宇管理
function addBuilding() {
	$("#admin-content").load("addbuildingPage.action");
}
function saveBuilding() {
	if ("" == $(".error").val()) {
		$("#maintain").html("");
		var addBuildingInfo = $("#addBuildingForm").serialize();
		$.post("saveBuilding.action", addBuildingInfo, function(data) {
			$("#admin-content").html(data);
		});
	} else {
		$("#maintain").html("新增信息有误！");
	}
}
function findAllBuilding(page) {
	var queryBuildingInfo = $("#buildingconditionForm").serialize();
	$.post("findAllBuilding.action?page=" + page, queryBuildingInfo, function(
			data) {
		$("#admin-content").html(data);
	});
}
function getUpdateBuildingPage(i) {
	$("#admin-content").load("modifyBuildingpage.action", {
		"bid" : i
	});
}
function updateBuilding() {
	if ("" == $(".error").val()) {
		$("#maintain").html("");
		var buildingInfo = $("#updateBuildingForm").serialize();
		$.post("updateBuilding.action", buildingInfo, function(data) {
			$("#admin-content").html(data);
		});
	} else {
		$("#maintain").html("更新信息有误！");
	}
}
function deleteBuilding(i) {
	$("#admin-content").load("deleteBuilding.action", {
		"bid" : i
	});
}
// 保安管理
function addSecurity() {
	$("#admin-content").load("addSecurityPage.action");
}
function saveSecurity() {
	var addSecurityInfo = $("#addSecurityForm").serialize();
	$.post("saveSecurity.action", addSecurityInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function findAllSecurity(page) {
	var querySecurityInfo = $("#securityconditionForm").serialize();
	$.post("findAllSecurity.action?page=" + page, querySecurityInfo, function(
			data) {
		$("#admin-content").html(data);
	});
}
function getUpdateSecurityPage(i) {
	$("#admin-content").load("modifySecuritypage.action", {
		"sid" : i
	});
}
function updateSecurity() {
	var securityInfo = $("#updateSecurityForm").serialize();
	$.post("updateSecurity.action", securityInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function deleteSecurity(i) {
	$("#admin-content").load("deleteSecurity.action", {
		"sid" : i
	});
}
// 保洁管理
function addCleanmanage() {
	$("#admin-content").load("addCleanmanagePage.action");
}
function saveCleanmanage() {
	var addCleanmanageInfo = $("#addCleanmanageForm").serialize();
	$.post("saveCleanmanage.action", addCleanmanageInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function findAllCleanmanage(page) {
	var queryCleanmanageInfo = $("#cleanmanageconditionForm").serialize();
	$.post("findAllCleanmanage.action?page=" + page, queryCleanmanageInfo,
			function(data) {
				$("#admin-content").html(data);
			});
}
function getUpdateCleanmanagePage(i) {
	$("#admin-content").load("modifyCleanmanagepage.action", {
		"cmid" : i
	});
}
function updateCleanmanage() {
	var cleanmanageInfo = $("#updateCleanmanageForm").serialize();
	$.post("updateCleanmanage.action", cleanmanageInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function deleteCleanmanage(i) {
	$("#admin-content").load("deleteCleanmanage.action", {
		"cmid" : i
	});
}
// 房间管理
function addRoom() {
	$("#admin-content").load("addRoomPage.action");
}
function saveRoom() {
	if ("" == $(".error").val()) {
		$("#maintain").html("");
		var addRoomInfo = $("#addRoomForm").serialize();
		$.post("saveRoom.action", addRoomInfo, function(data) {
			$("#admin-content").html(data);
		});
	} else {
		$("#maintain").html("新增信息有误！");
	}
}
function findAllRoom(page) {
	var queryRoomInfo = $("#roomconditionForm").serialize();
	$.post("findAllRoom.action?page=" + page, queryRoomInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function getUpdateRoomPage(i) {
	$("#admin-content").load("modifyRoompage.action", {
		"rid" : i
	});
}
function updateRoom() {
	if ("" == $(".error").val()) {
		$("#maintain").html("");
		var updateroomInfo = $("#updateRoomForm").serialize();
		$.post("updateRoom.action", updateroomInfo, function(data) {
			$("#admin-content").html(data);
		});
	} else {
		$("#maintain").html("新增信息有误！");
	}
}
function deleteRoom(i) {
	$("#admin-content").load("deleteRoom.action", {
		"rid" : i
	});
}
// 住户管理
function addResident() {
	$("#admin-content").load("addResidentPage.action");
}
function saveResident() {
	var addInfo = $("#addResidentForm").serialize();
	$.post("saveResident.action", addInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function findAllResident(page) {
	var queryResidentInfo = $("#residentconditionForm").serialize();
	$.post("findAllResident.action?page=" + page, queryResidentInfo, function(
			data) {
		$("#admin-content").html(data);
	});
}
function getUpdateResidentPage(i) {
	$("#admin-content").load("modifyResidentpage.action", {
		"rsid" : i
	});
}
function updateResident() {

	var updateResidentInfo = $("#updateResidentForm").serialize();
	$.post("updateResident.action", updateResidentInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function deleteResident(i) {
	$("#admin-content").load("deleteResident.action", {
		"rsid" : i
	});
}
// 收费管理
function addCharge() {
	$("#admin-content").load("addChargePage.action");
}
function saveCharge() {
	var addInfo = $("#addChargeForm").serialize();
	$.post("saveCharge.action", addInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function findAllCharge(page) {
	var queryChargeInfo = $("#chargeconditionForm").serialize();
	$.post("findAllCharge.action?page=" + page, queryChargeInfo,
			function(data) {
				$("#admin-content").html(data);
			});
}
function getUpdateChargePage(i) {
	$("#admin-content").load("modifyChargepage.action", {
		"cid" : i
	});
}
function updateCharge() {

	var updateChargeInfo = $("#updateChargeForm").serialize();
	$.post("updateCharge.action", updateChargeInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function deleteCharge(i) {
	$("#admin-content").load("deleteCharge.action", {
		"cid" : i
	});
}
// 设备管理
function addEquipment() {
	$("#admin-content").load("addEquipmentPage.action");
}
function saveEquipment() {
	var addEquipmentInfo = $("#addEquipmentForm").serialize();
	$.post("saveEquipment.action", addEquipmentInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function findAllEquipment(page) {
	var queryEquipmentInfo = $("#equipmentconditionForm").serialize();
	$.post("findAllEquipment.action?page=" + page, queryEquipmentInfo,
			function(data) {
				$("#admin-content").html(data);
			});
}
function getUpdateEquipmentPage(i) {
	$("#admin-content").load("modifyEquipmentpage.action", {
		"eid" : i
	});
}
function updateEquipment() {

	var updateEquipmentInfo = $("#updateEquipmentForm").serialize();
	$.post("updateEquipment.action", updateEquipmentInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function deleteEquipment(i) {
	$("#admin-content").load("deleteEquipment.action", {
		"eid" : i
	});
}

// 租赁管理
function addHire() {
	$("#admin-content").load("addHirePage.action");
}
function saveHire() {
	if (!checkNull('starttime')) {
		$("#stime").html("入住时间不能为空");
		return;
	}
	if (!checkNull('endtime')) {
		$("#etime").html("到期时间不能为空");
		return;
	}
	if (!checkDate()) {
		$("#etime").html("到期时间必须大于入住时间");
		return;
	}
	var addHireinfo = $("#addHireForm").serialize();
	$.post("saveHire.action", addHireinfo, function(data) {
		$("#admin-content").html(data);
	});
}
function updateHire() {
	alert(123);
	if (!checkNull('starttime')) {
		$("#stime").html("入住时间不能为空");
		return;
	}
	if (!checkNull('endtime')) {
		$("#etime").html("到期时间不能为空");
		return;
	}
	if (!checkDate()) {
		$("#etime").html("到期时间必须大于入住时间");
		return;
	}
	var updateHireInfo = $("#updateHireForm").serialize();
	$.post("updateHire.action", updateHireInfo, function(data) {
		$("#admin-content").html(data);
	});
}

function findAllHire(page) {
	var queryHireInfo = $("#hireconditionForm").serialize();
	$.post("findAllHire.action?page=" + page, queryHireInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function getUpdateHirePage(i) {
	$("#admin-content").load("modifyHirepage.action", {
		"hid" : i
	});
}

function deleteHire(i) {
	$("#admin-content").load("deleteHire.action", {
		"hid" : i
	});
}
// 维修人员管理
function addMaintainman() {
	$("#admin-content").load("addMaintainmanPage.action");
}
function saveMaintainman() {
	var addMaintainmanInfo = $("#addMaintainmanForm").serialize();
	$.post("saveMaintainman.action", addMaintainmanInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function findAllMaintainman(page) {
	var queryMaintainmanInfo = $("#maintainmanconditionForm").serialize();
	$.post("findAllMaintainman.action?page=" + page, queryMaintainmanInfo,
			function(data) {
				$("#admin-content").html(data);
			});
}
function getUpdateMaintainmanPage(i) {
	$("#admin-content").load("modifyMaintainmanpage.action", {
		"mmid" : i
	});
}
function updateMaintainman() {

	var updateMaintainmanInfo = $("#updateMaintainmanForm").serialize();
	$.post("updateMaintainman.action", updateMaintainmanInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function deleteMaintainman(i) {
	$("#admin-content").load("deleteMaintainman.action", {
		"mmid" : i
	});
}
// 维修管理
function skipblogPage() {
	$("#context").load("skipblogPage.action");
}

function saveMaintain() {
	if ($("#usersname").html() != "") {
		$("#maintain").html("");
		if ("" == $(".error").val()) {
			$("#maintain").html("");
			$("#addMaintainForm").submit();
		} else {
			$("#maintain").html("填写信息有误！");
		}

	} else {
		$("#maintain").html("报修请先登录！");

	}
}
function findAllMaintain(page) {
	var queryMaintainInfo = $("#maintainconditionForm").serialize();
	$.post("findAllMaintain.action?page=" + page, queryMaintainInfo, function(
			data) {
		$("#admin-content").html(data);
	});
}
function getUpdateMaintainPage(i) {
	$("#admin-content").load("modifyMaintainpage.action", {
		"mid" : i
	});
}
function updateMaintain() {
	var updateMaintainInfo = $("#updateMaintainForm").serialize();
	$.post("updateMaintain.action", updateMaintainInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function deleteMaintain(i) {
	$("#admin-content").load("deleteMaintain.action", {
		"mid" : i
	});
}
// 投诉管理
function skipcontactPage() {
	$("#context").load("skipcontactPage.action");
}
function saveComplaint() {
	if ($("#usersname").html() != null)
		$("#saveComlaintForm").submit();
	else {
		$("#warn").html("投诉请先登录！");
		setTimeout(function() {
			$("#warn").fadeOut(2000);
		}, 2300);
	}
}
function findAllComplaint(page) {
	var queryComplaintInfo = $("#complaintconditionForm").serialize();
	$.post("findAllComplaint.action?page=" + page, queryComplaintInfo,
			function(data) {
				$("#admin-content").html(data);
			});
}
function findMycomplaint(page) {
	if ($("#usersname").html() == null) {
		$("#search").html("查询请先登录！");
		setTimeout(function() {
			$("#search").fadeOut(2000);
		}, 2300);
	} else {
		$.post("findMycomplaint.action?page=" + page, function(data) {
			$("#complaint-table").html(data);
		});
	}
}
function getUpdateComplaintPage(i) {
	$("#admin-content").load("modifyComplaintpage.action", {
		"cpid" : i
	});
}
function updateComplaint() {
	var updateComplaintInfo = $("#updateComplaintForm").serialize();
	$.post("updateComplaint.action", updateComplaintInfo, function(data) {
		$("#admin-content").html(data);
	});
}
function deleteComplaint(i) {
	$("#admin-content").load("deleteComplaint.action", {
		"cpid" : i
	});
}
