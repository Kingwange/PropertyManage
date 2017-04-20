package com.xzit.pms.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.Building;
import com.xzit.pms.po.Ower;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.service.BuildingService;

@SuppressWarnings("serial")
@Controller
@InterceptorRefs({ @InterceptorRef(value="paramsPrepareParamsStack",params={"modelDriven.refreshModelBeforeResult","true"})}) 
public class BuildingAction extends BaseAction implements ModelDriven<Building> {
    private Building building=new Building();
    private int page;
    private PageBean pageBean;
    private String queryInfo;
    @Resource(name="buildingService")
    private BuildingService buildingServiceimpl;
    @Action(value="addbuildingPage",results={@Result(name="success",location="/building/addbuilding.jsp")})
	 public String addbuildingPage(){
	    return SUCCESS;
	 }
    @Action(value="saveBuilding",results={@Result(name="success",type="redirectAction",location="findAllBuilding.action")})
   	public String saveBuilding(){
    	buildingServiceimpl.saveBuilding(building);
   		return SUCCESS;
   	}
   @Action(value="findAllBuilding",results={@Result(name="success",location="/building/findbuilding.jsp")})
   public String findAllBuilding() {
	   System.out.println(queryInfo);
	   if(queryInfo==null){
			queryInfo="";
		}
		if(page==0)
			page=1;
		this.req.setAttribute("queryInfo",queryInfo);;
	    this.pageBean =buildingServiceimpl.queryForPage(2, page,queryInfo);
	    return SUCCESS;
   }
   @Action(value="modifyBuildingpage",results={@Result(name="success",location="/building/updatebuilding.jsp")})   
   public String  modifyBuildingpage(){
		building=buildingServiceimpl.findBuildingID(building);
		return SUCCESS; 	
  }
	 @Action(value="updateBuilding",results={@Result(name="success",type="redirectAction",location="findAllBuilding.action")})
   public String  updateBuilding(){
		 buildingServiceimpl.updateBuilding(building);
		return SUCCESS; 	
  }
	 @Action(value="deleteBuilding",results={@Result(name="success",type="redirectAction",location="findAllBuilding.action")})
   public String  deleteBuilding(){
		 buildingServiceimpl.deleteBuilding(building);
		return SUCCESS; 	
  }
	@Override
	public Building getModel() {
		if(building == null){
			building = new Building();
	 
	       }
		return building;
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

}
