package com.xzit.pms.action;
import javax.annotation.Resource;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.Ower;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.service.OwerService;
@SuppressWarnings("serial")
@Controller
@InterceptorRefs({ @InterceptorRef(value="paramsPrepareParamsStack",params={"modelDriven.refreshModelBeforeResult","true"})}) 
public class OwerAction extends BaseAction implements ModelDriven<Ower> {
    private Ower ower=new Ower();
    private int page=1;
    private PageBean pageBean;
    private String queryInfo;
    @Resource(name="owerService")
    private OwerService owerServiceimpl;
    @Action(value="addowerPage",results={@Result(name="success",location="/ower/addower.jsp")})
	 public String addowerPage(){
	    return SUCCESS;
	 }
    @Action(value="saveOwer",results={@Result(name="success",type="redirectAction",location="findAllOwer.action")})
	public String saveower(){
    	owerServiceimpl.saveOwer(ower);
		return SUCCESS;
	}
@Action(value="findAllOwer",results={@Result(name="success",location="/ower/findower.jsp")})
public String findAllOwer() {
	if(queryInfo==null){
		queryInfo="";
	}
	if(page==0)
		page=1;
	this.req.setAttribute("queryInfo", queryInfo);;
    this.pageBean = owerServiceimpl.queryForPage(2, page,queryInfo);
    return SUCCESS;
}
	 @Action(value="modifyOwerpage",results={@Result(name="success",location="/ower/updateower.jsp")})   
     public String  modifyOwerpage(){
		 ower=owerServiceimpl.findOwerID(ower);
		return SUCCESS; 	
    }
	 @Action(value="updateOwer",results={@Result(name="success",type="redirectAction",location="findAllOwer.action")})
     public String  updateOwer(){
		owerServiceimpl.updateOwer(ower);
		return SUCCESS; 	
    }
	 @Action(value="deleteOwer",results={@Result(name="success",type="redirectAction",location="findAllOwer.action")})
     public String  deleteOwer(){
		owerServiceimpl.deleteOwer(ower);
		return SUCCESS; 	
    }
	 
	@Override
	public Ower getModel() {
		  if(ower == null){
			  ower = new Ower();
	 
	       }
		return ower;
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
