package com.xzit.pms.service;

import com.xzit.pms.po.Charge;
import com.xzit.pms.po.PageBean;

public interface ChargeService {

	public void saveCharge(Charge charge);

	public PageBean queryForPage(int pageSize, int currentPage, String queryInfo,
			String queryroom);

	public Charge findChargeID(Charge charge);

	public void updateCharge(Charge charge);

	public void deleteCharge(Charge charge);

	public int checkchargetype(Charge charge);

}
