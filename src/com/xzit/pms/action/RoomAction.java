package com.xzit.pms.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.Building;
import com.xzit.pms.po.Cleanmanage;
import com.xzit.pms.po.Ower;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Room;
import com.xzit.pms.po.Users;
import com.xzit.pms.service.BuildingService;
import com.xzit.pms.service.OwerService;
import com.xzit.pms.service.RoomService;
import com.xzit.pms.service.UsersService;
@SuppressWarnings("serial")
@InterceptorRefs({ @InterceptorRef(value = "paramsPrepareParamsStack", params = {"modelDriven.refreshModelBeforeResult", "true" }) })
public class RoomAction extends BaseAction implements ModelDriven<Room> {
    private Room room=new Room();
    private int page;
	private PageBean pageBean;
	private String queryroom;
	private String querybuild;
	private String queryower;
	private List<Building> buildlist;
	private List<Ower> owerlist;
	private List<Users> userslist;
	@Resource(name ="roomService")
	private RoomService roomServiceimpl;
	@Resource(name="buildingService")
	private BuildingService buildingServiceimpl;
	@Resource(name="owerService")
    private OwerService owerServiceimpl;
	@Resource(name="usersService")
    private UsersService usersServiceimpl;
	@Action(value ="addRoomPage", results = { @Result(name = "success", location = "/room/addroom.jsp") })
	public String addRoomPage() {
		buildlist=buildingServiceimpl.findAll();
		owerlist=owerServiceimpl.findAll();
		userslist=usersServiceimpl.finAll();
		return SUCCESS;
	}

	@Action(value = "saveRoom", results = { @Result(name = "success", type = "redirectAction", location = "findAllRoom.action") })
	public String saveRoom() {
		roomServiceimpl.saveRoom(room);
		return SUCCESS;
	}

	@Action(value = "findAllRoom", results = { @Result(name = "success", location = "/room/findroom.jsp") })
	public String findAllRoom() {
		buildlist=buildingServiceimpl.findAll();
		owerlist=owerServiceimpl.findAll();
		userslist=usersServiceimpl.finAll();
		if (queryroom == null) {
			queryroom = "";
		}
		if (querybuild == null) {
			querybuild = "";
		}
		if (queryower == null) {
			queryower = "";
		}
		if (page == 0)
			page = 1;
		this.req.setAttribute("queryroom", queryroom);
		this.req.setAttribute("querybuild", querybuild);
		this.req.setAttribute("queryower", queryower);
		this.pageBean = roomServiceimpl.queryForPage(2, page, queryroom,querybuild,queryower);
		return SUCCESS;
	}

	@Action(value = "modifyRoompage", results = { @Result(name = "success", location = "/room/updateroom.jsp") })
	public String modifyRoompage() {
		buildlist=buildingServiceimpl.findAll();
		owerlist=owerServiceimpl.findAll();
		userslist=usersServiceimpl.finAll();
		room = roomServiceimpl.findRoomID(room);
		return SUCCESS;
	}

	@Action(value = "updateRoom", results = { @Result(name = "success", type = "redirectAction", location = "findAllRoom.action") })
	public String updateRoom() {
		roomServiceimpl.updateRoom(room);
		return SUCCESS;
	}
	@Action(value = "deleteRoom", results = { @Result(name = "success", type = "redirectAction", location = "findAllRoom.action") })
	public String deleteRoom() {
		roomServiceimpl.deleteRoom(room);
		return SUCCESS;
	}

	@Override
	public Room getModel() {
		if(room == null){
			room = new Room();
	 
	       }
		return room;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public String getQueryroom() {
		return queryroom;
	}

	public void setQueryroom(String queryroom) {
		this.queryroom = queryroom;
	}

	public String getQuerybuild() {
		return querybuild;
	}

	public void setQuerybuild(String querybuild) {
		this.querybuild = querybuild;
	}

	public String getQueryower() {
		return queryower;
	}

	public void setQueryower(String queryower) {
		this.queryower = queryower;
	}

	public List<Building> getBuildlist() {
		return buildlist;
	}

	public void setBuildlist(List<Building> buildlist) {
		this.buildlist = buildlist;
	}

	public List<Ower> getOwerlist() {
		return owerlist;
	}

	public void setOwerlist(List<Ower> owerlist) {
		this.owerlist = owerlist;
	}

	public List<Users> getUserslist() {
		return userslist;
	}

	public void setUserslist(List<Users> userslist) {
		this.userslist = userslist;
	}

}
