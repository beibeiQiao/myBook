package com.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.dao.*;
import com.entity.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.AdminService;

@Controller @Scope("prototype")
@SuppressWarnings("serial")
public class AdminAction extends ActionSupport{
	
	@Resource AdminDao adminDao;
	@Resource BookDao bookDao;
	@Resource UserDao userDao;
	@Resource TypeDao typeDao;
	@Resource OrderDao orderDao;
	@Resource MysuperDao superDao;
	
	private Admin admin=new Admin();
	private Book book=new Book();
	private User user=new User();
	private Order order=new Order();
	/*@Resource Admin admin;*/
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}


	private String keywords;
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	//1.管理员登录的方法
	public String adminLogin(){
		if (admin.getAdminNum().equals("")||admin.getAdminPwd().equals("")) {
			// 第一个参数表示表单中的textfield的name,第二参数是提示信息
			this.addActionError("账号或密码为空！");
			return "adminLogin";
		}
		Admin SQLadmin=adminDao.getAdminByAdminNum(admin.getAdminNum());
		if(SQLadmin==null){
			this.addActionError("账号不存在！");
			return "adminLogin";
		}
		if(SQLadmin.getAdminPwd().equals(admin.getAdminPwd())){
			//(Admin)SQLadmin:SQLadmin必须进行类型声明，否则jsp页面无法识别数据
			ActionContext.getContext().getSession().put("currAdmin",(Admin)SQLadmin);
			//将所有user数据传递到前端页面
			ArrayList<User> userList=(ArrayList<User>)userDao.getAllUser();
			ActionContext.getContext().put("userList",userList);
			ActionContext.getContext().put("userNumber",userList.size());
			return "manage_user";
		}else{
			this.addActionError("密码错误！");
			return "adminLogin";
		}
	}
	//2.管理员注册的方法(后期使用的方法)
	public String adminRegister(){
		boolean result=adminDao.adminRegister(admin);
		if(result) return "adminIndex";
		else return "adminRegister";
	}
	
	//3.查看所有管理员
	public String getAllAdmin(){
		ArrayList<Admin> adminList=adminDao.getAllAdmin();
		ActionContext.getContext().put("adminList", adminList);
		ActionContext.getContext().put("adminNumber", adminList.size());
		return "manage_admin";
	}
	//4.查看所有用户user
	public String getAllUser(){
		ArrayList<User> userList=userDao.getAllUser();
		ActionContext.getContext().put("userList", userList);
		ActionContext.getContext().put("userNumber", userList.size());
		return "manage_user";
	}
	//5.查看所有book 
	public String getAllBook(){
		ArrayList<Book> bookList=bookDao.getAllBook();
		ActionContext.getContext().put("bookList", bookList);
		ActionContext.getContext().put("bookNumber", bookList.size());
		return "manage_book";
	}
	//6.查看所有type
	public String getAllType(){
		ArrayList<Type> typeList=typeDao.getAllType();
		ActionContext.getContext().put("typeList", typeList);
		ActionContext.getContext().put("typeNumber", typeList.size());
		return "manage_type";
	}
	//7.查看所有order
	public String getAllOrder(){
		ArrayList<Order> orderList=orderDao.getAllOrder();
		ActionContext.getContext().put("orderList", orderList);
		ActionContext.getContext().put("orderNumber", orderList.size());
		return "manage_order";
	}
	//8.添加用户user
	public String addUser(){
		userDao.addUser(user);
		ArrayList<User> userList=(ArrayList<User>)userDao.getAllUser();
		ActionContext.getContext().getSession().put("userList",userList);
		ActionContext.getContext().getSession().put("userNumber",userList.size());
		return "manage_user";
	}
	//9.跳转到更新user信息
	//userId
	public String skipUpdateUser(){
		User user1=userDao.getUserByUserId(user.getUserId());
		ActionContext.getContext().getSession().put("user2",(User)user1);//类型声明
		return "updateUser";
	} 
	//10.更新user信息
	public String updateUser(){
		userDao.updateUser(user);
		ArrayList<User> userList=(ArrayList<User>)userDao.getAllUser();
		ActionContext.getContext().getSession().put("userList",userList);
		ActionContext.getContext().getSession().put("userNumber",userList.size());
		return "manage_user";
	} 
	//18.根据条件查询user
	public String getUserInfo(){
		AdminService as=new AdminService();
		String result=as.getUserInfo(keywords);
		ArrayList<User> userList=null;
		if(keywords.equals("")){
			userList=userDao.getAllUser();
		}else{
			if(result.equals("男")||result.equals("女")){
				userList=userDao.getUserByUserSex(result);
			}else{
				userList=userDao.getUserByUserName(result);
			}
			if(userList.size()==0){
				userList=userDao.getAllUser();
			}
		}
		ActionContext.getContext().getSession().put("userList",userList);
		ActionContext.getContext().getSession().put("userNumber",userList.size());
		return "manage_user";
	}
	//12.删除用户user
	public String deleteUser(){
		userDao.deleteUser(user.getUserId());
		ArrayList<User> userList=(ArrayList<User>)userDao.getAllUser();
		ActionContext.getContext().getSession().put("userList",userList);
		ActionContext.getContext().getSession().put("userNumber",userList.size());
		return "manage_user";
	}
	
	//13.添加书籍book
	public String addBook() throws Exception{
		bookDao.addBook(book);
		ArrayList<Book> bookList=(ArrayList<Book>)bookDao.getAllBook();
		ActionContext.getContext().getSession().put("bookList",bookList);
		ActionContext.getContext().getSession().put("bookNumber",bookList.size());
		return "manage_book";
	}
	//14.删除书籍book
	public String deleteBook() throws Exception{
		bookDao.deleteBook(book.getBookId());
		ArrayList<Book> bookList=(ArrayList<Book>)bookDao.getAllBook();
		ActionContext.getContext().getSession().put("bookList",bookList);
		ActionContext.getContext().getSession().put("bookNumber",bookList.size());
		return "manage_book";
	}
	//15.跳转到修改书籍book信息的页面
	public String skipUpdateBook() throws Exception{
		Book updateBook=bookDao.getBookByBookId(book.getBookId());
		ActionContext.getContext().getSession().put("updateBook",(Book)updateBook);//类型声明
		return "updateBook";
	}
	//16.修改书籍信息并返回原页面
	public String updateBook() throws Exception{
		bookDao.updateBook(book);
		ArrayList<Book> bookList=(ArrayList<Book>)bookDao.getAllBook();
		ActionContext.getContext().getSession().put("bookList",bookList);
		ActionContext.getContext().getSession().put("bookNumber",bookList.size());
		return "manage_book";
	}
	//17.根据条件查询书籍
	public String getBookInfo() throws UnsupportedEncodingException{
		AdminService as=new AdminService();
		ArrayList<Book> bookList=null;
		if(keywords.equals("")){
			bookList=bookDao.getAllBook();
		}else{
			int result=as.getBookInfo(keywords);
			if(result==0){
				bookList=bookDao.getBookByBookNameVaguely(keywords);
			}else{
				bookList=bookDao.getBookByBookType(result);
			}
		}
		if(bookList.size()==0){
			bookList=bookDao.getAllBook();
		}
		ActionContext.getContext().getSession().put("bookList",bookList);
		ActionContext.getContext().getSession().put("bookNumber",bookList.size());
		return "manage_book";
	}
	//20.删除订单order
	public String deleteOrder(){
		orderDao.deleteOrder(order.getOrderId());
		ArrayList<Order> orderList=(ArrayList<Order>)orderDao.getAllOrder();
		ActionContext.getContext().getSession().put("orderList",orderList);
		ActionContext.getContext().getSession().put("orderNumber",orderList.size());
		return "manage_order";
	}
	//21.根据条件查询book
	public String getOrderInfo(){
		ArrayList<Order> orderList1=orderDao.getOrderByUserName(keywords);
		ArrayList<Order> orderList2=orderDao.getOrderByBookName(keywords);
		AdminService as=new AdminService();
		//as.merge();
		orderList1.addAll(orderList2);
		if(orderList1.size()==0){
			orderList1=orderDao.getAllOrder();
		}
		ActionContext.getContext().getSession().put("orderList",orderList1);
		ActionContext.getContext().getSession().put("orderNumber",orderList1.size());
		return "manage_order";
	}
	//22.获取所有的超级管理员
	public String getAllSuper(){
		ArrayList<Mysuper> superList=superDao.getAllSuper();
		ActionContext.getContext().put("superList", superList);
		ActionContext.getContext().put("superNumber", superList.size());
		return "manage_super";
	}
}
