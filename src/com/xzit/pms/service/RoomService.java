package com.xzit.pms.service;

import java.util.List;

import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Room;
import com.xzit.pms.po.Users;

public interface RoomService {

	public void saveRoom(Room room);

	public PageBean queryForPage(int pageSize, int currentPage, String queryroom, String querybuild,
			String queryower);

	public Room findRoomID(Room room);

	public void updateRoom(Room room);

	public void deleteRoom(Room room);

	public List<Room> findAllcharge();

	public List<Room> findAll();

	public List<Room> findAllhire();

	public List<Room> findAllresident();

	public Room findUserID(Users users);

	

}
