package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.CleanmanageDAO;
import com.xzit.pms.dao.RoomDAO;
import com.xzit.pms.po.Cleanmanage;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Room;
import com.xzit.pms.service.RoomService;
@Service("roomService")
public class RoomServiceimpl implements RoomService {
	@Resource(name = "roomDAO")
	private RoomDAO roomDAO;
	@Override
	public void saveRoom(Room room) {
		roomDAO.save(room);
	}

	@Override
	public PageBean queryForPage(int pageSize, int currentPage,
			String queryroom, String querybuild, String queryower) {
		String hql = "select count(*) from Room where rname like '%" +queryroom+"%' and bid like '%"+querybuild+"%' and oid like '%"+queryower+"%'  order by rid asc";
		int count = roomDAO.getCount(hql); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Room where rname like '" +queryroom+"%' and bid like '%"+querybuild+"%' and oid like '%"+queryower+"%'  order by rid asc";
		List<Room> list = roomDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
	public Room findRoomID(Room room) {
		// TODO Auto-generated method stub
		return roomDAO.findById(room.getRid());
	}

	@Override
	public void updateRoom(Room room) {
		roomDAO.attachDirty(room);

	}

	@Override
	public void deleteRoom(Room room) {
		roomDAO.delete(room);

	}

	@Override
	public List<Room> findAll() {
		// TODO Auto-generated method stub
		return roomDAO.findAll();
	}

}
