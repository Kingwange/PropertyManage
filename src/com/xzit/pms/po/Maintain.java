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
 * Maintain entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "MAINTAIN", schema = "JJJ")
public class Maintain implements java.io.Serializable {

	// Fields

	private Integer mid;
	private Room room;
	private Maintainman maintainman;
	private String mcontent;
	private String mname;
	private Date repairdate;
	private String mtel;
	private String type;
	private String remark;

	// Constructors

	/** default constructor */
	public Maintain() {
	}

	/** full constructor */
	public Maintain(Room room, Maintainman maintainman, String mcontent,
			String mname, Date repairdate, String mtel, String type,
			String remark) {
		this.room = room;
		this.maintainman = maintainman;
		this.mcontent = mcontent;
		this.mname = mname;
		this.repairdate = repairdate;
		this.mtel = mtel;
		this.type = type;
		this.remark = remark;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_maintain",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "MID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getMid() {
		return this.mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "RID")
	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "MMID")
	public Maintainman getMaintainman() {
		return this.maintainman;
	}

	public void setMaintainman(Maintainman maintainman) {
		this.maintainman = maintainman;
	}

	@Column(name = "MCONTENT", length = 40)
	public String getMcontent() {
		return this.mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	@Column(name = "MNAME", length = 20)
	public String getMname() {
		return this.mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	@Column(name = "REPAIRDATE", length = 11)
	public Date getRepairdate() {
		return this.repairdate;
	}

	public void setRepairdate(Date repairdate) {
		this.repairdate = repairdate;
	}

	@Column(name = "MTEL", length = 20)
	public String getMtel() {
		return this.mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	@Column(name = "TYPE", length = 10)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "REMARK", length = 40)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}