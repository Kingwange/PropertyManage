package com.xzit.pms.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.Charge;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Room;
import com.xzit.pms.service.ChargeService;
import com.xzit.pms.service.RoomService;
@SuppressWarnings("serial")
@InterceptorRefs({ @InterceptorRef(value="paramsPrepareParamsStack",params={"modelDriven.refreshModelBeforeResult","true"})}) 
public class ChargeAction extends BaseAction implements ModelDriven<Charge> {
    private Charge charge=new Charge();
    private int page;
    private PageBean pageBean;
    private String queryInfo;
    private String queryroom;
    private List<Room> roomlist;
    @Resource(name="chargeService")
    private ChargeService chargeServiceimpl;
    @Resource(name ="roomService")
	private RoomService roomServiceimpl;
    @Action(value="addChargePage",results={@Result(name="success",location="/charge/addcharge.jsp")})
	 public String addChargePage(){
   	roomlist=roomServiceimpl.findAll();
	    return SUCCESS;
	 }
  @Action(value="saveCharge",results={@Result(name="success",type="redirectAction",location="findAllCharge.action")})
 	public String saveCharge(){
	  chargeServiceimpl.saveCharge(charge);
 		return SUCCESS;
 	}
 @Action(value="findAllCharge",results={@Result(name="success",location="/charge/findcharge.jsp")})
 public String findAllCharge() {
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
	    this.pageBean =chargeServiceimpl.queryForPage(2, page,queryInfo,queryroom);
	    return SUCCESS;
	}

	@Action(value = "modifyChargepage", results = { @Result(name = "success", location = "/charge/updatecharge.jsp") })
	public String modifyChargepage() {
		roomlist = roomServiceimpl.findAll();
		charge = chargeServiceimpl.findChargeID(charge);
		return SUCCESS;
	}

	@Action(value = "updateCharge", results = { @Result(name = "success", type = "redirectAction", location = "findAllCharge.action") })
	public String updateCharge() {
		chargeServiceimpl.updateCharge(charge);
		return SUCCESS;
	}

	@Action(value = "deleteCharge", results = { @Result(name = "success", type = "redirectAction", location = "findAllCharge.action") })
	public String deleteCharge() {
		chargeServiceimpl.deleteCharge(charge);
		return SUCCESS;
	}
	@Override
	public Charge getModel() {
		if(charge == null){
			charge = new Charge();
	 
	       }
		return charge;
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
