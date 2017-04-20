package com.xzit.pms.action;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.Building;
import com.xzit.pms.po.Cleanmanage;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.service.CleanmanageService;
import com.xzit.pms.service.SecurityService;

@SuppressWarnings("serial")
@InterceptorRefs({ @InterceptorRef(value = "paramsPrepareParamsStack", params = {"modelDriven.refreshModelBeforeResult", "true" }) })
public class CleanmanageAction extends BaseAction implements ModelDriven<Cleanmanage> {
	private Cleanmanage cleanmanage = new Cleanmanage();
	private int page;
	private PageBean pageBean;
	private String queryInfo;
	@Resource(name ="cleanmanageService")
	private CleanmanageService cleanmanageServiceimpl;

	@Action(value ="addCleanmanagePage", results = { @Result(name = "success", location = "/cleanmanage/addcleanmanage.jsp") })
	public String addCleanmanagePage() {
		return SUCCESS;
	}

	@Action(value = "saveCleanmanage", results = { @Result(name = "success", type = "redirectAction", location = "findAllCleanmanage.action") })
	public String saveCleanmanage() {
		cleanmanageServiceimpl.saveCleanmanage(cleanmanage);
		return SUCCESS;
	}

	@Action(value = "findAllCleanmanage", results = { @Result(name = "success", location = "/cleanmanage/findcleanmanage.jsp") })
	public String findAllCleanmanage() {
		System.out.println(queryInfo);
		if (queryInfo == null) {
			queryInfo = "";
		}
		if (page == 0)
			page = 1;
		this.req.setAttribute("queryInfo", queryInfo);
		this.pageBean = cleanmanageServiceimpl.queryForPage(2, page, queryInfo);
		return SUCCESS;
	}

	@Action(value = "modifyCleanmanagepage", results = { @Result(name = "success", location = "/cleanmanage/updatecleanmanage.jsp") })
	public String modifyCleanmanagepage() {
		cleanmanage = cleanmanageServiceimpl.findCleanmanageID(cleanmanage);
		return SUCCESS;
	}

	@Action(value = "updateCleanmanage", results = { @Result(name = "success", type = "redirectAction", location = "findAllCleanmanage.action") })
	public String updateCleanmanage() {
		cleanmanageServiceimpl.updateCleanmanage(cleanmanage);
		return SUCCESS;
	}

	@Action(value = "deleteCleanmanage", results = { @Result(name = "success", type = "redirectAction", location = "findAllCleanmanage.action") })
	public String deleteCleanmanage() {
		cleanmanageServiceimpl.deleteCleanmanage(cleanmanage);
		return SUCCESS;
	}

	@Override
	public Cleanmanage getModel() {
		if(cleanmanage == null){
			cleanmanage = new Cleanmanage();
	 
	       }
		return cleanmanage;
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
