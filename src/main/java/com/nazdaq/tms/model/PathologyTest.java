package com.nazdaq.tms.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Ferdous
 *
 */
@Entity
@Table(name="PathologyTest")
public class PathologyTest implements Serializable{

	private static final long serialVersionUID = -723583058586873479L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;
	
	@Column(name="testname")
	private String testName;
	
	@Column(name="testrate")
	private double testRate;
	
	@Column(name="minimumtestqty")
	private Integer minimumTestQty;
	
	@Column(name="propertyid")
	private Integer propertyId;
	
	@Column(name="value1")
	private String value1;
	
	

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTestName() {
		return testName;
	}

	public void setTestName(String testName) {
		this.testName = testName;
	}

	public double getTestRate() {
		return testRate;
	}

	public void setTestRate(double testRate) {
		this.testRate = testRate;
	}
	
	public Integer getMinimumTestQty() {
		return minimumTestQty;
	}

	public void setMinimumTestQty(Integer minimumTestQty) {
		this.minimumTestQty = minimumTestQty;
	}
	
	public Integer getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(Integer propertyId) {
		this.propertyId = propertyId;
	}

	public String getValue1() {
		return value1;
	}

	public void setValue1(String value1) {
		this.value1 = value1;
	}

	
	
}
