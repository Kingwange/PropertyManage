package com.xzit.pms.service;

import java.util.List;

import com.xzit.pms.po.Building;
import com.xzit.pms.po.PageBean;

public interface BuildingService {

	public void saveBuilding(Building building);

	public PageBean queryForPage(int pageSize, int currentPage,String queryInfo);

	public Building findBuildingID(Building building);
	
	public List<Building> findAll();

	public void updateBuilding(Building building);

	public void deleteBuilding(Building building);

	

}
