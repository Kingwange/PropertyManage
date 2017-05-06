package com.xzit.pms.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.management.loading.PrivateClassLoader;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.UsersDAO;
import com.xzit.pms.po.Building;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Users;
import com.xzit.pms.service.UsersService;
@Service("usersService")
public class UsersServiceimpl implements UsersService {
	@Resource(name = "usersDAO")
	private UsersDAO usersDAO;
	@Override
	public Users usersLogin(Users users) {
	 return usersDAO.usersLogin(users);
	}
	@Override
	public void saveUsers(Users users) {
		usersDAO.save(users);
		
	}
	@Override
	public PageBean queryForPage(int pageSize, int currentPage,String queryInfo,String queryname) {
		String hql = "select count(*) from Users where authority like '%" +queryInfo+"%' and username like '" +queryname+"%' order by id asc";
		int count = usersDAO.getCount(hql); // 总记录数
		int totalPage = PageBean.countTotalPage(pageSize, count); // 总页数
		int offset = PageBean.countOffset(pageSize, currentPage); // 当前页开始记录
		int length = pageSize; // 每页记录数
		currentPage = PageBean.countCurrentPage(currentPage);
		String hql1="from Users where authority like  '%" +queryInfo+"%' and username like '" +queryname+"%' order by id";
		List<Users> list = usersDAO.queryForPage(hql1, offset, length); // 该分页的记录
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
	public Users findUsersID(Users users) {
		return usersDAO.findById(users.getId());
	}
	@Override
	public void updateUsers(Users users) {
		usersDAO.attachDirty(users);
		
	}
	@Override
	public void deleteUsers(Users users) {
		usersDAO.delete(users);
		
	}
	@Override
	public List<Users> findAllmaintainman() {
		// TODO Auto-generated method stub
		return usersDAO.findAllmaintainman();
	}
	@Override
	public List<Users> findAllroom() {
		// TODO Auto-generated method stub
		return usersDAO.findAllroom();
	}
	@Override
	public List<Users> findAllsecurity() {
		// TODO Auto-generated method stub
		return usersDAO.findAllmaintainman();
	}
	@Override
	public List<Users> findAll() {
		// TODO Auto-generated method stub
		return usersDAO.findAll();
	}
	@Override
	public Users findUsersName(Users users) {
		
		return usersDAO.findcheckName(users.getUsername());
	}
	@Override
	public int findUsersPassword(Users users) {
		// TODO Auto-generated method stub
		return usersDAO.findcheckPassword(users.getId(),users.getPassword());
	}
}
