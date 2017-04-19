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
 * Equipment entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "EQUIPMENT", schema = "JJJ")
public class Equipment implements java.io.Serializable {

	// Fields

	private Integer eid;
	private Security security;
	private String ename;
	private Integer enumber;
	private String vendor;
	private Date producedate;
	private String maintenancetime;
	private String remark;

	// Constructors

	/** default constructor */
	public Equipment() {
	}

	/** minimal constructor */
	public Equipment(String ename) {
		this.ename = ename;
	}

	/** full constructor */
	public Equipment(Security security, String ename, Integer enumber,
			String vendor, Date producedate, String maintenancetime,
			String remark) {
		this.security = security;
		this.ename = ename;
		this.enumber = enumber;
		this.vendor = vendor;
		this.producedate = producedate;
		this.maintenancetime = maintenancetime;
		this.remark = remark;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_equipment",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "EID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getEid() {
		return this.eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SID")
	public Security getSecurity() {
		return this.security;
	}

	public void setSecurity(Security security) {
		this.security = security;
	}

	@Column(name = "ENAME", nullable = false, length = 20)
	public String getEname() {
		return this.ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	@Column(name = "ENUMBER", precision = 6, scale = 0)
	public Integer getEnumber() {
		return this.enumber;
	}

	public void setEnumber(Integer enumber) {
		this.enumber = enumber;
	}

	@Column(name = "VENDOR", length = 20)
	public String getVendor() {
		return this.vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "PRODUCEDATE", length = 7)
	public Date getProducedate() {
		return this.producedate;
	}

	public void setProducedate(Date producedate) {
		this.producedate = producedate;
	}

	@Column(name = "MAINTENANCETIME", length = 20)
	public String getMaintenancetime() {
		return this.maintenancetime;
	}

	public void setMaintenancetime(String maintenancetime) {
		this.maintenancetime = maintenancetime;
	}

	@Column(name = "REMARK", length = 40)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}