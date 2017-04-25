package com.xzit.pms.service;
import java.util.List;

import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Users;

public interface UsersService {
	
	public Users usersLogin(Users users);

	public void saveUsers(Users users);

	public PageBean queryForPage(int i, int page, String queryInfo,String queryname);

	public Users findUsersID(Users users);

	public void updateUsers(Users users);

	public void deleteUsers(Users users);

	public List<Users> finAll();
	
}
