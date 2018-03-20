package com.dao;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.*;


@Service @Transactional
public class OrderDao {
	@Resource SessionFactory factory;
	
	@Resource UserDao userDao;
	
	 /*添加Order信息*/
    public void addOrder(Order userOrder)throws Exception{
    	Session s=factory.getCurrentSession();
    	s.save(userOrder);
    }
    
    /*删除Order信息*/
    public void deleteOrder(Integer orderId){
    	Session s=factory.getCurrentSession();
    	Object order=s.load(Order.class, orderId);
    	s.delete(order);
    }
    
   /* //更新Order信息
    public void updateOrder(Order order){
    	Session s=factory.getCurrentSession();
    	s.update(order);
    }*/
    
    /*查询所有Order信息*/
    @SuppressWarnings("unchecked")
	public ArrayList<Order> getAllOrder(){
    	Session s=factory.getCurrentSession();
    	String hql="From Order";
    	Query q=s.createQuery(hql);
    	ArrayList<Order> orderList=(ArrayList<Order>)q.list();
    	return orderList;
    }
    /*根据主键获取Order*/
    public Order getOrderById(Integer orderId){
    	Session s=factory.getCurrentSession();
    	Order order=(Order)s.get(Order.class, orderId);
    	return order;
    }
    
	/*根据用户名称查询订单*/
    @SuppressWarnings("unchecked")
	public ArrayList<Order> getOrderByUserTele(String userTele){
    	Session s= factory.getCurrentSession();
    	User user=userDao.getUserByUserTele(userTele);
    	String hql="From Order order where 1=1";
    	//根据用户的姓名查询他所有的订单
    	if(user!=null){
    		hql=hql+" and order.user.userTele='"+userTele+"'";
    	}
    	Query q=s.createQuery(hql);
    	ArrayList<Order> orderList=(ArrayList<Order>)q.list();
    	return orderList;
    }
    
	/*根据书籍名称查询订单*/
	@SuppressWarnings("unchecked")
	public ArrayList<Order> getOrderByBookName(String bookName){
		Session s = factory.getCurrentSession();
		String hql="from Order order where 1=1";
		if( bookName!=null) 
    		hql = hql + " and order.book.bookName like '%" + bookName + "%'";
    	Query q = s.createQuery(hql);
    	ArrayList<Order> orderList =(ArrayList<Order>)q.list();
    	return  orderList;
	}

	@SuppressWarnings("unchecked")
	public ArrayList<Order> getOrderByUserName(String keywords) {
		Session s = factory.getCurrentSession();
		String hql="from Order order where order.user.userName like'%"+keywords+"%'";
		Query q = s.createQuery(hql);
		ArrayList<Order> orderList =(ArrayList<Order>)q.list();
		return orderList;
	}
	//根据用户id查询订单
	@SuppressWarnings("unchecked")
	public ArrayList<Order> getOrderByUserId(Integer userId) {
		Session s = factory.getCurrentSession();
		String hql="From Order order where order.user.userId='"+userId+"'";
		Query q=s.createQuery(hql);
		ArrayList<Order> myOrderList=(ArrayList<Order>)q.list();
		return myOrderList;
	}
}
