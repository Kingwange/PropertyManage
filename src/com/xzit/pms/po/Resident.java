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
 * Resident entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "RESIDENT", schema = "JJJ")
public class Resident implements java.io.Serializable {

	// Fields

	private Integer rsid;
	private Room room;
	private String rsname;
	private String rsex;
	private String identity;
	private String tel;
	private String remark;
	private Set<Complaint> complaints = new HashSet<Complaint>(0);

	// Constructors

	/** default constructor */
	public Resident() {
	}

	/** minimal constructor */
	public Resident(String rsname, String tel) {
		this.rsname = rsname;
		this.tel = tel;
	}

	/** full constructor */
	public Resident(Room room, String rsname, String rsex, String identity,
			String tel, String remark, Set<Complaint> complaints) {
		this.room = room;
		this.rsname = rsname;
		this.rsex = rsex;
		this.identity = identity;
		this.tel = tel;
		this.remark = remark;
		this.complaints = complaints;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_resident",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "RSID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getRsid() {
		return this.rsid;
	}

	public void setRsid(Integer rsid) {
		this.rsid = rsid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "RID")
	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	@Column(name = "RSNAME", nullable = false, length = 20)
	public String getRsname() {
		return this.rsname;
	}

	public void setRsname(String rsname) {
		this.rsname = rsname;
	}

	@Column(name = "RSEX", length = 10)
	public String getRsex() {
		return this.rsex;
	}

	public void setRsex(String rsex) {
		this.rsex = rsex;
	}

	@Column(name = "IDENTITY", length = 20)
	public String getIdentity() {
		return this.identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	@Column(name = "TEL", nullable = false, length = 20)
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "REMARK", length = 40)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "resident")
	public Set<Complaint> getComplaints() {
		return this.complaints;
	}

	public void setComplaints(Set<Complaint> complaints) {
		this.complaints = complaints;
	}

}