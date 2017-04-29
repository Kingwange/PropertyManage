package com.xzit.pms.service;

import java.util.List;

import com.xzit.pms.po.Maintainman;
import com.xzit.pms.po.PageBean;

public interface MaintainmanService {

	public void saveMaintainman(Maintainman maintainman);

	public PageBean queryForPage(int pageSize, int currentPage, String queryInfo,
			String querytype);

	public Maintainman findMaintainmanID(Maintainman maintainman);

	public void updateMaintainman(Maintainman maintainman);

	public void deleteMaintainman(Maintainman maintainman);

	public List<Maintainman> findAll();

}
