package com.xzit.pms.service;

import com.xzit.pms.po.Hire;
import com.xzit.pms.po.PageBean;

public interface HireService {

	public void saveHire(Hire hire);

	public PageBean queryForPage(int pageSize, int currentPage, String queryInfo,
			String queryroom);

	public Hire findChargeID(Hire hire);

	public void updateHire(Hire hire);

	public void deleteHire(Hire hire);

}
