package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.MaintainDAO;
import com.xzit.pms.po.Maintain;
import com.xzit.pms.po.Maintainman;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Users;
import com.xzit.pms.service.MaintainService;
@Service("maintainService")
public class MaintainServiceimpl implements MaintainService {
	@Resource(name = "maintainDAO")
    private MaintainDAO maintainDAO;
	@Override
	public void saveMaintain(Maintain maintain) {
		maintainDAO.save(maintain);

	}

	@Override
	public PageBean queryForPage(int pageSize, int currentPage,
			String queryroom, String querytype, String queryrepairtype) {
		if(queryroom==""){
			queryroom=" like '%%' ";
		}else{
			queryroom=" = "+queryroom;
		}
		if(queryrepairtype==""){
			queryrepairtype=" like '%%' ";
		}else{
			queryrepairtype=" = "+queryrepairtype;
		}
		String hql = "select count(*) from Maintain where rid " +queryroom+" and type like '%" +querytype+"%' and mmid " +queryrepairtype+" order by mid asc";
		int count = maintainDAO.getCount(hql); // 总记录数
		System.out.println(count);
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Maintain where rid " +queryroom+" and type like '%" +querytype+"%' and mmid " +queryrepairtype+" order by mid asc";
		List<Maintain> list = maintainDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
	public Maintain findMaintainID(Maintain maintain) {
		return maintainDAO.findById(maintain.getMid());
	}

	@Override
	public void updateMaintain(Maintain maintain) {
		maintainDAO.attachDirty(maintain);
	}

	@Override
	public void deleteMaintain(Maintain maintain) {
		maintainDAO.delete(maintain);
	}

	@Override
	public PageBean queryOwnMatainInfo(int pageSize, int currentPage,
			Users maintainmanUsers) {
		int id=maintainmanUsers.getId();
		String hql = "select count(*) from Maintain where maintainman.mmid = (select mmid from Maintainman where users.id = "+id+" ) order by mid asc";
		int count = maintainDAO.getCount(hql); // 总记录数
		System.out.println(count);
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Maintain where maintainman.mmid = (select mmid from Maintainman where users.id = "+id+" ) order by mid asc";
		List<Maintain> list = maintainDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
