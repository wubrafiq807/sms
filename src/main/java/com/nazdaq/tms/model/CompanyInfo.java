package com.nazdaq.tms.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author nasrin.akter
 *
 */
@Entity
@Table(name="CompanyInfo")
public class CompanyInfo implements Serializable{

	private static final long serialVersionUID = -723583058586873479L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;
	
	@Column(name="companyname")
	private String companyName;
	
	@Column(name="incharge")
	private String inCharge;
	
	@Column(name="contactno")
	private String contactNo;
	
	@Column(name="email")
	private String email;
	
	@Column(name="supervisor")
	private String supervisor;
	
	@Column(name="supcontactno")
	private String supContactNo;
	
	@Column(name="supemail")
	private String supEmail;
	
	
	

	@Column(name="companyaddress")
	private String companyAddress;
	
	@Column(name="engineer")
	private String engineer;
	
	@Column(name="engcontact")
	private String engContact;
	
	@Column(name="engemail")
	private String engEmail;
	

	
	public String getEngineer() {
		return engineer;
	}

	public void setEngineer(String engineer) {
		this.engineer = engineer;
	}

	public String getEngContact() {
		return engContact;
	}

	public void setEngContact(String engContact) {
		this.engContact = engContact;
	}

	public String getEngEmail() {
		return engEmail;
	}

	public void setEngEmail(String engEmail) {
		this.engEmail = engEmail;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getInCharge() {
		return inCharge;
	}

	public void setInCharge(String inCharge) {
		this.inCharge = inCharge;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSupervisor() {
		return supervisor;
	}

	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}
	
	
	public String getSupContactNo() {
		return supContactNo;
	}

	public void setSupContactNo(String supContactNo) {
		this.supContactNo = supContactNo;
	}
	
	
	public String getSupEmail() {
		return supEmail;
	}

	public void setSupEmail(String supEmail) {
		this.supEmail = supEmail;
	}
	
	

	

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}


	
}
