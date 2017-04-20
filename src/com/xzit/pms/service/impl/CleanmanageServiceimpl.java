package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.CleanmanageDAO;
import com.xzit.pms.po.Building;
import com.xzit.pms.po.Cleanmanage;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.service.CleanmanageService;
@Service("cleanmanageService")
public class CleanmanageServiceimpl implements CleanmanageService {
	@Resource(name = "cleanmanageDAO")
	private CleanmanageDAO cleanmanageDAO; 
	@Override
	public void saveCleanmanage(Cleanmanage cleanmanage) {
		cleanmanageDAO.save(cleanmanage);

	}

	@Override
	public PageBean queryForPage(int pageSize, int currentPage,String queryInfo) {
		String hql = "select count(*) from Cleanmanage where cmname like '%" +queryInfo+"%'  order by cmid asc";
		int count = cleanmanageDAO.getCount(hql); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Cleanmanage where cmname like '%" +queryInfo+"%'  order by cmid asc";
		List<Cleanmanage> list = cleanmanageDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
	public Cleanmanage findCleanmanageID(Cleanmanage cleanmanage) {
		
		return cleanmanageDAO.findById(cleanmanage.getCmid());
	}

	@Override
	public void updateCleanmanage(Cleanmanage cleanmanage) {
		cleanmanageDAO.attachDirty(cleanmanage);

	}

	@Override
	public void deleteCleanmanage(Cleanmanage cleanmanage) {
		cleanmanageDAO.delete(cleanmanage);

	}

}
