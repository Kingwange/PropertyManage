package com.xzit.pms.service;

import com.xzit.pms.po.Cleanmanage;
import com.xzit.pms.po.PageBean;

public interface CleanmanageService {
    public void saveCleanmanage(Cleanmanage cleanmanage);

    public PageBean queryForPage(int pageSize, int currentPage,String queryInfo);

    public Cleanmanage findCleanmanageID(Cleanmanage cleanmanage);

    public void updateCleanmanage(Cleanmanage cleanmanage);
    
    public void deleteCleanmanage(Cleanmanage cleanmanage);

}
