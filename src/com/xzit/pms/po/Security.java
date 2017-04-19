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
 * Security entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "SECURITY", schema = "JJJ")
public class Security implements java.io.Serializable {

	// Fields

	private Integer sid;
	private String sname;
	private Boolean sex;
	private String identity;
	private String tel;
	private Boolean job;
	private String address;
	private String territory;
	private Boolean workttype;
	private String remark;
	private Set<Equipment> equipments = new HashSet<Equipment>(0);

	// Constructors

	/** default constructor */
	public Security() {
	}

	/** minimal constructor */
	public Security(String sname) {
		this.sname = sname;
	}

	/** full constructor */
	public Security(String sname, Boolean sex, String identity, String tel,
			Boolean job, String address, String territory, Boolean workttype,
			String remark, Set<Equipment> equipments) {
		this.sname = sname;
		this.sex = sex;
		this.identity = identity;
		this.tel = tel;
		this.job = job;
		this.address = address;
		this.territory = territory;
		this.workttype = workttype;
		this.remark = remark;
		this.equipments = equipments;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_example",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "SID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getSid() {
		return this.sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	@Column(name = "SNAME", nullable = false, length = 20)
	public String getSname() {
		return this.sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	@Column(name = "SEX", precision = 1, scale = 0)
	public Boolean getSex() {
		return this.sex;
	}

	public void setSex(Boolean sex) {
		this.sex = sex;
	}

	@Column(name = "IDENTITY", length = 20)
	public String getIdentity() {
		return this.identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	@Column(name = "TEL", length = 20)
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "JOB", precision = 1, scale = 0)
	public Boolean getJob() {
		return this.job;
	}

	public void setJob(Boolean job) {
		this.job = job;
	}

	@Column(name = "ADDRESS", length = 50)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "TERRITORY", length = 30)
	public String getTerritory() {
		return this.territory;
	}

	public void setTerritory(String territory) {
		this.territory = territory;
	}

	@Column(name = "WORKTTYPE", precision = 1, scale = 0)
	public Boolean getWorkttype() {
		return this.workttype;
	}

	public void setWorkttype(Boolean workttype) {
		this.workttype = workttype;
	}

	@Column(name = "REMARK", length = 20)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "security")
	public Set<Equipment> getEquipments() {
		return this.equipments;
	}

	public void setEquipments(Set<Equipment> equipments) {
		this.equipments = equipments;
	}

}