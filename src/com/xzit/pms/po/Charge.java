package com.xzit.pms.po;

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

/**
 * Charge entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "CHARGE", schema = "JJJ")
public class Charge implements java.io.Serializable {

	// Fields

	private Integer cid;
	private Room room;
	private String cname;
	private Double price;
	private String chargestate;
	private String remark;

	// Constructors

	/** default constructor */
	public Charge() {
	}

	/** minimal constructor */
	public Charge(String cname) {
		this.cname = cname;
	}

	/** full constructor */
	public Charge(Room room, String cname, Double price, String chargestate,
			String remark) {
		this.room = room;
		this.cname = cname;
		this.price = price;
		this.chargestate = chargestate;
		this.remark = remark;
	}

	// Property accessors
	@SequenceGenerator(name = "generator",sequenceName="seq_charge",allocationSize=1)
	@Id
	@GeneratedValue(strategy = SEQUENCE, generator = "generator")
	@Column(name = "CID", unique = true, nullable = false, precision = 6, scale = 0)
	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "RID")
	public Room getRoom() {
		return this.room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	@Column(name = "CNAME", nullable = false, length = 20)
	public String getCname() {
		return this.cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	@Column(name = "PRICE", precision = 10)
	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Column(name = "CHARGESTATE", length = 10)
	public String getChargestate() {
		return this.chargestate;
	}

	public void setChargestate(String chargestate) {
		this.chargestate = chargestate;
	}

	@Column(name = "REMARK", length = 40)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}