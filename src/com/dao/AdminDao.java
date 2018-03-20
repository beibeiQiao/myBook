package com.dao;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Admin;

@Service@Transactional
public class AdminDao {
	@Resource SessionFactory factory;
	@Resource AdminDao adminDao;
	
//一、admin登录注册	
	//1.admin用户登录
	public Admin adminLogin(Admin admin){
		Session s=factory.getCurrentSession();
		Admin SQLadmin=adminDao.getAdminByAdminNum(admin.getAdminNum());
		if(SQLadmin!=null){
			return SQLadmin;
		}
		return null;
	}
	//2.admin注册
	public boolean adminRegister(Admin admin){
		Session s=factory.getCurrentSession();
		Admin SQLadmin=adminDao.getAdminByAdminNum(admin.getAdminNum());
		if(SQLadmin==null){
			s.save(admin);
			return true;
		}
		return false;
	}
//一、admin登录注册	
	
//二、admin增删改查
	//3.添加Admin信息(本次项目不需要添加管理员)
	public void addAdmin(Admin admin){
		Session s=factory.getCurrentSession();
		s.save(admin);
	}
	//4.删除Admin信息(本次项目不需要删除管理员)
	public void deleteAdmin(String adminNum){
		Session s=factory.getCurrentSession();
		Object admin=s.load(Admin.class, adminNum);
		s.delete(admin);
	}
	//5.更新Admin信息(本次项目不需要更新管理员信息)
	public void updateAdmin(Admin admin){
		Session s=factory.getCurrentSession();
		s.update(admin);
	}
	//6.查询所有Admin信息
	public ArrayList<Admin> getAllAdmin(){
	   	Session s=factory.getCurrentSession();
	   	String hql="From Admin";
	   	Query q=s.createQuery(hql);
	   	@SuppressWarnings("unchecked")
		ArrayList<Admin> adminList=(ArrayList<Admin>)q.list();
	   	return adminList;
	}
//二、admin增删改查

//三、admin条件查询
	//7.根据adminId查询admin对象
	public Admin getAdminByAdminId(Integer adminId){
		Session s=factory.getCurrentSession();
		Admin admin=(Admin) s.get(Admin.class, adminId);
		return admin;
	}
	//8.根据用户账号adminNum获取对象
	public Admin getAdminByAdminNum(String adminNum){
	   	Session s=factory.getCurrentSession();
	   	String hql="From Admin admin where admin.adminNum='"+adminNum+"'";
	   	Query q=s.createQuery(hql);
	   	if(q.list().size()==0){
	   		return null;
	   	}
	   	Admin admin=(Admin) q.list().get(0);
	   	return admin;
	}
//三、admin条件查询
	
}

/*根据查询条件查询
   @SuppressWarnings("unchecked")
	public ArrayList<Admin> getAdminByName(String adminName){
   	Session s=factory.getCurrentSession();
   	ArrayList<Admin> adminList=null;
   	String hql="From Admin admin ";
   	
   	if(!adminName.equals("")){
   		hql=hql+"where Admin.AdminName='"+adminName+"'";
			Query q=s.createQuery(hql);
			adminList=(ArrayList<Admin>)q.list();
   	}
   	return adminList;
   }*/