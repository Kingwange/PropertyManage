package com.xzit.pms.service;

import com.xzit.pms.po.Equipment;
import com.xzit.pms.po.PageBean;

public interface EquipmentService {

	public void saveEquipment(Equipment equipment);

	public PageBean queryForPage(int pageSize, int currentPage,String queryInfo,
			String queryman);

	public Equipment findEquipmentID(Equipment equipment);

	public void updateEquipment(Equipment equipment);

	public void deleteEquipment(Equipment equipment);

}
