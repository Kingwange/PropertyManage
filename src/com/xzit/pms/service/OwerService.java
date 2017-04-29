package com.xzit.pms.service;

import java.util.List;

import com.xzit.pms.po.Ower;
import com.xzit.pms.po.PageBean;
public interface OwerService {
	public void saveOwer(Ower ower);

	public Ower findOwerID(Ower ower);
	
	public List<Ower> findAll();

	public void updateOwer(Ower ower);

	public void deleteOwer(Ower ower);

	public PageBean queryForPage(int pageSize, int currentPage,String queryInfo);



}
