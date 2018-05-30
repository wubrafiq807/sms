package com.nazdaq.tms.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "work_order_mst")
public class WorkOrderMst {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;
	@Column(name = "vendor_name")
	private String vendorName;
	@Column(name = "addressline1")
	private String addressLine1;
	@Column(name = "addressline2")
	private String addressLine2;
	@Column(name = "workorder_no")
	private String workOrderNo;
	@Column(name = "workorder_date")
	private String workOrderDate;
	@Column(name = "vendor_quotation_no")
	private String vendorQuotationNo;
	@Column(name = "vendor_quotation_date")
	private String vendorQuotationDate;
	@Column(name = "workorder_subject")
	private String workOrderSubject;
	@Column(name = "payment_mode")
	private String paymentMode;
	@Column(name = "delivery_place")
	private String deliveryPlace;
	@Column(name = "delivery_time")
	private String deliveryTime;
	@Column(name = "created_by")
	private String createdBy;
	@Column(name = "created_date")
	private String createdDate;
	@Column(name = "modified_by")
	private String modifiedBy;
	@Column(name = "modified_date")
	private String modifiedDate;

	@Column(name = "delivery_schedule")
	private String deliverySchedule;
	@Column(name = "special_condition")
	private String specialCondition;
	@Column(name="footer_text")
	private String footerText;
	@Column(name="originalTotalAmount")
	private Double originalTotalAmount;
	@Column(name="discountedTotalAmount")
	private Double discountedTotalAmount;
	@Column(name="discountAmount")
	private Double discountAmount;

	public WorkOrderMst() {
		// TODO Auto-generated constructor stub
	}

	public WorkOrderMst(Integer id, String vendorName, String addressLine1, String addressLine2, String workOrderNo,
			String workOrderDate, String vendorQuotationNo, String vendorQuotationDate, String workOrderSubject,
			String paymentMode, String deliveryPlace, String deliveryTime, String createdBy, String createdDate,
			String modifiedBy, String modifiedDate, String deliverySchedule, String specialCondition, String footerText,
			Double originalTotalAmount, Double discountedTotalAmount, Double discountAmount) {
		super();
		this.id = id;
		this.vendorName = vendorName;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.workOrderNo = workOrderNo;
		this.workOrderDate = workOrderDate;
		this.vendorQuotationNo = vendorQuotationNo;
		this.vendorQuotationDate = vendorQuotationDate;
		this.workOrderSubject = workOrderSubject;
		this.paymentMode = paymentMode;
		this.deliveryPlace = deliveryPlace;
		this.deliveryTime = deliveryTime;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.modifiedBy = modifiedBy;
		this.modifiedDate = modifiedDate;
		this.deliverySchedule = deliverySchedule;
		this.specialCondition = specialCondition;
		this.footerText = footerText;
		this.originalTotalAmount = originalTotalAmount;
		this.discountedTotalAmount = discountedTotalAmount;
		this.discountAmount = discountAmount;
	}

	public Double getOriginalTotalAmount() {
		return originalTotalAmount;
	}

	public void setOriginalTotalAmount(Double originalTotalAmount) {
		this.originalTotalAmount = originalTotalAmount;
	}

	public Double getDiscountedTotalAmount() {
		return discountedTotalAmount;
	}

	public void setDiscountedTotalAmount(Double discountedTotalAmount) {
		this.discountedTotalAmount = discountedTotalAmount;
	}

	public Double getDiscountAmount() {
		return discountAmount;
	}

	public void setDiscountAmount(Double discountAmount) {
		this.discountAmount = discountAmount;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getVendorName() {
		return vendorName;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getWorkOrderNo() {
		return workOrderNo;
	}

	public void setWorkOrderNo(String workOrderNo) {
		this.workOrderNo = workOrderNo;
	}

	public String getWorkOrderDate() {
		return workOrderDate;
	}

	public void setWorkOrderDate(String workOrderDate) {
		this.workOrderDate = workOrderDate;
	}

	public String getVendorQuotationNo() {
		return vendorQuotationNo;
	}

	public void setVendorQuotationNo(String vendorQuotationNo) {
		this.vendorQuotationNo = vendorQuotationNo;
	}

	public String getVendorQuotationDate() {
		return vendorQuotationDate;
	}

	public void setVendorQuotationDate(String vendorQuotationDate) {
		this.vendorQuotationDate = vendorQuotationDate;
	}

	public String getWorkOrderSubject() {
		return workOrderSubject;
	}

	public void setWorkOrderSubject(String workOrderSubject) {
		this.workOrderSubject = workOrderSubject;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getDeliveryPlace() {
		return deliveryPlace;
	}

	public void setDeliveryPlace(String deliveryPlace) {
		this.deliveryPlace = deliveryPlace;
	}

	public String getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public String getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public String getDeliverySchedule() {
		return deliverySchedule;
	}

	public void setDeliverySchedule(String deliverySchedule) {
		this.deliverySchedule = deliverySchedule;
	}

	public String getSpecialCondition() {
		return specialCondition;
	}

	public void setSpecialCondition(String specialCondition) {
		this.specialCondition = specialCondition;
	}

	public String getFooterText() {
		return footerText;
	}

	public void setFooterText(String footerText) {
		this.footerText = footerText;
	}

}