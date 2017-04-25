package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.ChargeDAO;
import com.xzit.pms.dao.EquipmentDAO;
import com.xzit.pms.po.Charge;
import com.xzit.pms.po.Equipment;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.service.EquipmentService;
@Service("equipmentService")
public class EquipmentServiceimpl implements EquipmentService {
	@Resource(name = "equipmentDAO")
	private EquipmentDAO equipmentDAO;
	@Override
	public void saveEquipment(Equipment equipment) {
		equipmentDAO.save(equipment);
	}

	@Override
	public PageBean queryForPage(int pageSize, int currentPage,
			String queryInfo, String queryman) {
		String hql = "select count(*) from Equipment where ename like '%" +queryInfo+"%'  and sid like '%"+queryman+"%'  order by eid asc";
		int count = equipmentDAO.getCount(hql); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Equipment where ename like '%" +queryInfo+"%'  and sid like '%"+queryman+"%'  order by eid asc";
		List<Equipment> list = equipmentDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
	public Equipment findEquipmentID(Equipment equipment) {
		// TODO Auto-generated method stub
		return equipmentDAO.findById(equipment.getEid());
	}

	@Override
	public void updateEquipment(Equipment equipment) {
		equipmentDAO.attachDirty(equipment);

	}

	@Override
	public void deleteEquipment(Equipment equipment) {
		equipmentDAO.delete(equipment);

	}

}
