package com.xzit.pms.service;

import java.util.List;

import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Security;

public interface SecurityService {

	public void saveSecurity(Security security);

	public PageBean queryForPage(int pageSize, int currentPage,String queryInfo,String querytype);

	public Security findSecurityID(Security security);

	public void updateSecurity(Security security);

	public void deleteSecurity(Security security);

	public List<Security> findAll();

	public List<Security> findAllequipment();

}
