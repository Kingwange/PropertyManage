package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.ResidentDAO;
import com.xzit.pms.po.Complaint;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Resident;
import com.xzit.pms.po.Room;
import com.xzit.pms.service.ResidentService;
@Service("residentService")
public class ResidentServiceimpl implements ResidentService {
	@Resource(name = "residentDAO")
	private ResidentDAO residentDAO;
	@Override
	public void saveResident(Resident resident) {
		residentDAO.save(resident);
    }

	@Override
	public PageBean queryForPage(int pageSize, int currentPage,
			String queryInfo, String queryroom) {
		if(queryroom==""){
			queryroom=" like '%%' ";
		}else{
			queryroom=" = "+queryroom;
		}
		String hql = "select count(*) from Resident where rsname like '%" +queryInfo+"%'  and rid "+queryroom+"  order by rsid asc";
		int count = residentDAO.getCount(hql); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Resident where rsname like '%" +queryInfo+"%'  and rid "+queryroom+"  order by rsid asc";
		List<Resident> list = residentDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
	public Resident findResidentID(Resident resident) {
		return residentDAO.findById(resident.getRsid());
	}

	@Override
	public void updateResident(Resident resident) {
		residentDAO.attachDirty(resident);

	}

	@Override
	public void deleteResident(Resident resident) {
		residentDAO.delete(resident);

	}

	@Override
	public Resident findResidentID(Room room) {
		
		return residentDAO.findRoomID(room.getRid());
	}

	

}
