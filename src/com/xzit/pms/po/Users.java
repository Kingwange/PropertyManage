package com.xzit.pms.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Users entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "USERS", schema = "JJJ")
public class Users implements java.io.Serializable {

	// Fields

	private Integer id;
	private String username;
	private String password;
	private Integer rsid;

	// Constructors

	/** default constructor */
	public Users() {
	}

	/** minimal constructor */
	public Users(String username, String password) {
		this.username = username;
		this.password = password;
	}

	/** full constructor */
	public Users(String username, String password, Integer rsid) {
		this.username = username;
		this.password = password;
		this.rsid = rsid;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_example",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "ID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "USERNAME", nullable = false, length = 20)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "PASSWORD", nullable = false, length = 20)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "RSID", precision = 6, scale = 0)
	public Integer getRsid() {
		return this.rsid;
	}

	public void setRsid(Integer rsid) {
		this.rsid = rsid;
	}

}