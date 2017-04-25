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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * Maintainman entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "MAINTAINMAN", schema = "JJJ")
public class Maintainman implements java.io.Serializable {

	// Fields

	private Integer mmid;
	private Users users;
	private String name;
	private String repairtype;
	private String tel;
	private Set<Maintain> maintains = new HashSet<Maintain>(0);

	// Constructors

	/** default constructor */
	public Maintainman() {
	}

	/** minimal constructor */
	public Maintainman(Users users) {
		this.users = users;
	}

	/** full constructor */
	public Maintainman(Users users, String name, String repairtype, String tel,
			Set<Maintain> maintains) {
		this.users = users;
		this.name = name;
		this.repairtype = repairtype;
		this.tel = tel;
		this.maintains = maintains;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_maintainman",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "MMID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getMmid() {
		return this.mmid;
	}

	public void setMmid(Integer mmid) {
		this.mmid = mmid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID", nullable = false)
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@Column(name = "NAME", length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "REPAIRTYPE", length = 20)
	public String getRepairtype() {
		return this.repairtype;
	}

	public void setRepairtype(String repairtype) {
		this.repairtype = repairtype;
	}

	@Column(name = "TEL", length = 20)
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "maintainman")
	public Set<Maintain> getMaintains() {
		return this.maintains;
	}

	public void setMaintains(Set<Maintain> maintains) {
		this.maintains = maintains;
	}

}