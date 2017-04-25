package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.HireDAO;
import com.xzit.pms.po.Charge;
import com.xzit.pms.po.Hire;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.service.HireService;
@Service("hireService")
public class HireServiceimpl implements HireService {
	@Resource(name = "hireDAO")
	private HireDAO hireDAO;
	@Override
	public void saveHire(Hire hire) {
		hireDAO.save(hire);

	}

	@Override
	public PageBean queryForPage(int pageSize, int currentPage, String queryInfo,
			String queryroom) {
		String hql = "select count(*) from Hire where hname like '%" +queryInfo+"%'  and rid like '%"+queryroom+"%'  order by hid asc";
		int count = hireDAO.getCount(hql); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Hire where hname like '%" +queryInfo+"%'  and rid like '%"+queryroom+"%'  order by hid asc";
		List<Hire> list = hireDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
	public Hire findChargeID(Hire hire) {
		// TODO Auto-generated method stub
		return hireDAO.findById(hire.getHid());
	}

	@Override
	public void updateHire(Hire hire) {
		hireDAO.attachDirty(hire);
	}

	@Override
	public void deleteHire(Hire hire) {
		hireDAO.delete(hire);

	}

}
