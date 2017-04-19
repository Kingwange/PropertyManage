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
	private String mcontent;
	private String mname;
	private Date repairdate;
	private String mtel;
	private String serviceman;
	private String stel;
	private Boolean type;
	private String remark;

	// Constructors

	/** default constructor */
	public Maintain() {
	}

	/** minimal constructor */
	public Maintain(String mname, String mtel) {
		this.mname = mname;
		this.mtel = mtel;
	}

	/** full constructor */
	public Maintain(Room room, String mcontent, String mname, Date repairdate,
			String mtel, String serviceman, String stel, Boolean type,
			String remark) {
		this.room = room;
		this.mcontent = mcontent;
		this.mname = mname;
		this.repairdate = repairdate;
		this.mtel = mtel;
		this.serviceman = serviceman;
		this.stel = stel;
		this.type = type;
		this.remark = remark;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_example",allocationSize=1)
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

	@Column(name = "MCONTENT", length = 40)
	public String getMcontent() {
		return this.mcontent;
	}

	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}

	@Column(name = "MNAME", nullable = false, length = 20)
	public String getMname() {
		return this.mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "REPAIRDATE", length = 7)
	public Date getRepairdate() {
		return this.repairdate;
	}

	public void setRepairdate(Date repairdate) {
		this.repairdate = repairdate;
	}

	@Column(name = "MTEL", nullable = false, length = 20)
	public String getMtel() {
		return this.mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	@Column(name = "SERVICEMAN", length = 20)
	public String getServiceman() {
		return this.serviceman;
	}

	public void setServiceman(String serviceman) {
		this.serviceman = serviceman;
	}

	@Column(name = "STEL", length = 20)
	public String getStel() {
		return this.stel;
	}

	public void setStel(String stel) {
		this.stel = stel;
	}

	@Column(name = "TYPE", precision = 1, scale = 0)
	public Boolean getType() {
		return this.type;
	}

	public void setType(Boolean type) {
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