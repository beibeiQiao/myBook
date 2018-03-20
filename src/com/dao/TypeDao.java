package com.dao;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.*;
@Service@Transactional
public class TypeDao {
	@Resource SessionFactory factory;
	
	//查询所有书籍类型
	@SuppressWarnings("unchecked")
	public ArrayList<Type> getAllType(){
		Session s=factory.getCurrentSession();
		/*
		 * hibernate查询语言HQL
		 * 是一种select from的结构，from后边跟的是实体类名，不是表名
		 * 
		 */
		String hql="From Type";
		Query q=s.createQuery(hql);
		ArrayList<Type> typeList=(ArrayList<Type>) q.list();
		return typeList;
	}
	//根据bookId查询书籍类型
	public Type getTypeByBookId(Integer bookId){
		Session s=factory.getCurrentSession();
		Book book=(Book)s.get(Book.class,bookId);
		int typeId=book.getType().getTypeId();
		String hql="From Type type where id='"+typeId+"'";
		Type type=(Type)s.createQuery(hql);
		return type;
	}
	public Type getTypeByTypeName(String typeName){
		Session s=factory.getCurrentSession();
		String hql="From Type type and type.typeName='"+typeName+"'";
		Type type=(Type)s.createQuery(hql);
		return type;
	}
	//根据bookCode查询书籍类型
	public Type getTypeByBookCode(String bookCode){
		Session s=factory.getCurrentSession();
		Book book=(Book)s.get(Book.class,bookCode);
		int typeId=book.getType().getTypeId();
		String hql="select type from Type where id='"+typeId+"'";
		Type type=(Type)s.createQuery(hql);
		return type;
	}
	
}
