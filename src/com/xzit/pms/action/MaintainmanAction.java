package com.xzit.pms.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.Maintainman;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Users;
import com.xzit.pms.service.MaintainmanService;
import com.xzit.pms.service.UsersService;
@SuppressWarnings("serial")
@InterceptorRefs({ @InterceptorRef(value="paramsPrepareParamsStack",params={"modelDriven.refreshModelBeforeResult","true"})}) 
public class MaintainmanAction extends BaseAction implements
		ModelDriven<Maintainman> {
    private Maintainman maintainman=new Maintainman();
    private int page;
    private PageBean pageBean;
    private String queryInfo;
    private String querytype;
    private List<Users> userslist;
    @Resource(name="usersService")
    private UsersService usersServiceimpl;
    @Resource(name="maintainmanService")
    private MaintainmanService maintainmanServiceimpl;
    @Action(value="addMaintainmanPage",results={@Result(name="success",location="/maintainman/addmaintainman.jsp")})
	 public String addMaintainmanPage(){
    	userslist=usersServiceimpl.findAllmaintainman();
	    return SUCCESS;
	 }
   @Action(value="saveMaintainman",results={@Result(name="success",type="redirectAction",location="findAllMaintainman.action")})
  	public String saveMaintainman(){
	   maintainmanServiceimpl.saveMaintainman(maintainman);
  		return SUCCESS;
  	}
  @Action(value="findAllMaintainman",results={@Result(name="success",location="/maintainman/findmaintainman.jsp")})
  public String findAllMaintainman() {
	   if(queryInfo==null){
			queryInfo="";
		}
	   if(querytype==null){
			querytype="";
		}
		if(page==0)
			page=1;
		this.req.setAttribute("queryInfo",queryInfo);
		this.req.setAttribute("querytype",querytype);
	    this.pageBean =maintainmanServiceimpl.queryForPage(5, page,queryInfo,querytype);
	    return SUCCESS;
  }
  @Action(value="modifyMaintainmanpage",results={@Result(name="success",location="/maintainman/updatemaintainman.jsp")})   
  public String  modifyMaintainmanpage(){
	  userslist=usersServiceimpl.findAllmaintainman();
	  maintainman=maintainmanServiceimpl.findMaintainmanID(maintainman);
		return SUCCESS; 	
 }
	 @Action(value="updateMaintainman",results={@Result(name="success",type="redirectAction",location="findAllMaintainman.action")})
  public String  updateMaintainman(){
		 maintainmanServiceimpl.updateMaintainman(maintainman);
		return SUCCESS; 	
 }
	 @Action(value="deleteMaintainman",results={@Result(name="success",type="redirectAction",location="findAllMaintainman.action")})
  public String  deleteMaintainman(){
		 maintainmanServiceimpl.deleteMaintainman(maintainman);
		return SUCCESS; 	
 }
	@Override
	public Maintainman getModel() {
		if(maintainman==null){
			maintainman=new Maintainman();
		}
		return maintainman;
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
	public String getQuerytype() {
		return querytype;
	}
	public void setQuerytype(String querytype) {
		this.querytype = querytype;
	}
	public List<Users> getUserslist() {
		return userslist;
	}
	public void setUserslist(List<Users> userslist) {
		this.userslist = userslist;
	}

}
