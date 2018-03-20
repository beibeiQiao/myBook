package com.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.dao.*;
import com.entity.Type;

/**
 * 书籍类型
 * @author xiaotang
 *
 */
@Controller 
@Scope("prototype")
public class TypeAction {
	@Resource Type type;
	
	@Resource TypeDao typeDao;
	
	public int getTypeId() {
		return type.getTypeId();
	}
	public void setTypeName(String typeName){
		type.setTypeName(typeName);
	}
	public String getTypeName() {
		return type.getTypeName();
	}
}
