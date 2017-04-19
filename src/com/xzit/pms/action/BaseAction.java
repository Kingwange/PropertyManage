package com.xzit.pms.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements ServletRequestAware,
		ServletResponseAware,SessionAware {
	// 0定义字段
	public HttpServletRequest req;
	public HttpServletResponse resp;
	public Map session;

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		//
		this.resp = arg0;

	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		this.req = arg0;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		this.session = arg0;
	}

}
