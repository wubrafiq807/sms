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
@Table(name="ReagentProperty")
public class ReagentProperty implements Serializable{

	private static final long serialVersionUID = -723583058586873479L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;
	
	@Column(name="supplierid")
	private Integer supplierId;
	
	@Column(name="propertyname")
	private String propertyName;
	
	@Column(name="propertyalias")
	private String propertyAlias;
	
	@Column(name="propertydesc")
	private String propertyDesc;
	
	@Column(name="propertydiscountpercentage")
	private Double propertyDiscountPercentage;

	@Column(name="modelnumber")
	private String modelNumber;
	
	@Column(name="departmentname")
	private String departmentName;
	
	@Column(name="value")
	private String value;
	
	@Column(name="installdate")
	private String installDate;

	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	public String getPropertyAlias() {
		return propertyAlias;
	}

	public void setPropertyAlias(String propertyAlias) {
		this.propertyAlias = propertyAlias;
	}

	public String getPropertyDesc() {
		return propertyDesc;
	}

	public void setPropertyDesc(String propertyDesc) {
		this.propertyDesc = propertyDesc;
	}

	public Double getPropertyDiscountPercentage() {
		return propertyDiscountPercentage;
	}

	public void setPropertyDiscountPercentage(Double propertyDiscountPercentage) {
		this.propertyDiscountPercentage = propertyDiscountPercentage;
	}

	public String getModelNumber() {
		return modelNumber;
	}

	public void setModelNumber(String modelNumber) {
		this.modelNumber = modelNumber;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getInstallDate() {
		return installDate;
	}

	public void setInstallDate(String installDate) {
		this.installDate = installDate;
	}	
	

	
}
