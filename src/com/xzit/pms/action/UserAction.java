package com.xzit.pms.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.Users;
import com.xzit.pms.service.UsersService;
@Controller
public class UserAction extends BaseAction implements ModelDriven<Users> {
    private Users users=new Users();
    @Autowired
    private UsersService usersServiceimpl;
	@Action(value="usersLogin",results={@Result(name="success",location="/main.jsp"),
			@Result(name="fail",location="/login.jsp")})
	public String usersLogin(){
		System.out.println(users.getUsername()+"action"+users.getPassword());
		users = usersServiceimpl.usersLogin(users);
		if(users != null){
			session.put("users", users);
			return SUCCESS;
		}
		return "fail";
	}
	@Override
	public Users getModel() {
		return users;
	}
	
}
