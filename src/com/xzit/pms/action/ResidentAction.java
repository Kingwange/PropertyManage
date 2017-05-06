package com.xzit.pms.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Resident;
import com.xzit.pms.po.Room;
import com.xzit.pms.service.BuildingService;
import com.xzit.pms.service.ResidentService;
import com.xzit.pms.service.RoomService;
@SuppressWarnings("serial")
@InterceptorRefs({ @InterceptorRef(value="paramsPrepareParamsStack",params={"modelDriven.refreshModelBeforeResult","true"})}) 
public class ResidentAction extends BaseAction implements ModelDriven<Resident> {
    private Resident resident=new Resident();
    private int page;
    private PageBean pageBean;
    private String queryInfo;
    private String queryroom;
    private List<Room> roomlist;
    @Resource(name="residentService")
    private ResidentService residentServiceimpl;
    @Resource(name ="roomService")
	private RoomService roomServiceimpl;
    @Action(value="addResidentPage",results={@Result(name="success",location="/resident/addresident.jsp")})
	 public String addResidentPage(){
    	roomlist=roomServiceimpl.findAllresident();
	    return SUCCESS;
	 }
   @Action(value="saveResident",results={@Result(name="success",type="redirectAction",location="findAllResident.action")})
  	public String saveResident(){
	   residentServiceimpl.saveResident(resident);
  		return SUCCESS;
  	}
  @Action(value="findAllResident",results={@Result(name="success",location="/resident/findresident.jsp")})
  public String findAllResident() {
	   if(queryInfo==null){
			queryInfo="";
		}
	   if(queryroom==null){
			queryroom="";
		}
		if(page==0)
			page=1;
		roomlist=roomServiceimpl.findAll();
		this.req.setAttribute("queryInfo",queryInfo);
		this.req.setAttribute("queryroom",queryroom);
	    this.pageBean =residentServiceimpl.queryForPage(5, page,queryInfo,queryroom);
	    return SUCCESS;
  }
  @Action(value="modifyResidentpage",results={@Result(name="success",location="/resident/updateresident.jsp")})   
  public String  modifyResidentpage(){
	  roomlist=roomServiceimpl.findAllresident();
	  resident=residentServiceimpl.findResidentID(resident);
		return SUCCESS; 	
 }
	 @Action(value="updateResident",results={@Result(name="success",type="redirectAction",location="findAllResident.action")})
  public String  updateResident(){
		 residentServiceimpl.updateResident(resident);
		return SUCCESS; 	
 }
	 @Action(value="deleteResident",results={@Result(name="success",type="redirectAction",location="findAllResident.action")})
  public String  deleteResident(){
		 residentServiceimpl.deleteResident(resident);
		return SUCCESS; 	
 }
	@Override
	public Resident getModel() {
		if(resident == null){
			resident = new Resident();
	 
	       }
		return resident;
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
	public String getQueryInfo() {
		return queryInfo;
	}
	public void setQueryInfo(String queryInfo) {
		this.queryInfo = queryInfo;
	}
	public String getQueryroom() {
		return queryroom;
	}
	public void setQueryroom(String queryroom) {
		this.queryroom = queryroom;
	}
	public List<Room> getRoomlist() {
		return roomlist;
	}
	public void setRoomlist(List<Room> roomlist) {
		this.roomlist = roomlist;
	}

}
