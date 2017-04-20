package com.xzit.pms.action;
import javax.annotation.Resource;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Security;
import com.xzit.pms.service.SecurityService;
@SuppressWarnings("serial")
@InterceptorRefs({ @InterceptorRef(value="paramsPrepareParamsStack",params={"modelDriven.refreshModelBeforeResult","true"})})
public class SecurityAction extends BaseAction implements ModelDriven<Security> {
    private Security security=new Security();
    private int page;
    private PageBean pageBean;
    private String queryInfo;
    private String querytype;
    @Resource(name="securityService")
    private SecurityService securityServiceimpl;
    @Action(value="addSecurityPage",results={@Result(name="success",location="/security/addsecurity.jsp")})
	 public String addSecurityPage(){
	    return SUCCESS;
	 }
   @Action(value="saveSecurity",results={@Result(name="success",type="redirectAction",location="findAllSecurity.action")})
  	public String saveSecurity(){
	   securityServiceimpl.saveSecurity(security);
  		return SUCCESS;
  	}
  @Action(value="findAllSecurity",results={@Result(name="success",location="/security/findsecurity.jsp")})
  public String findAllSecurity() {
	   System.out.println(queryInfo);
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
	    this.pageBean =securityServiceimpl.queryForPage(2, page,queryInfo,querytype);
	    return SUCCESS;
  }
  @Action(value="modifySecuritypage",results={@Result(name="success",location="/security/updatesecurity.jsp")})   
  public String  modifySecuritypage(){
	  security=securityServiceimpl.findSecurityID(security);
		return SUCCESS; 	
 }
	 @Action(value="updateSecurity",results={@Result(name="success",type="redirectAction",location="findAllSecurity.action")})
  public String  updateSecurity(){
		 securityServiceimpl.updateSecurity(security);
		return SUCCESS; 	
 }
	 @Action(value="deleteSecurity",results={@Result(name="success",type="redirectAction",location="findAllSecurity.action")})
  public String  deleteSecurity(){
		 securityServiceimpl.deleteSecurity(security);
		return SUCCESS; 	
 }
	@Override
	public Security getModel() {
		if(security == null){
			security = new Security();
	 
	       }
		return security;
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

}
