package com.service;

import java.util.ArrayList;

import com.entity.Order;

public class AdminService {
	//1.根据条件查询book
	public int getBookInfo(String keywords){
		int result=1;
		if(keywords.contains("名著")){result=1; return result;}
		if(keywords.contains("小说")){result=2; return result;}
		if(keywords.contains("杂志")){result=3; return result;}
		if(keywords.contains("工具类")){result=4; return result;}
		if(keywords.contains("编程")){result=5; return result;}
		return 0;
	}
	//2.根据条件查询user
	@SuppressWarnings("static-access")
	public String getUserInfo(String keywords) {
		String result=null;
		if(keywords.equals("男")){
			return "男";
		}else if(keywords.equals("女")){
			return "女";
		}else{
			EncodeToUTF_8 encode=new EncodeToUTF_8();
			result=encode.getUTF8StringFromGBKString(keywords);
			return result;
		}
	}
	//3.合并相同信息的订单
	public void merge(ArrayList<Order> orderList1,ArrayList<Order> orderList2) {
		// TODO Auto-generated method stub
		
	}
	
}
