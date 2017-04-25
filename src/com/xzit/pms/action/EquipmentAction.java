package com.xzit.pms.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.Equipment;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Security;
import com.xzit.pms.service.EquipmentService;
import com.xzit.pms.service.SecurityService;
@SuppressWarnings("serial")
@InterceptorRefs({ @InterceptorRef(value="paramsPrepareParamsStack",params={"modelDriven.refreshModelBeforeResult","true"})}) 
public class EquipmentAction extends BaseAction implements ModelDriven<Equipment> {
    private Equipment equipment=new Equipment();
    private int page;
    private PageBean pageBean;
    private String queryInfo;
    private String queryman;
    List<Security> securitylist;
    @Resource(name="equipmentService")
    private EquipmentService equipmentServiceimpl;
    @Resource(name="securityService")
    private SecurityService securityServiceimpl; 
    @Action(value="addEquipmentPage",results={@Result(name="success",location="/equipment/addequipment.jsp")})
	 public String addEquipmentPage(){
    	securitylist=securityServiceimpl.findAll();
	    return SUCCESS;
	 }
   @Action(value="saveEquipment",results={@Result(name="success",type="redirectAction",location="findAllEquipment.action")})
  	public String saveEquipment(){
	   equipmentServiceimpl.saveEquipment(equipment);
  		return SUCCESS;
  	}
  @Action(value="findAllEquipment",results={@Result(name="success",location="/equipment/findequipment.jsp")})
  public String findAllEquipment() {
	   if(queryInfo==null){
			queryInfo="";
		}
	   if(queryman==null){
		   queryman="";
	   }if(page==0)
		   page=1;
	   securitylist=securityServiceimpl.findAll();
		this.req.setAttribute("queryInfo",queryInfo);
		this.req.setAttribute("queryman",queryman);
	    this.pageBean =equipmentServiceimpl.queryForPage(2, page,queryInfo,queryman);
	    return SUCCESS;
  }
  @Action(value="modifyEquipmentpage",results={@Result(name="success",location="/equipment/updateequipment.jsp")})   
  public String  modifyEquipmentpage(){
	  securitylist=securityServiceimpl.findAll();
	  equipment=equipmentServiceimpl.findEquipmentID(equipment);
		return SUCCESS; 	
 }
	 @Action(value="updateEquipment",results={@Result(name="success",type="redirectAction",location="findAllEquipment.action")})
  public String  updateEquipment(){
		 equipmentServiceimpl.updateEquipment(equipment);
		return SUCCESS; 	
 }
	 @Action(value="deleteEquipment",results={@Result(name="success",type="redirectAction",location="findAllEquipment.action")})
  public String  deleteEquipment(){
		 equipmentServiceimpl.deleteEquipment(equipment);
		return SUCCESS; 	
 }
	@Override
	public Equipment getModel() {
		if(equipment == null){
			equipment = new Equipment();
	 
	       }
		return equipment;
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
	public String getQueryman() {
		return queryman;
	}
	public void setQueryman(String queryman) {
		this.queryman = queryman;
	}
	public List<Security> getSecuritylist() {
		return securitylist;
	}
	public void setSecuritylist(List<Security> securitylist) {
		this.securitylist = securitylist;
	}

}
