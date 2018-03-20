package com.dao;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Book;

/**
 *1.get()采用立即加载方式,而load()采用延迟加载;get()方法执行的时候,会立即向数据库发出查询语句,而load()方法返回的是一个
 *代理(此代理中只有一个id属性),只有等真正使用该对象属性的时候,才会发出sql语句
 *2.如果数据库中没有对应的记录,get()方法返回的是null.而load()方法出现异常ObjectNotFoundException 
 * @author 小汤
 *
 */

/*
 * 下边的注解是对类进行注解，相当于把BookDao类变成了bean
 */

@Service@Transactional
public class BookDao {
	@Resource SessionFactory factory;//这样不需要再去实例化一个Sessionfactory（引用配置文件中的bean）
	@Resource TypeDao typeDao; 
//一、book增删改查
	//1.新增book的方法
	public void addBook(Book book) throws Exception{
		Session s=factory.getCurrentSession();//获得当前的Session
		s.save(s);
	}
	//2.删除book方法
	public void deleteBook(Integer bookId) throws Exception{
		Session s=factory.getCurrentSession();
		Object book=s.load(Book.class, bookId);//找到的是id为foodId的对象
		s.delete(book);
	}
	//3.更新book的方法
	public void updateBook(Book book) throws Exception{
		Session s=factory.getCurrentSession();
		s.update(book);
		/*s.saveOrUpdateCopy(food);*/
	}
	//4.显示所有book书籍的方法
	@SuppressWarnings("unchecked")
	public ArrayList<Book> getAllBook(){
		Session s=factory.getCurrentSession();
		String hql="From Book";//hibernate中类似SQL语句的作用
		Query q=s.createQuery(hql);
		ArrayList<Book> bookList=(ArrayList<Book>) q.list();
		return bookList;
	}
//一、book增删改查
	
//二、条件查询
	//5.根据书籍id(bookId)查找书籍
	public Book getBookByBookId(Integer bookId){
		Session s=factory.getCurrentSession();
		Book book=(Book)s.get(Book.class,bookId);
		return book;
	}
	//6.根据书籍IBSN(bookCode)查找书籍
	public Book getBookByBookCode(String bookCode){
		Session s=factory.getCurrentSession();
		String hql="From Book ";
		Book book=null;
		if(!bookCode.equals("")){//如果传入的ISBN为空，返回null
			hql=hql+" book and book.bookCode='"+bookCode+"'";
			Query q=s.createQuery(hql);
			book=(Book)q.list().get(0);
		}
		return book;
	}
	//7.根据书名精确查找book(precisely:精确地)
	@SuppressWarnings("unchecked")
	public ArrayList<Book> getBookByBookNamePrecisely(String bookName){
		Session s=factory.getCurrentSession();
		ArrayList<Book> bookList=null;
		String hql="From Book book where 1=1";//where 1=1为了避免空值报错
		if(!bookName.equals("")){
			hql=hql+" and book.bookName = '"+bookName+"'";
			Query q=s.createQuery(hql);
			bookList=(ArrayList<Book>)q.list(); 
		}else{
			bookList=getAllBook();
		}
		return bookList;
	}
	//8.根据书名bookName模糊查询(vaguely:模糊地)
	@SuppressWarnings("unchecked")
	public ArrayList<Book> getBookByBookNameVaguely(String bookName){
		Session s=factory.getCurrentSession();
		ArrayList<Book> bookList=null;
		String hql="From Book book where 1=1";//为了避免空值报错
		if(!bookName.equals("")){
			hql=hql+" and book.bookName like '%"+bookName+"%'";
			Query q=s.createQuery(hql);
			bookList=(ArrayList<Book>)q.list(); 
		}else{
			bookList=getAllBook();
		}
		return bookList;
	}
	//9.根据作者bookAuthor模糊查询
	@SuppressWarnings("unchecked")
	public ArrayList<Book> getBookByBookAuthor(String bookAuthor){
		Session s=factory.getCurrentSession();
		ArrayList<Book> bookList=null;
		String hql="From Book book where 1=1 ";
		if(!bookAuthor.equals("")){
			hql=hql+" and book.bookAuthor like '%"+bookAuthor+"%'";
			Query q=s.createQuery(hql);
			//如果查询到为null，则说明没有改作者撰写的书籍
			bookList=(ArrayList<Book>)q.list();
		}else{
			bookList=getAllBook();
		}
		return bookList;
	}
	//10.根据价格区间bookPrice查询
	@SuppressWarnings("unchecked")
	public ArrayList<Book> getBookByBookPrice(double lowestPrice,double highestPrice){
		//根据最低价格lowestPrice与最高价格highestPrice查询处于改价格区间的书籍
		Session s=factory.getCurrentSession();
		ArrayList<Book> bookList=null;
		String hql="From Book book ";
		/*hql=hql+"and book.bookPrice>'"+lowestPrice+"' and book.bookPrice<'"+highestPrice+"'";*/
		hql=hql+" where book.bookPrice between '"+lowestPrice+"' and '"+highestPrice+"'";
		Query q=s.createQuery(hql);
		bookList=(ArrayList<Book>) q.list();
		return bookList;
	}
	//11.根据书籍类型bookType查找
	@SuppressWarnings("unchecked")
	public ArrayList<Book> getBookByBookType(Integer typeId){
		Session s=factory.getCurrentSession();
		ArrayList<Book> bookList=null;
		String hql="From Book book where 1=1 and book.type.typeId='"+typeId+"'";
		Query q=s.createQuery(hql);
		bookList=(ArrayList<Book>)q.list();
		return bookList;
	}
	//12.根据书籍类型bookType精确查找
	public ArrayList<Book> getBookByBookType(String typeName){
		Integer typeId=typeDao.getTypeByTypeName(typeName).getTypeId();
		ArrayList<Book> bookList=getBookByBookType(typeId);
		return bookList;
	}
//二、条件查询
}
