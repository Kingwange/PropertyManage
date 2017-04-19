package com.xzit.pms.po;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.SEQUENCE;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Cleanmanage entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "CLEANMANAGE", schema = "JJJ")
public class Cleanmanage implements java.io.Serializable {

	// Fields

	private Integer cmid;
	private String cmname;
	private String sex;
	private String tel;
	private Date worktime;
	private String address;
	private String cleanarea;
	private String remark;

	// Constructors

	/** default constructor */
	public Cleanmanage() {
	}

	/** minimal constructor */
	public Cleanmanage(String cmname, String tel) {
		this.cmname = cmname;
		this.tel = tel;
	}

	/** full constructor */
	public Cleanmanage(String cmname, String sex, String tel, Date worktime,
			String address, String cleanarea, String remark) {
		this.cmname = cmname;
		this.sex = sex;
		this.tel = tel;
		this.worktime = worktime;
		this.address = address;
		this.cleanarea = cleanarea;
		this.remark = remark;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_cleanmanage",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "CMID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getCmid() {
		return this.cmid;
	}

	public void setCmid(Integer cmid) {
		this.cmid = cmid;
	}

	@Column(name = "CMNAME", nullable = false, length = 20)
	public String getCmname() {
		return this.cmname;
	}

	public void setCmname(String cmname) {
		this.cmname = cmname;
	}

	@Column(name = "SEX", length = 10)
	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "TEL", nullable = false, length = 20)
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "WORKTIME", length = 7)
	public Date getWorktime() {
		return this.worktime;
	}

	public void setWorktime(Date worktime) {
		this.worktime = worktime;
	}

	@Column(name = "ADDRESS", length = 50)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "CLEANAREA", length = 40)
	public String getCleanarea() {
		return this.cleanarea;
	}

	public void setCleanarea(String cleanarea) {
		this.cleanarea = cleanarea;
	}

	@Column(name = "REMARK", length = 40)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}