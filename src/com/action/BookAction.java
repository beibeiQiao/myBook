package com.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.dao.BookDao;
import com.dao.TypeDao;
import com.entity.*;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 1、都是注解，@Controller是struts2作为接入层的注解，表示将action作为控制类。像springMVC都是一样，如
 *	@Controller
 *	@RequestMapping("/user")
 *  public class UserController {
 *  }
 * 2、@Scope 顾名思义就是作用域的意思，表示这个struts2的action的作用范围每一次调用的时候就会新建一个action
	如果@Scope中的prototype换成singleton(也就是单例)就是会出现，每一次请求用同一个action。
 * 
 * @author xiaotang
 *
 */
@Controller @Scope("prototype")
//实现ActionSupport支持的第一种方法-继承于ActionSupport类
public class BookAction extends ActionSupport{
	
	 //dao层对象
    @Resource BookDao bookDao;//加上@Resource的注解后就不用新建BookDao的对象了，可以直接使用
    @Resource TypeDao typeDao;
    //实体类对象book
    private Book book;
	public Book getBook() {
		return book;
	}
	//图书列表对象
	private List<Book> bookList;
	
	public List<Book> getBookList() {
		return bookList;
	}
	public void setBookList(List<Book> bookList) {
		this.bookList = bookList;
	}
	
	//传入的搜索关键字
	private String keyWords;
	public String getKeyWords() {
		return keyWords;
	}
	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}
	//传入的搜索关键字
	
	//User实体类对象
	private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	//User实体类对象

	/*添加book*/
	public String addBook() throws Exception{
		System.out.println(book.getBookName());
		bookDao.addBook(book);
		return "message";
	}
	
	/*显示所有book*/
    public String getAllBook() {
        bookList = bookDao.getAllBook();
        return "allBook";
    }
    /*管理员的操作*/
    /*显示某一book的详细信息*/
    public String showDetail() {
    	book = bookDao.getBookByBookId(book.getBookId());
        return "detail_view";
    }
    
    /*显示book的修改项*/
    public String showEdit() throws Exception {
    	book = bookDao.getBookByBookId(book.getBookId());
        return "edit_view";
    }

    /*编辑book*/
    public String editBook() throws Exception {
    	bookDao.updateBook(book);
        return "edit_message";
    }
    
    /*删除book*/
    public String deleteBook() throws Exception {
    	bookDao.deleteBook(book.getBookId());
    	ArrayList<Book> bookList=new ArrayList<Book>();
		bookList=bookDao.getAllBook();
		ActionContext.getContext().put("bookList",bookList);
        return "index";
    }
    /*管理员的操作*/
    
    /*查询book*/
    public String queryBooks() throws Exception {
    	bookList = bookDao.getBookByBookNameVaguely(keyWords);
        return "allBook";
    }
}
