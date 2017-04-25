package com.xzit.pms.po;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Room entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "ROOM", schema = "JJJ")
public class Room implements java.io.Serializable {

	// Fields

	private Integer rid;
	private Building building;
	private Users users;
	private Ower ower;
	private String rname;
	private String type;
	private Double rarea;
	private Set<Resident> residents = new HashSet<Resident>(0);
	private Set<Maintain> maintains = new HashSet<Maintain>(0);
	private Set<Charge> charges = new HashSet<Charge>(0);
	private Set<Hire> hires = new HashSet<Hire>(0);

	// Constructors

	/** default constructor */
	public Room() {
	}

	/** full constructor */
	public Room(Building building, Users users, Ower ower, String rname,
		 String type, Double rarea, Set<Resident> residents,
			Set<Maintain> maintains, Set<Charge> charges, Set<Hire> hires) {
		this.building = building;
		this.users = users;
		this.ower = ower;
		this.rname = rname;
		this.type = type;
		this.rarea = rarea;
		this.residents = residents;
		this.maintains = maintains;
		this.charges = charges;
		this.hires = hires;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_room",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "RID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getRid() {
		return this.rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "BID")
	public Building getBuilding() {
		return this.building;
	}

	public void setBuilding(Building building) {
		this.building = building;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ID")
	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "OID")
	public Ower getOwer() {
		return this.ower;
	}

	public void setOwer(Ower ower) {
		this.ower = ower;
	}

	@Column(name = "RNAME", length = 20)
	public String getRname() {
		return this.rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	@Column(name = "TYPE", length = 10)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "RAREA", precision = 6)
	public Double getRarea() {
		return this.rarea;
	}

	public void setRarea(Double rarea) {
		this.rarea = rarea;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "room")
	public Set<Resident> getResidents() {
		return this.residents;
	}

	public void setResidents(Set<Resident> residents) {
		this.residents = residents;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "room")
	public Set<Maintain> getMaintains() {
		return this.maintains;
	}

	public void setMaintains(Set<Maintain> maintains) {
		this.maintains = maintains;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "room")
	public Set<Charge> getCharges() {
		return this.charges;
	}

	public void setCharges(Set<Charge> charges) {
		this.charges = charges;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "room")
	public Set<Hire> getHires() {
		return this.hires;
	}

	public void setHires(Set<Hire> hires) {
		this.hires = hires;
	}

}