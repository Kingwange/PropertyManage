package com.xzit.pms.po;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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
	private String authority;
	private Set<Room> rooms = new HashSet<Room>(0);
	private Set<Maintainman> maintainmans = new HashSet<Maintainman>(0);

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
	public Users(String username, String password, String authority,
			Set<Room> rooms, Set<Maintainman> maintainmans) {
		this.username = username;
		this.password = password;
		this.authority = authority;
		this.rooms = rooms;
		this.maintainmans = maintainmans;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_users",allocationSize=1)
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

	@Column(name = "AUTHORITY", length = 10)
	public String getAuthority() {
		return this.authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
	public Set<Room> getRooms() {
		return this.rooms;
	}

	public void setRooms(Set<Room> rooms) {
		this.rooms = rooms;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "users")
	public Set<Maintainman> getMaintainmans() {
		return this.maintainmans;
	}

	public void setMaintainmans(Set<Maintainman> maintainmans) {
		this.maintainmans = maintainmans;
	}

	

}