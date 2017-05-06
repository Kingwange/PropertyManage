package com.xzit.pms.action;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.Complaint;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Resident;
import com.xzit.pms.service.ComplaintService;
import com.xzit.pms.service.ResidentService;
@SuppressWarnings("serial")
@InterceptorRefs({ @InterceptorRef(value="paramsPrepareParamsStack",params={"modelDriven.refreshModelBeforeResult","true"})}) 
public class ComplaintAction extends BaseAction implements ModelDriven<Complaint> {
    private Complaint complaint=new Complaint();
    private int page;
    private PageBean pageBean;
    private String queryInfo;
    private String querystate;
    Date date=new Date(); 
	@Resource(name="residentService")
    private ResidentService residentServiceimpl;
    @Resource(name="complaintService")
    private ComplaintService complaintServiceimpl;
    @Action(value="skipcontactPage",results={@Result(name="success",location="/complaint/contact.jsp")})
	 public String skipcontactPage(){
	    return SUCCESS;
	 }
    @Action(value="saveComplaint",results={@Result(name="success",location="/index.jsp")})
	public String saveComplaint(){
    	complaint.setSubmissiontime(date);
    	complaint.setResident((Resident)session.get("resident"));
    	complaint.setState("N");
    	complaintServiceimpl.saveComplaint(complaint);
		return SUCCESS;
	}
@Action(value="findAllComplaint",results={@Result(name="success",location="/complaint/findcomplaint.jsp")})
public String findAllComplaint() {
	if(queryInfo==null){
		queryInfo="";
	}
	if(querystate==null){
		querystate="";
	}
	if(page==0)
		page=1;
	this.req.setAttribute("queryInfo", queryInfo);
	this.req.setAttribute("querystate", querystate);
    this.pageBean = complaintServiceimpl.queryForPage(5, page,queryInfo,querystate);
    return SUCCESS;
}  
   @Action(value="findMycomplaint",results={@Result(name="success",location="/complaint/findMycomplaint.jsp")})   
    public String  findMycomplaint(){
	   if(page==0)
			page=1;
	   Resident res=(Resident)session.get("resident");
	   this.pageBean = complaintServiceimpl.queryMyPage(3, page,res.getRsid());
	   return SUCCESS; 	
    }

	 @Action(value="modifyComplaintpage",results={@Result(name="success",location="/complaint/updatecomplaint.jsp")})   
     public String  modifyComplaintpage(){
		complaint=complaintServiceimpl.findComplaintID(complaint);
		return SUCCESS; 	
    }
	 @Action(value="updateComplaint",results={@Result(name="success",type="redirectAction",location="findAllComplaint.action")})
     public String  updateComplaint(){
		 complaintServiceimpl.updateComplaint(complaint);
		return SUCCESS; 	
    }
	 @Action(value="deleteComplaint",results={@Result(name="success",type="redirectAction",location="findAllComplaint.action")})
     public String  deleteComplaint(){
		 complaintServiceimpl.deleteComplaint(complaint);
		return SUCCESS; 	
    }
	@Override
	public Complaint getModel() {
		if(complaint == null){
			complaint = new Complaint();
	  }
		return complaint;
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
	public String getQuerystate() {
		return querystate;
	}
	public void setQuerystate(String querystate) {
		this.querystate = querystate;
	}

}
