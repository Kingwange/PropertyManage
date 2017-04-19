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
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Ower entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "OWER", schema = "JJJ")
public class Ower implements java.io.Serializable {

	// Fields

	private Integer oid;
	private String oname;
	private String identity;
	private String tel;
	private Date intime;
	private String remark;
	private Set<Hire> hires = new HashSet<Hire>(0);

	// Constructors

	/** default constructor */
	public Ower() {
	}

	/** minimal constructor */
	public Ower(String oname, String tel) {
		this.oname = oname;
		this.tel = tel;
	}

	/** full constructor */
	public Ower(String oname, String identity, String tel, Date intime,
			String remark, Set<Hire> hires) {
		this.oname = oname;
		this.identity = identity;
		this.tel = tel;
		this.intime = intime;
		this.remark = remark;
		this.hires = hires;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_ower",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "OID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getOid() {
		return this.oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	@Column(name = "ONAME", nullable = false, length = 20)
	public String getOname() {
		return this.oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
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

	@Temporal(TemporalType.DATE)
	@Column(name = "INTIME", length = 7)
	public Date getIntime() {
		return this.intime;
	}

	public void setIntime(Date intime) {
		this.intime = intime;
	}

	@Column(name = "REMARK", length = 40)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "ower")
	public Set<Hire> getHires() {
		return this.hires;
	}

	public void setHires(Set<Hire> hires) {
		this.hires = hires;
	}


}