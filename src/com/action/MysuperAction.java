package com.action;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.dao.MysuperDao;
import com.entity.Mysuper;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller @Scope("prototype")
@SuppressWarnings("serial")
public class MysuperAction extends ActionSupport{
	@Resource MysuperDao superDao;
	private Mysuper mysuper;
	//获取所有超级管理员的方法
	public String getAllSuper(){
		ArrayList<Mysuper> superList=superDao.getAllSuper();
		ActionContext.getContext().put("superList", superList);
		ActionContext.getContext().put("superNumber", superList.size());
		return "manage_super";
	}
}
