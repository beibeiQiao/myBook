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
public class UserDao {
	@Resource SessionFactory factory;
	@Resource UserDao userDao;
	
//一、user登录注册
	@SuppressWarnings("unchecked")
	//1.user登录的方法
	public User userLogin(User user){
		Session s=factory.getCurrentSession();
		User SQLuser=userDao.getUserByUserTele(user.getUserTele());
		if(SQLuser!=null){
			return SQLuser;
		}
		return null;
	}
	//2.user注册的方法
	public boolean register(User user){
		Session s=factory.getCurrentSession();
		User SQLuser=userDao.getUserByUserTele(user.getUserTele());
		if(SQLuser==null){//不存在此用户，注册成功
			s.save(user);
			return true;
		}
		return false;//如果已经存在此用户，注册失败！
	}
//一、user登录注册

//二、user的增删改查
	//3.添加user信息
	public void addUser(User user){
		Session s=factory.getCurrentSession();
		s.save(user);
	}
    //4.删除user信息
	public void deleteUser(Integer userTele){
		Session s=factory.getCurrentSession();
		Object user=s.load(User.class, userTele);
		s.delete(user);
	}
    //5.更新user信息
    public void updateUser(User user){
    	Session s=factory.getCurrentSession();
    	s.update(user);
    }
    //6.查询所有user信息
	public ArrayList<User> getAllUser(){
    	Session s=factory.getCurrentSession();
    	String hql="From User";
    	Query q=s.createQuery(hql);
    	@SuppressWarnings("unchecked")
		ArrayList<User> userList=(ArrayList<User>)q.list();
    	return userList;
    }
//二、user的增删改查
	
//三、条件查询
	//7.根据用户id获取user信息
	public User getUserByUserId(Integer userId){
		Session s=factory.getCurrentSession();
		User user=(User)s.get(User.class, userId);
		return user;
	}
    //8.根据用户账号userTele获取对象
    @SuppressWarnings("unchecked")
	public User getUserByUserTele(String userTele){
    	Session s=factory.getCurrentSession();
    	ArrayList<User> userList=null;
    	String hql="From User user ";
    	if(!userTele.equals("")){
    		hql=hql+"where user.userTele='"+userTele+"'";
			Query q=s.createQuery(hql);
			userList=(ArrayList<User>) q.list();
    	}
    	return userList.get(0);
    }
    //9.根据用户名userName获取对象
    @SuppressWarnings("unchecked")
	public ArrayList<User> getUserByUserName(String userName){
    	Session s=factory.getCurrentSession();
    	ArrayList<User> userList=null;
    	String hql="From User user ";
    	if(!userName.equals("")){
    		hql=hql+"where user.userName like'%"+userName+"%'";
			Query q=s.createQuery(hql);
			userList=(ArrayList<User>)q.list();
    	}
    	return userList;
    }
//三、条件查询    
	@SuppressWarnings("unchecked")
	//10.根据用户性别筛选
	public ArrayList<User> getUserByUserSex(String userSex) {
		Session s=factory.getCurrentSession();
    	ArrayList<User> userList=null;
    	String hql="From User user where user.userSex='"+userSex+"'";
    	userList=(ArrayList<User>) s.createQuery(hql).list();
		return userList;
	}
}