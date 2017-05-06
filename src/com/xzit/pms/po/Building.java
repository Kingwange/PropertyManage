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
 * Building entity. @author MyEclipse Persistence Tools
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "BUILDING", schema = "JJJ")
public class Building implements java.io.Serializable {

	// Fields

	private Integer bid;
	private String bname;
	private Integer plies;
	private String state;
	private String remark;
	private Set<Room> rooms = new HashSet<Room>(0);

	// Constructors

	/** default constructor */
	public Building() {
	}

	/** minimal constructor */
	public Building(String bname, Integer plies, String state) {
		this.bname = bname;
		this.plies = plies;
		this.state = state;
	}

	/** full constructor */
	public Building(String bname, Integer plies, String state, String remark,
			Set<Room> rooms) {
		this.bname = bname;
		this.plies = plies;
		this.state = state;
		this.remark = remark;
		this.rooms = rooms;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_building",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "BID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getBid() {
		return this.bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	@Column(name = "BNAME", nullable = false, length = 20)
	public String getBname() {
		return this.bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	@Column(name = "PLIES", nullable = false, precision = 6, scale = 0)
	public Integer getPlies() {
		return this.plies;
	}

	public void setPlies(Integer plies) {
		this.plies = plies;
	}

	@Column(name = "STATE", length = 10)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "REMARK", length = 40)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "building")
	public Set<Room> getRooms() {
		return this.rooms;
	}

	public void setRooms(Set<Room> rooms) {
		this.rooms = rooms;
	}


}