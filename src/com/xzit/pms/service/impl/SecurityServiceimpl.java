package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.SecurityDAO;
import com.xzit.pms.po.Building;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Security;
import com.xzit.pms.service.SecurityService;
@Service("securityService")
public class SecurityServiceimpl implements SecurityService {
	@Resource(name = "securityDAO")
	private SecurityDAO securityDAO; 
	@Override
	public void saveSecurity(Security security) {
		securityDAO.save(security);

	}

	@Override
	public PageBean queryForPage(int pageSize, int currentPage, String queryInfo,String querytype) {
		String hql = "select count(*) from Security where sname like '%" +queryInfo+"%' and worktype like '%"+querytype+"%'  order by sid asc";
		int count = securityDAO.getCount(hql); // 总记录数
		System.out.println(count);
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Security where sname like '%" +queryInfo+"%' and worktype like '%"+querytype+"%'  order by sid asc";
		List<Building> list = securityDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
	public Security findSecurityID(Security security) {
		return securityDAO.findById(security.getSid());
	}

	@Override
	public void updateSecurity(Security security) {
		securityDAO.attachDirty(security);

	}

	@Override
	public void deleteSecurity(Security security) {
		securityDAO.delete(security);

	}

	@Override
	public List<Security> findAll() {
		// TODO Auto-generated method stub
		return securityDAO.findAll();
	}

}
