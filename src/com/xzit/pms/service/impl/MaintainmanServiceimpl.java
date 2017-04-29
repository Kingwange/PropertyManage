package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.xzit.pms.dao.MaintainmanDAO;
import com.xzit.pms.po.Maintainman;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.service.MaintainmanService;
@Service("maintainmanService")
public class MaintainmanServiceimpl implements MaintainmanService {
	@Resource(name = "maintainmanDAO")
    private MaintainmanDAO maintainmanDAO;
	@Override
	public void saveMaintainman(Maintainman maintainman) {
		maintainmanDAO.save(maintainman);
		
	}

	@Override
	public PageBean queryForPage(int pageSize, int currentPage,
			String queryInfo, String querytype) {
		String hql = "select count(*) from Maintainman where name like '%" +queryInfo+"%' and repairtype like '%" +querytype+"%' order by mmid asc";
		int count = maintainmanDAO.getCount(hql); // 总记录数
		System.out.println(count);
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Maintainman where name like '%" +queryInfo+"%' and repairtype like '%" +querytype+"%' order by mmid asc";
		List<Maintainman> list = maintainmanDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
	public Maintainman findMaintainmanID(Maintainman maintainman) {
		
		return maintainmanDAO.findById(maintainman.getMmid());
	}

	@Override
	public void updateMaintainman(Maintainman maintainman) {
		maintainmanDAO.attachDirty(maintainman);
	}

	@Override
	public void deleteMaintainman(Maintainman maintainman) {
		maintainmanDAO.delete(maintainman);
		
	}

	@Override
	public List<Maintainman> findAll() {
		// TODO Auto-generated method stub
		return maintainmanDAO.findAll();
	}
	

}
