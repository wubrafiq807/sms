package com.nazdaq.tms.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "travel_requisition")
public class TravelRequisition implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;

	@Column(name = "emp_name")
	private String empName;

	// punchid
	@Column(name = "empId")
	private Integer empId;

	@Column(name = "dept_name")
	private String deptName;

	@Column(name = "trip_purpose")
	private String tripPurpose;

	@Column(name = "departure_date")
	private String departureDate;

	@Column(name = "return_date")
	private String returnDate;

	@Column(name = "destination")
	private String destination;

	@Column(name = "means_of_transport")
	private String meansOfTransport;

	@Column(name = "status")
	private String status;

	@Column(name = "created_by")
	private String createdBy;

	@Column(name = "created_date")
	private Date createdDate;

	@Column(name = "modified_by")
	private String modifiedBy;

	@Column(name = "modified_date")
	private Date modifiedDate;

	@Column(name = "remarks")
	private String remarks;

	@Column(name = "submit_date")
	private Date submitDate;

	@Column(name = "approve_by_manager")
	private String approveByManager;

	@Column(name = "app_man_date")
	private Date appManDate;

	@Column(name = "app_line_manager")
	private String approveByLineManager;

	@Column(name = "app_line_man_date")
	private Date appLineManDate;

	@Column(name = "rejected_by")
	private String rejectedBy;

	@Column(name = "rejected_date")
	private Date rejectedDate;

	@Column(name = "reject_reason")
	private String rejectReason;

	@Column(name = "req_unique_number")
	private String reqUniqueNumber;

	@Column(name = "lxn_id")
	private String lxnId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getTripPurpose() {
		return tripPurpose;
	}

	public void setTripPurpose(String tripPurpose) {
		this.tripPurpose = tripPurpose;
	}

	public String getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}

	public String getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(String returnDate) {
		this.returnDate = returnDate;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getMeansOfTransport() {
		return meansOfTransport;
	}

	public void setMeansOfTransport(String meansOfTransport) {
		this.meansOfTransport = meansOfTransport;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Date getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getApproveByManager() {
		return approveByManager;
	}

	public void setApproveByManager(String approveByManager) {
		this.approveByManager = approveByManager;
	}

	public Date getAppManDate() {
		return appManDate;
	}

	public void setAppManDate(Date appManDate) {
		this.appManDate = appManDate;
	}

	public String getApproveByLineManager() {
		return approveByLineManager;
	}

	public void setApproveByLineManager(String approveByLineManager) {
		this.approveByLineManager = approveByLineManager;
	}

	public Date getAppLineManDate() {
		return appLineManDate;
	}

	public void setAppLineManDate(Date appLineManDate) {
		this.appLineManDate = appLineManDate;
	}

	public String getRejectedBy() {
		return rejectedBy;
	}

	public void setRejectedBy(String rejectedBy) {
		this.rejectedBy = rejectedBy;
	}

	public Date getRejectedDate() {
		return rejectedDate;
	}

	public void setRejectedDate(Date rejectedDate) {
		this.rejectedDate = rejectedDate;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}

	public String getReqUniqueNumber() {
		return reqUniqueNumber;
	}

	public void setReqUniqueNumber(String reqUniqueNumber) {
		this.reqUniqueNumber = reqUniqueNumber;
	}

	public Date getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}

	public String getLxnId() {
		return lxnId;
	}

	public void setLxnId(String lxnId) {
		this.lxnId = lxnId;
	}

	public TravelRequisition(Integer id, String empName, Integer empId, String deptName, String tripPurpose,
			String departureDate, String returnDate, String destination, String meansOfTransport, String status,
			String createdBy, Date createdDate, String approveByManager, String approveByLineManager) {
		super();
		this.id = id;
		this.empName = empName;
		this.empId = empId;
		this.deptName = deptName;
		this.tripPurpose = tripPurpose;
		this.departureDate = departureDate;
		this.returnDate = returnDate;
		this.destination = destination;
		this.meansOfTransport = meansOfTransport;
		this.status = status;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.approveByManager = approveByManager;
		this.approveByLineManager = approveByLineManager;
	}

	public TravelRequisition() {

	}

}
