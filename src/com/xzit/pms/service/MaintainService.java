package com.xzit.pms.service;

import com.xzit.pms.po.Maintain;
import com.xzit.pms.po.Maintainman;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Users;

public interface MaintainService {

	public void saveMaintain(Maintain maintain);

	public PageBean queryForPage(int pageSize, int currentPage,String queryroom,
			String querytype,String queryrepairtype);

	public Maintain findMaintainID(Maintain maintain);

	public void updateMaintain(Maintain maintain);

	public void deleteMaintain(Maintain maintain);

	public PageBean queryOwnMatainInfo(int pageSize, int currentPage, Users maintainmanUsers);


}
