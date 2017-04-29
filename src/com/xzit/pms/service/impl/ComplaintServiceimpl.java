package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.ChargeDAO;
import com.xzit.pms.dao.ComplaintDAO;
import com.xzit.pms.po.Charge;
import com.xzit.pms.po.Complaint;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.service.ComplaintService;
@Service("complaintService")
public class ComplaintServiceimpl implements ComplaintService {
	@Resource(name = "complaintDAO")
	private ComplaintDAO complaintDAO;
	@Override
	public void saveComplaint(Complaint complaint) {
		complaintDAO.save(complaint);

	}

	@Override
	public PageBean queryForPage(int pageSize, int currentPage, String queryInfo,String querystate) {
		String hql = "select count(*) from Complaint where rsid like '%" +queryInfo+"%'  and state like '%" +querystate+"%'  order by cpid asc";
		int count = complaintDAO.getCount(hql); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Complaint where rsid like '%" +queryInfo+"%'  and state like '%" +querystate+"%'  order by cpid asc";
		List<Complaint> list = complaintDAO.queryForPage(hql1, offset, length); // 该分页的记录
		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(count);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}

	@Override
	public Complaint findComplaintID(Complaint complaint) {
		
		return complaintDAO.findById(complaint.getCpid());
	}

	@Override
	public void updateComplaint(Complaint complaint) {
		complaintDAO.attachDirty(complaint);
	}

	@Override
	public void deleteComplaint(Complaint complaint) {
		complaintDAO.delete(complaint);

	}

	@Override
	public PageBean queryMyPage(int pageSize, int currentPage, int rsid) {
		String hql = "select count(*) from Complaint where rsid =" +rsid+ " order by cpid asc";
		int count = complaintDAO.getCount(hql); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Complaint where rsid =" +rsid+ "  order by cpid asc";
		List<Complaint> list = complaintDAO.queryForPage(hql1, offset, length); // 该分页的记录
		// 把分页信息保存到Bean中
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(count);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}

}
