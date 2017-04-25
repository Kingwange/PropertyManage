package com.xzit.pms.action;

import java.util.List;
import javax.annotation.Resource; 
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.Hire;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Room;
import com.xzit.pms.service.HireService;
import com.xzit.pms.service.RoomService;
@SuppressWarnings("serial")
@InterceptorRefs({ @InterceptorRef(value="paramsPrepareParamsStack",params={"modelDriven.refreshModelBeforeResult","true"})}) 
public class HireAction extends BaseAction implements ModelDriven<Hire> {
    private Hire hire=new Hire();
    private int page;
    private PageBean pageBean;
    private String queryInfo;
    private String queryroom;
    private List<Room> roomlist;
    @Resource(name="hireService")
    private HireService hireServiceimpl;
    @Resource(name ="roomService")
	private RoomService roomServiceimpl;
    @Action(value="addHirePage",results={@Result(name="success",location="/hire/addhire.jsp")})
	 public String addHirePage(){
   	 roomlist=roomServiceimpl.findAll();
	    return SUCCESS;
	 }
  @Action(value="saveHire",results={@Result(name="success",type="redirectAction",location="findAllHire.action")})
 	public String saveHire(){
	  System.out.println("666");
	  hireServiceimpl.saveHire(hire);
	  return SUCCESS;
 	}
 @Action(value="findAllHire",results={@Result(name="success",location="/hire/findhire.jsp")})
 public String findAllHire() {
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
	    this.pageBean =hireServiceimpl.queryForPage(2, page,queryInfo,queryroom);
	    return SUCCESS;
	}

	@Action(value = "modifyHirepage", results = { @Result(name = "success", location = "/hire/updatehire.jsp") })
	public String modifyHirepage() {
		roomlist = roomServiceimpl.findAll();
		hire = hireServiceimpl.findChargeID(hire);
		return SUCCESS;
	}

	@Action(value = "updateHire", results = { @Result(name = "success", type = "redirectAction", location = "findAllHire.action") })
	public String updateHire() {
		hireServiceimpl.updateHire(hire);
		return SUCCESS;
	}

	@Action(value = "deleteHire", results = { @Result(name = "success", type = "redirectAction", location = "findAllHire.action") })
	public String deleteHire() {
		hireServiceimpl.deleteHire(hire);
		return SUCCESS;
	}
	@Override
	public Hire getModel() {
		if(hire == null){
			hire = new Hire();
	 
	       }
		return hire;
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
