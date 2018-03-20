package com.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * Book entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "book", catalog = "book")

public class Book implements java.io.Serializable {

	// Fields

	private Integer bookId;
	private Type type;
	private String bookCode;
	private String bookName;
	private String bookImg;
	private String bookAuthor;
	private String bookDes;
	private String bookService;
	private Double bookPrice;
	private Set<Order> orders = new HashSet<Order>(0);

	// Constructors

	/** default constructor */
	public Book() {
	}

	/** minimal constructor */
	public Book(String bookCode) {
		this.bookCode = bookCode;
	}

	/** full constructor */
	public Book(Type type, String bookCode, String bookName, String bookImg, String bookAuthor, String bookDes,
			String bookService, Double bookPrice, Set<Order> orders) {
		this.type = type;
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.bookImg = bookImg;
		this.bookAuthor = bookAuthor;
		this.bookDes = bookDes;
		this.bookService = bookService;
		this.bookPrice = bookPrice;
		this.orders = orders;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")

	@Column(name = "bookId", unique = true, nullable = false)

	public Integer getBookId() {
		return this.bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "bookType")

	public Type getType() {
		return this.type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	@Column(name = "bookCode", nullable = false, length = 20)

	public String getBookCode() {
		return this.bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}

	@Column(name = "bookName", length = 20)

	public String getBookName() {
		return this.bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	@Column(name = "bookImg", length = 20)

	public String getBookImg() {
		return this.bookImg;
	}

	public void setBookImg(String bookImg) {
		this.bookImg = bookImg;
	}

	@Column(name = "bookAuthor", length = 20)

	public String getBookAuthor() {
		return this.bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	@Column(name = "bookDes", length = 20)

	public String getBookDes() {
		return this.bookDes;
	}

	public void setBookDes(String bookDes) {
		this.bookDes = bookDes;
	}

	@Column(name = "bookService", length = 20)

	public String getBookService() {
		return this.bookService;
	}

	public void setBookService(String bookService) {
		this.bookService = bookService;
	}

	@Column(name = "bookPrice", precision = 22, scale = 0)

	public Double getBookPrice() {
		return this.bookPrice;
	}

	public void setBookPrice(Double bookPrice) {
		this.bookPrice = bookPrice;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "book")

	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
}