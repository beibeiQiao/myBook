package com.dao;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Mysuper;

@Service@Transactional
public class MysuperDao{
	@Resource SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	public ArrayList<Mysuper> getAllSuper(){
		Session s=factory.getCurrentSession();
		String hql="From Mysuper mysuper";
		Query q=s.createQuery(hql);
		ArrayList<Mysuper> superList=(ArrayList<Mysuper>)q.list();
		return superList;
	}
}
