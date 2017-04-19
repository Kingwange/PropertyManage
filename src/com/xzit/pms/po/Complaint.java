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
 * Complaint entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "COMPLAINT", schema = "JJJ")
public class Complaint implements java.io.Serializable {

	// Fields

	private Integer cpid;
	private Resident resident;
	private String cpcontent;
	private Date submissiontime;
	private String state;
	private String handleinfo;

	// Constructors

	/** default constructor */
	public Complaint() {
	}

	/** full constructor */
	public Complaint(Resident resident, String cpcontent, Date submissiontime,
			String state, String handleinfo) {
		this.resident = resident;
		this.cpcontent = cpcontent;
		this.submissiontime = submissiontime;
		this.state = state;
		this.handleinfo = handleinfo;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_complaint",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "CPID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getCpid() {
		return this.cpid;
	}

	public void setCpid(Integer cpid) {
		this.cpid = cpid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "RSID")
	public Resident getResident() {
		return this.resident;
	}

	public void setResident(Resident resident) {
		this.resident = resident;
	}

	@Column(name = "CPCONTENT", length = 40)
	public String getCpcontent() {
		return this.cpcontent;
	}

	public void setCpcontent(String cpcontent) {
		this.cpcontent = cpcontent;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "SUBMISSIONTIME", length = 7)
	public Date getSubmissiontime() {
		return this.submissiontime;
	}

	public void setSubmissiontime(Date submissiontime) {
		this.submissiontime = submissiontime;
	}

	@Column(name = "STATE", length = 10)
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "HANDLEINFO", length = 40)
	public String getHandleinfo() {
		return this.handleinfo;
	}

	public void setHandleinfo(String handleinfo) {
		this.handleinfo = handleinfo;
	}

}