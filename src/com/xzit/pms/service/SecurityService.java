package com.xzit.pms.service;

import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Security;

public interface SecurityService {

	public void saveSecurity(Security security);

	public PageBean queryForPage(int pageSize, int currentPage,String queryInfo,String querytype);

	public Security findSecurityID(Security security);

	public void updateSecurity(Security security);

	public void deleteSecurity(Security security);

}
