package com.nazdaq.tms.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.IndexColumn;

@Entity
@Table(name = "Reagent")
public class Reagent implements Serializable {

	private static final long serialVersionUID = -723583058586873479L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;

	@Column(name = "reagentname")
	private String reagentName;

	@Column(name = "reagentalias")
	private String reagentAlias;

	@Column(name = "propertyid")
	private Integer propertyId;

	@Column(name = "reagentunitvalue")
	private Double reagentUnitValue;

	@Column(name = "reagenttype")
	private String reagentType;

	@Column(name = "reagenttypeattr")
	private String reagentTypeAttr;

	@Column(name = "reagenttypeattrsize")
	private String reagentTypeAttrSize;

	@Column(name = "discountpercentage")
	private Double discountPercentage;

	@Column(name = "value1")
	private Integer value1;

	@Column(name = "valuee")
	private String valuee;

	@Column(name = "valuemd")
	private String valuemd;

	@Column(name = "minimumusage")
	private Integer minimumUsage;

	@Column(name = "reorderlevel")
	private Integer reorderLevel;

	@Column(name = "reorderlevelattribute")
	private String reorderLevelAttribute;

	@Column(name = "servicecharge")
	private Double serviceCharge;

	@Column(name = "sellingprice")
	private Double reagentUnitSellingValue;

	@Column(name = "value2")
	private Double value2;

	@Column(name = "value3")
	private Double value3;

	@Column(name = "value4")
	private Double value4;

	@Column(name = "value5")
	private Double value5;
	@Column(name = "stockid")
	private Integer stockId;

	@Column(name = "brand_name")
	private String reagentBrandName;
	@Column(name="reagent_partno")
	private String partNo;
	@Column(name="reagent_origin")
	private String origin;

	/*
	 * public Reagent(Integer id, String reagentName) { this.id = id;
	 * this.reagentName = reagentName; } public Reagent() { }
	 */

	public String getPartNo() {
		return partNo;
	}

	@Override
	public String toString() {
		return "Reagent [id=" + id + ", reagentName=" + reagentName + ", reagentAlias=" + reagentAlias + ", propertyId="
				+ propertyId + ", reagentUnitValue=" + reagentUnitValue + ", reagentType=" + reagentType
				+ ", reagentTypeAttr=" + reagentTypeAttr + ", reagentTypeAttrSize=" + reagentTypeAttrSize
				+ ", discountPercentage=" + discountPercentage + ", value1=" + value1 + ", valuee=" + valuee
				+ ", valuemd=" + valuemd + ", minimumUsage=" + minimumUsage + ", reorderLevel=" + reorderLevel
				+ ", reorderLevelAttribute=" + reorderLevelAttribute + ", serviceCharge=" + serviceCharge
				+ ", reagentUnitSellingValue=" + reagentUnitSellingValue + ", value2=" + value2 + ", value3=" + value3
				+ ", value4=" + value4 + ", value5=" + value5 + ", stockId=" + stockId + ", reagentBrandName="
				+ reagentBrandName + ", partNo=" + partNo + ", origin=" + origin + "]";
	}

	public void setPartNo(String partNo) {
		this.partNo = partNo;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getValuemd() {
		return valuemd;
	}

	public void setValuemd(String valuemd) {
		this.valuemd = valuemd;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReagentName() {
		return reagentName;
	}

	public void setReagentName(String reagentName) {
		this.reagentName = reagentName;
	}

	public String getReagentAlias() {
		return reagentAlias;
	}

	public void setReagentAlias(String reagentAlias) {
		this.reagentAlias = reagentAlias;
	}

	public Integer getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(Integer propertyId) {
		this.propertyId = propertyId;
	}

	public String getReagentType() {
		return reagentType;
	}

	public void setReagentType(String reagentType) {
		this.reagentType = reagentType;
	}

	public String getReagentTypeAttr() {
		return reagentTypeAttr;
	}

	public void setReagentTypeAttr(String reagentTypeAttr) {
		this.reagentTypeAttr = reagentTypeAttr;
	}

	public Double getReagentUnitValue() {
		return reagentUnitValue;
	}

	public void setReagentUnitValue(Double reagentUnitValue) {
		this.reagentUnitValue = reagentUnitValue;
	}

	public String getReagentTypeAttrSize() {
		return reagentTypeAttrSize;
	}

	public void setReagentTypeAttrSize(String reagentTypeAttrSize) {
		this.reagentTypeAttrSize = reagentTypeAttrSize;
	}

	public Double getDiscountPercentage() {
		return discountPercentage;
	}

	public void setDiscountPercentage(Double discountPercentage) {
		this.discountPercentage = discountPercentage;
	}

	public Integer getValue1() {
		return value1;
	}

	public void setValue1(Integer value1) {
		this.value1 = value1;
	}

	public String getValuee() {
		return valuee;
	}

	public void setValuee(String valuee) {
		this.valuee = valuee;
	}

	public Integer getReorderLevel() {
		return reorderLevel;
	}

	public void setReorderLevel(Integer reorderLevel) {
		this.reorderLevel = reorderLevel;
	}

	public Integer getMinimumUsage() {
		return minimumUsage;
	}

	public void setMinimumUsage(Integer minimumUsage) {
		this.minimumUsage = minimumUsage;
	}

	public String getReorderLevelAttribute() {
		return reorderLevelAttribute;
	}

	public void setReorderLevelAttribute(String reorderLevelAttribute) {
		this.reorderLevelAttribute = reorderLevelAttribute;
	}

	public Double getServiceCharge() {
		return serviceCharge;
	}

	public void setServiceCharge(Double serviceCharge) {
		this.serviceCharge = serviceCharge;
	}

	public Double getReagentUnitSellingValue() {
		return reagentUnitSellingValue;
	}

	public void setReagentUnitSellingValue(Double reagentUnitSellingValue) {
		this.reagentUnitSellingValue = reagentUnitSellingValue;
	}

	public Double getValue2() {
		return value2;
	}

	public void setValue2(Double value2) {
		this.value2 = value2;
	}

	public Double getValue3() {
		return value3;
	}

	public void setValue3(Double value3) {
		this.value3 = value3;
	}

	public Double getValue4() {
		return value4;
	}

	public void setValue4(Double value4) {
		this.value4 = value4;
	}

	public Double getValue5() {
		return value5;
	}

	public void setValue5(Double value5) {
		this.value5 = value5;
	}

	public Integer getStockId() {
		return stockId;
	}

	public void setStockId(Integer stockId) {
		this.stockId = stockId;
	}

	public String getReagentBrandName() {
		return reagentBrandName;
	}

	public void setReagentBrandName(String reagentBrandName) {
		this.reagentBrandName = reagentBrandName;
	}

}
