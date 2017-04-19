package com.xzit.pms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.pms.dao.UsersDAO;
import com.xzit.pms.po.Users;
import com.xzit.pms.service.UsersService;
@Service("usersService")
public class UsersServiceimpl implements UsersService {
	@Resource(name = "usersDao")
	private UsersDAO usersDao;
	@Override
	public Users usersLogin(Users users) {
	 return usersDao.usersLogin(users);
	}

}
