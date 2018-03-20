package com.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.dao.*;
import com.entity.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.OrderService;

@Controller @Scope("prototype")
public class OrderAction extends ActionSupport{
	
	 //Dao层对象
    @Resource OrderDao orderDao;
    @Resource UserDao userDao;
    @Resource BookDao bookDao;
    //entity层对象
    private User user=new User();
    private Book book=new Book();
    private Order order=new Order();
    private ArrayList<Order> orderList=new ArrayList<Order>();
    private ArrayList<Order> myOrderList=new ArrayList<Order>();
    	
    
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = (ArrayList<Order>) orderList;
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
	
	/*添加Order*/
	public String addOrder() throws Exception{
		OrderService os=new OrderService();
		String orderNum=os.getOrderNum();//随机生成订单号
		String  orderDate=os.getOrderDate();//日期从系统获取
		User SQLuser=userDao.getUserByUserId(user.getUserId());//从数据库获取user
		Book SQLbook=bookDao.getBookByBookId(book.getBookId());//从数据库获取book
		order.setOrderNum(orderNum);
		order.setUser(SQLuser);
		order.setBook(SQLbook);
		order.setOrderDate(orderDate);
		//因为是“来一份”，所以置为1
		order.setNumber(1);
		order.setTotalPrice(order.getBook().getBookPrice()*order.getNumber());
		//添加此订单
		order.setLogistics("ready to translate");
		orderDao.addOrder(order);
		ActionContext.getContext().put("orderUser",(User)SQLuser);
		return "successAddOrder";//添加订单后，展示订单详情
	}
	
	/*显示所有Order*/
    public String showOrder() {
        orderList = orderDao.getOrderByUserTele(user.getUserTele());
        ActionContext.getContext().getSession().put("orderList",orderList);
        return "show_view";
    }

    /*显示某一Order的详细信息*/
    public String showDetail(Order order) {
    	System.out.print(order.getOrderId());
    	order = orderDao.getOrderById(order.getOrderId());
        return "detail_view";
    }
    
    /*显示Order的修改项*/
    public String showEdit() throws Exception {
    	order = orderDao.getOrderById(order.getOrderId());
        return "edit_view";
    }

   /* //编辑Order
    public String editOrder() throws Exception {
    	orderDao.updateOrder(order);
        return "edit_message";
    }*/
    
    /*删除Order*/
    public String deleteOrder() throws Exception {
    	orderDao.deleteOrder(order.getOrderId());
    	ArrayList<Order> myOrderList=new ArrayList<Order>();
    	myOrderList = orderDao.getOrderByUserId(user.getUserId());
        ActionContext.getContext().getSession().put("myOrderList",myOrderList);
        return "showOrder";
    }
    
    /*查询Order*/
    public String getAllOrder() throws Exception {
    	orderList = orderDao.getAllOrder();
        return "show_view";
    }
}

/*//接受来自jsp页面有关order的数据
    public void setOrderBook(Book book){
    	order.setBook(book);
    }
    public void setOrderUser(User user){
    	order.setUser(user);
    }
    public void setNumber(int number){
    	order.setNumber(number);
    }
    //接受订单备注信息
    public void setEvaluation(String evaluation){
    	order.setEvaluation(evaluation);
    }*/