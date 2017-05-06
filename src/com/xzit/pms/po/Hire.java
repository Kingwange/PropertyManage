package com.xzit.pms.po;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Hire entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "HIRE", schema = "JJJ")
public class Hire implements java.io.Serializable {

	// Fields

	private Integer hid;
	private Room room;
	private String hname;
	private String htel;
	private Date checkindate;
	private Date duedate;
	private String remark;

	// Constructors

	/** default constructor */
	public Hire() {
	}

	/** minimal constructor */
	public Hire(String hname, String htel) {
		this.hname = hname;
		this.htel = htel;
	}

	/** full constructor */
	public Hire(Room room, String hname,
			String htel, Date checkindate, Date duedate, String remark) {
		this.room = room;
		this.hname = hname;
		this.htel = htel;
		this.checkindate = checkindate;
		this.duedate = duedate;
		this.remark = remark;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_hire",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "HID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getHid() {
		return this.hid;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
	}

	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "RID")
	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	@Column(name = "HNAME", nullable = false, length = 20)
	public String getHname() {
		return this.hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	@Column(name = "HTEL", nullable = false, length = 20)
	public String getHtel() {
		return this.htel;
	}

	public void setHtel(String htel) {
		this.htel = htel;
	}
	@Temporal(TemporalType.DATE)
	@Column(name = "CHECKINDATE", length = 7)
	public Date getCheckindate() {
		return this.checkindate;
	}

	public void setCheckindate(Date checkindate) {
		this.checkindate = checkindate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "DUEDATE", length = 7)
	public Date getDuedate() {
		return this.duedate;
	}

	public void setDuedate(Date duedate) {
		this.duedate = duedate;
	}

	@Column(name = "REMARK", length = 40)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}