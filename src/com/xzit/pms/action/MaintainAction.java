package com.xzit.pms.action;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.Maintain;
import com.xzit.pms.po.Maintainman;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Room;
import com.xzit.pms.po.Users;
import com.xzit.pms.service.MaintainService;
import com.xzit.pms.service.MaintainmanService;
import com.xzit.pms.service.RoomService;
@SuppressWarnings("serial")
@InterceptorRefs({ @InterceptorRef(value = "paramsPrepareParamsStack", params = {"modelDriven.refreshModelBeforeResult", "true" }) })
public  class MaintainAction extends BaseAction implements ModelDriven<Maintain> {
    private Maintain maintain=new Maintain();
    private int page;
	private PageBean pageBean;
	private String queryroom;
	private String querytype;
	private String queryrepairtype;
	private Room room=new Room();
	Date date =new Date();
	List<Room> roomlist;
	List<Maintainman> maintainmanlist;
	@Resource(name="maintainmanService")
	private MaintainmanService maintainmanServiceimpl;
	@Resource(name="roomService")
	private RoomService roomServiceimpl;
    @Resource(name="maintainService")
	private MaintainService maintainServiceimpl;
  @Action(value="skipblogPage",results={@Result(name="success",location="/maintain/blog.jsp")})
	 public String skipblogPage(){
	  roomlist=roomServiceimpl.findAll();
	  maintainmanlist=maintainmanServiceimpl.findAll();
	    return SUCCESS;
	 }
  @Action(value="saveMaintain",results={@Result(name="success",location="/index.jsp")})
 	public String saveMaintain(){
	    room=roomServiceimpl.findUserID((Users)(session.get("users")));
	    maintain.setRoom(room);
        maintain.setType("N");
        maintain.setRepairdate(date);
        System.out.println("时间");
	    maintainServiceimpl.saveMaintain(maintain);
	    System.out.println("成功");
 		return SUCCESS;
 	}
 @Action(value="findAllMaintain",results={@Result(name="success",location="/maintain/findmaintain.jsp")})
 public String findAllMaintain() {
	   if(queryroom==null){
			queryroom="";
		}
	   if(querytype==null){
			querytype="";
		}
	   if(queryrepairtype==null){
		   queryrepairtype="";
		}
		if(page==0)
			page=1;
		roomlist=roomServiceimpl.findAll();
		maintainmanlist=maintainmanServiceimpl.findAll();
		this.req.setAttribute("queryroom",queryroom);
		this.req.setAttribute("querytype",querytype);
		this.req.setAttribute("queryrepairtype",queryrepairtype);
	    this.pageBean =maintainServiceimpl.queryForPage(2, page,queryroom,querytype,queryrepairtype);
	    return SUCCESS;
 }
 @Action(value="modifyMaintainpage",results={@Result(name="success",location="/maintain/updatemaintain.jsp")})   
 public String  modifyMaintainpage(){
	   roomlist=roomServiceimpl.findAll();
	   maintainmanlist=maintainmanServiceimpl.findAll();
	    maintain=maintainServiceimpl.findMaintainID(maintain);
		return SUCCESS; 	
}
	 @Action(value="updateMaintain",results={@Result(name="success",type="redirectAction",location="findAllMaintain.action")})
 public String  updateMaintain(){
		 System.out.println("123");
		 maintainServiceimpl.updateMaintain(maintain);
		return SUCCESS; 	
}
	 @Action(value="deleteMaintain",results={@Result(name="success",type="redirectAction",location="findAllMaintain.action")})
 public String  deleteMaintain(){
		 maintainServiceimpl.deleteMaintain(maintain);
		return SUCCESS; 	
}
	@Override
	public Maintain getModel() {
		if(maintain==null){
			maintain=new Maintain();
		}
		return maintain;
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
	public String getQuerytype() {
		return querytype;
	}
	public void setQuerytype(String querytype) {
		this.querytype = querytype;
	}
	public String getQueryrepairtype() {
		return queryrepairtype;
	}
	public void setQueryrepairtype(String queryrepairtype) {
		this.queryrepairtype = queryrepairtype;
	}
	public List<Room> getRoomlist() {
		return roomlist;
	}
	public void setRoomlist(List<Room> roomlist) {
		this.roomlist = roomlist;
	}
	public List<Maintainman> getMaintainmanlist() {
		return maintainmanlist;
	}
	public void setMaintainmanlist(List<Maintainman> maintainmanlist) {
		this.maintainmanlist = maintainmanlist;
	}

}
