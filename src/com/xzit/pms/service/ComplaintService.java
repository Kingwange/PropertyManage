package com.xzit.pms.service;

import com.xzit.pms.po.Complaint;
import com.xzit.pms.po.PageBean;

public interface ComplaintService {

	public void saveComplaint(Complaint complaint);

	public PageBean queryForPage(int pageSize, int currentPage, String queryInfo,String querystate);

	public Complaint findComplaintID(Complaint complaint);

	public void updateComplaint(Complaint complaint);

	public void deleteComplaint(Complaint complaint);

	public PageBean queryMyPage(int pageSize, int currentPage,int rsid);

}
