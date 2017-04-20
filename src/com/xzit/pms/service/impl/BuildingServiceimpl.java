package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.BuildingDAO;
import com.xzit.pms.po.Building;
import com.xzit.pms.po.Ower;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.service.BuildingService;
@Service("buildingService")
public class BuildingServiceimpl implements BuildingService {
	@Resource(name = "buildingDAO")
    private BuildingDAO buildingDAO;
	@Override
	public void saveBuilding(Building building) {
		buildingDAO.save(building);

	}

	@Override
	public PageBean queryForPage(int pageSize, int currentPage, String queryInfo) {
		String hql = "select count(*) from Building where state like '%" +queryInfo+"%' order by bid asc";
		int count = buildingDAO.getCount(hql); // 总记录数
		System.out.println(count);
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Building where state like  '%" +queryInfo+"%' order by bid";
		List<Building> list = buildingDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
	public Building findBuildingID(Building building) {
		
		return buildingDAO.findById(building.getBid());
	}

	@Override
	public void updateBuilding(Building building) {
		buildingDAO.attachDirty(building);
		
	}

	@Override
	public void deleteBuilding(Building building) {
		buildingDAO.delete(building);
		
	}

	@Override
	public List<Building> findAll() {
		// TODO Auto-generated method stub
		return buildingDAO.findAll();
	}

}
