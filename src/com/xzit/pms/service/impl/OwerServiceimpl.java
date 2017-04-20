package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.OwerDAO;
import com.xzit.pms.po.Ower;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.service.OwerService;

@Service("owerService")
public class OwerServiceimpl implements OwerService {
	@Resource(name = "owerDAO")
	private OwerDAO owerDAO;

	@Override
	public void saveOwer(Ower ower) {
		owerDAO.save(ower);
	}

	@SuppressWarnings("unchecked")
	

	@Override
	public Ower findOwerID(Ower ower) {
		return owerDAO.findById(ower.getOid());
	}

	@Override
	public void updateOwer(Ower ower) {
		// TODO Auto-generated method stub
		owerDAO.attachDirty(ower);
	}

	@Override
	public void deleteOwer(Ower ower) {
		owerDAO.delete(ower);
	}

	@Override
	public PageBean queryForPage(int pageSize, int currentPage,String queryInfo) {
		String hql = "select count(*) from Ower where oname like '%" +queryInfo+"%' order by oid asc";
		int count = owerDAO.getCount(hql); // 总记录数
		System.out.println(count);
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Ower where oname like  '%" +queryInfo+"%' order by oid";
		List<Ower> list = owerDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
	public List<Ower> findAll() {
		return owerDAO.findAll();
	}

}
