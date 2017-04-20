package com.xzit.pms.service;

import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Room;

public interface RoomService {

	public void saveRoom(Room room);

	public PageBean queryForPage(int pageSize, int currentPage, String queryroom, String querybuild,
			String queryower);

	public Room findRoomID(Room room);

	public void updateRoom(Room room);

	public void deleteRoom(Room room);

	

}
