package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * Super entity. @author MyEclipse Persistence Tools
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "super", catalog = "book")
public class Mysuper implements java.io.Serializable {

	// Fields

	private Integer superId;
	private String superNum;
	private String superName;
	private String superPwd;

	// Constructors

	/** default constructor */
	public Mysuper() {
	}

	/** full constructor */
	public Mysuper(String superNum, String superName, String superPwd) {
		this.superNum = superNum;
		this.superName = superName;
		this.superPwd = superPwd;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "increment")
	@Id
	@GeneratedValue(generator = "generator")

	@Column(name = "superId", unique = true, nullable = false)

	public Integer getSuperId() {
		return this.superId;
	}

	public void setSuperId(Integer superId) {
		this.superId = superId;
	}

	@Column(name = "superNum", nullable = false, length = 20)

	public String getSuperNum() {
		return this.superNum;
	}

	public void setSuperNum(String superNum) {
		this.superNum = superNum;
	}

	@Column(name = "superName", nullable = true, length = 20)

	public String getSuperName() {
		return this.superName;
	}

	public void setSuperName(String superName) {
		this.superName = superName;
	}

	@Column(name = "superPwd", nullable = false, length = 20)

	public String getSuperPwd() {
		return this.superPwd;
	}

	public void setSuperPwd(String superPwd) {
		this.superPwd = superPwd;
	}

}