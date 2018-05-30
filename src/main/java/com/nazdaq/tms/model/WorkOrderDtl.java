package com.nazdaq.tms.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Value;

@Entity
@Table(name = "work_order_dtl")

public class WorkOrderDtl implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;
	@Column(name = "work_order_mst_id")
	private int workOrderMstId;
	@Column(name = "reagent_id")
	private int reagentId;
	@Column(name = "quantity")
	private int quantity;
	@Column(name = "serial_no")
	private String serialNo;

	public WorkOrderDtl() {
		// TODO Auto-generated constructor stub
	}

	public WorkOrderDtl(Integer id, int workOrderMstId, int reagentId, int quantity, String serialNo) {
		super();
		this.id = id;
		this.workOrderMstId = workOrderMstId;
		this.reagentId = reagentId;
		this.quantity = quantity;
		this.serialNo = serialNo;
	}

	public String getSerialNo() {
		return serialNo;
	}

	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getWorkOrderMstId() {
		return workOrderMstId;
	}

	public void setWorkOrderMstId(int workOrderMstId) {
		this.workOrderMstId = workOrderMstId;
	}

	public int getReagentId() {
		return reagentId;
	}

	public void setReagentId(int reagentId) {
		this.reagentId = reagentId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
