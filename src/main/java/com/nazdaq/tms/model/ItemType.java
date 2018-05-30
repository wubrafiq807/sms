package com.nazdaq.tms.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="ItemType")
public class ItemType implements Serializable {

private static final long serialVersionUID = -723583058586873479L;	
	
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
@Column(name = "id")	
private Integer	id;

@Column(name="name")
private String name;


public Integer getId() {
	return id;
}

public void setId(Integer id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

}
