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
	private String rname;
	private Boolean rsex;
	private String identity;
	private String tel;
	private String reamrk;
	private Set<Complaint> complaints = new HashSet<Complaint>(0);

	// Constructors

	/** default constructor */
	public Resident() {
	}

	/** minimal constructor */
	public Resident(String rname, String tel) {
		this.rname = rname;
		this.tel = tel;
	}

	/** full constructor */
	public Resident(Room room, String rname, Boolean rsex, String identity,
			String tel, String reamrk, Set<Complaint> complaints) {
		this.room = room;
		this.rname = rname;
		this.rsex = rsex;
		this.identity = identity;
		this.tel = tel;
		this.reamrk = reamrk;
		this.complaints = complaints;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_example",allocationSize=1)
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

	@Column(name = "RNAME", nullable = false, length = 20)
	public String getRname() {
		return this.rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	@Column(name = "RSEX", precision = 1, scale = 0)
	public Boolean getRsex() {
		return this.rsex;
	}

	public void setRsex(Boolean rsex) {
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

	@Column(name = "REAMRK", length = 40)
	public String getReamrk() {
		return this.reamrk;
	}

	public void setReamrk(String reamrk) {
		this.reamrk = reamrk;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "resident")
	public Set<Complaint> getComplaints() {
		return this.complaints;
	}

	public void setComplaints(Set<Complaint> complaints) {
		this.complaints = complaints;
	}

}