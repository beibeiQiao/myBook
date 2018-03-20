package com.action;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.dao.BookDao;
import com.dao.OrderDao;
import com.dao.UserDao;
import com.entity.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller @Scope("prototype")
public class UserAction extends ActionSupport{
	
	/*业务层对象*/
    @Resource UserDao userDao;
    @Resource BookDao bookDao;
    @Resource OrderDao orderDao;
    //Customer实体类对象
    private User user=new User();
    
    private Map<String,Object> session;
    private String prePage;
    
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
//一、user登录注册
	//1.user登录的方法
	public String userLogin() throws Exception{
		User SQLuser=userDao.getUserByUserTele(user.getUserTele());
		if(SQLuser==null) return "userLogin";
		if(SQLuser.getUserPwd().equals(user.getUserPwd())){
			ActionContext.getContext().getSession().put("currUser",(User)SQLuser);
			ArrayList<Order> myOrderList=orderDao.getOrderByUserId(user.getUserId());
			ActionContext.getContext().getSession().put("myOrderList", myOrderList);
			return "index";//登陆成功进入首页
		}else{
			this.addActionError("用户名或者密码错误！");
			return "userLogin";//
		}
	}
	//2.user注册的方法
	public String register() throws Exception{
		
		userDao.addUser(user);
		//显示所有书籍信息
		ArrayList<Book> bookList=new ArrayList<Book>();
		bookList=bookDao.getAllBook();
		ActionContext.getContext().put("bookList",bookList);
		return "index";
	}
//一、user登录注册
//二、user增删改查
	//3.增加user的方法
	public String addUser(User user){
		userDao.addUser(user);
		getAllUser();
		return "index";
	}
	//4.删除user的方法
	public String deleteUser(Integer userId){
		userDao.deleteUser(userId);
		getAllUser();
		return "index";
	}
	//5.修改user的方法
	public String updateUser(User user){
		userDao.updateUser(user);
		getAllUser();
		return "index";
	}
	//6.查看user的方法（所有user）
	public String getAllUser(){
		ArrayList<User> bookList=userDao.getAllUser();
		ActionContext.getContext().put("userList",bookList);
		return "index";
	}
//二、user增删改查
//三、根据条件查询user
	
//三、根据条件查询user	
	//7.查询订单
	public String getMyOrder(){
		ArrayList<Order> myOrderList=orderDao.getOrderByUserId(user.getUserId());
		ActionContext.getContext().getSession().put("myOrderList", myOrderList);
		return "showOrder";
	}
}

/*//通过jsp页面传入的设置对象属性
	public void setUserTele(String userTele){
		user.setUserTele(userTele);
	}
	public void setUserName(String userName){
		user.setUserName(userName);
	}
	public void setUserPwd(String userPwd){
		user.setUserPwd(userPwd);
	}*/