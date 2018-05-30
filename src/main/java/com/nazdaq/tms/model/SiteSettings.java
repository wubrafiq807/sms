package com.nazdaq.tms.model;

import javax.lang.model.element.Name;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="site_settings")
public class SiteSettings {

@Id
@GeneratedValue(strategy=GenerationType.AUTO)
@Column(name="id")
private int id;
@Column(name="type")
private int type;
@Column(name="value")
private String value;
public SiteSettings() {
	// TODO Auto-generated constructor stub
}
public SiteSettings(int id, int type, String value) {
	super();
	this.id = id;
	this.type = type;
	this.value = value;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getType() {
	return type;
}
public void setType(int type) {
	this.type = type;
}
public String getValue() {
	return value;
}
public void setValue(String value) {
	this.value = value;
}

}
