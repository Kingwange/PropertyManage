package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.ChargeDAO;
import com.xzit.pms.po.Charge;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Resident;
import com.xzit.pms.service.ChargeService;
@Service("chargeService")
public class ChargeServiceimpl implements ChargeService {
	@Resource(name = "chargeDAO")
	private ChargeDAO chargeDAO;
	@Override
	public void saveCharge(Charge charge) {
		chargeDAO.save(charge);
	}

	@Override
	public PageBean queryForPage(int pageSize, int currentPage,
			String queryInfo, String queryroom) {
		if(queryroom==""){
			queryroom=" like '%%' ";
		}else{
			queryroom=" = "+queryroom;
		}
		String hql = "select count(*) from Charge where chargestate like '%" +queryInfo+"%'  and rid "+queryroom+"  order by cid asc";
		int count = chargeDAO.getCount(hql); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Charge where chargestate like '%" +queryInfo+"%'  and rid "+queryroom+"  order by cid asc";
		List<Charge> list = chargeDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
	public Charge findChargeID(Charge charge) {
		return chargeDAO.findById(charge.getCid());
	}

	@Override
	public void updateCharge(Charge charge) {
		chargeDAO.attachDirty(charge);

	}

	@Override
	public void deleteCharge(Charge charge) {
        chargeDAO.delete(charge);
	}

	@Override
	public int checkchargetype(Charge charge) {
		// TODO Auto-generated method stub
		return chargeDAO.checkchargetype(charge.getRoom().getRid(),charge.getCname());
	}

}
