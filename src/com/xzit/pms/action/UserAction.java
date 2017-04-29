package com.xzit.pms.action;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ModelDriven;
import com.xzit.pms.po.PageBean;
import com.xzit.pms.po.Resident;
import com.xzit.pms.po.Room;
import com.xzit.pms.po.Users;
import com.xzit.pms.service.ResidentService;
import com.xzit.pms.service.RoomService;
import com.xzit.pms.service.UsersService;
@SuppressWarnings("serial")
@InterceptorRefs({ @InterceptorRef(value="paramsPrepareParamsStack",params={"modelDriven.refreshModelBeforeResult","true"})}) 
public class UserAction extends BaseAction implements ModelDriven<Users> {
    private Users users=new Users();
    private Room room=new Room();
    private Resident resident=new Resident();
    private int page;
    private PageBean pageBean;
    private String queryInfo;
    private String queryname;
    @Resource(name="roomService")
    private RoomService roomServiceimpl;
    @Resource(name="residentService")
    private ResidentService residentServiceimpl;
    @Resource(name="usersService")
    private UsersService usersServiceimpl;
	@Action(value="usersLogin",results={@Result(name="success",location="/main.jsp"),
			@Result(name="fail",location="/index.jsp")})
	public String usersLogin(){
		users = usersServiceimpl.usersLogin(users);
		if(users!= null){
			 session.put("users", users);
				if(("A").equals(users.getAuthority())||("C").equals(users.getAuthority())){
					return SUCCESS;}
			else {
				room=roomServiceimpl.findUserID(users);
				resident=residentServiceimpl.findResidentID(room);
				session.put("resident", resident);
					return "fail";
			}
		}
		return "fail";
	}
	@Action(value="logout",results={@Result(name="success",location="/index.jsp")})
	 public String logout(){
		session.remove("users");
	    return SUCCESS;
	 }
	
	@Action(value="skipaboutPage",results={@Result(name="success",location="/users/about.jsp")})
	 public String skipaboutPage(){
	    return SUCCESS;
	 }
	@Action(value="addusersPage",results={@Result(name="success",location="/users/adduser.jsp")})
	 public String addusersPage(){
	    return SUCCESS;
	 }
   @Action(value="saveUsers",results={@Result(name="success",type="redirectAction",location="findAllUsers.action")})
  	public String saveUsers(){
	   usersServiceimpl.saveUsers(users);
  		return SUCCESS;
  	}
  @Action(value="findAllUsers",results={@Result(name="success",location="/users/findusers.jsp")})
  public String findAllUsers() {
	   if(queryInfo==null){
			queryInfo="";
		}
	   if(queryname==null)
		   queryname="";
		if(page==0)
			page=1;
		this.req.setAttribute("queryInfo",queryInfo);
		this.req.setAttribute("queryname",queryname);
	    this.pageBean =usersServiceimpl.queryForPage(2, page,queryInfo,queryname);
	    return SUCCESS;
  }
  @Action(value="modifyUserspage",results={@Result(name="success",location="/users/updateusers.jsp")})   
  public String  modifyUserspage(){
	  users=usersServiceimpl.findUsersID(users);
		return SUCCESS; 	
 }
	 @Action(value="updateUsers",results={@Result(name="success",type="redirectAction",location="findAllUsers.action")})
  public String  updateUsers(){
		 usersServiceimpl.updateUsers(users);
		return SUCCESS; 	
 }
	 @Action(value="deleteUsers",results={@Result(name="success",type="redirectAction",location="findAllUsers.action")})
  public String  deleteUsers(){
		 usersServiceimpl.deleteUsers(users);
		return SUCCESS; 	
 }
	@Override
	public Users getModel() {
		if(users == null){
			users = new Users();
	 
	       }
		return users;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public String getQueryInfo() {
		return queryInfo;
	}
	public void setQueryInfo(String queryInfo) {
		this.queryInfo = queryInfo;
	}


	public String getQueryname() {
		return queryname;
	}


	public void setQueryname(String queryname) {
		this.queryname = queryname;
	}
	
}
