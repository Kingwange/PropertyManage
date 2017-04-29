package com.xzit.pms.service;

import com.xzit.pms.po.Complaint;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Resident;
import com.xzit.pms.po.Room;

public interface ResidentService {

	public void saveResident(Resident resident);

	public PageBean queryForPage(int pageSize, int currentPage, String queryInfo,
			String queryroom);

	public Resident findResidentID(Resident resident);

	public void updateResident(Resident resident);

	public void deleteResident(Resident resident);

	public Resident findResidentID(Room room);


}
