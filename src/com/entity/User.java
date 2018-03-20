package com.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user", catalog = "book")

public class User implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userTele;
	private String userPwd;
	private String userName;
	private String userEmail;
	private String userSex;
	private String userAddress;
	private String userBirth;
	private String userHeadImg;
	private String userQQ;
	private String userAuto;
	private Set<Order> orders = new HashSet<Order>(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userTele, String userPwd, String userName) {
		this.userTele = userTele;
		this.userPwd = userPwd;
		this.userName = userName;
	}

	/** full constructor */
	public User(String userTele, String userPwd, String userName, String userEmail, String userSex, 
			String userAddress,String userBirth, String userHeadImg, String userQQ, String userAuto, Set<Order> orders) {
		this.userTele = userTele;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userSex = userSex;
		this.userAddress = userAddress;
		this.userBirth = userBirth;
		this.userHeadImg = userHeadImg;
		this.userQQ = userQQ;
		this.userAuto = userAuto;
		this.orders = orders;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")

	@Column(name = "userId", unique = true, nullable = false)

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "userTele", nullable = false, length = 20)

	public String getUserTele() {
		return this.userTele;
	}

	public void setUserTele(String userTele) {
		this.userTele = userTele;
	}

	@Column(name = "userPwd", nullable = false, length = 20)

	public String getUserPwd() {
		return this.userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	@Column(name = "userName", nullable = false, length = 20)

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "userEmail", length = 20)

	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	@Column(name = "userSex", length = 20)

	public String getUserSex() {
		return this.userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	@Column(name = "userAddress", length = 20)

	public String getUserAddress() {
		return this.userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	@Column(name = "userBirth", length = 20)

	public String getUserBirth() {
		return this.userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	@Column(name = "userHeadImg", length = 20)

	public String getUserHeadImg() {
		return this.userHeadImg;
	}

	public void setUserHeadImg(String userHeadImg) {
		this.userHeadImg = userHeadImg;
	}

	@Column(name = "userQQ", length = 20)

	public String getUserQQ() {
		return this.userQQ;
	}

	public void setUserQQ(String userQQ) {
		this.userQQ = userQQ;
	}

	@Column(name = "userAuto", length = 20)

	public String getUserAuto() {
		return this.userAuto;
	}

	public void setUserAuto(String userAuto) {
		this.userAuto = userAuto;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")

	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
}