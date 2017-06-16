package com.im.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="house_detail")
public class House {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int id;
	
	@Column(name="home_number")
	String txtHomeNumber;
	
	@Column(name="road_name")
	String txtRoad;
	
	@Column(name="address_number")
	String txtAddress1;
	
	@Column(name="road")
	String txtAddress2;
	
	@Column(name="city")
	String txtAddress3;
	
	@Column(name="city1")
	String txtAddress4;
	
	@Column(name="telephone")
	String txtTelephone;
	
	@Column(name="roof_status")
	String txtroof;
	
	@Column(name="floor_status")
	String txtfloor;
	
	@Column(name="wall_status")
	String txtwall;
	
	@Column(name="flows_status")
	String txtflows;
	
	@Column(name="land")
	String txtland;
	
	@Column(name="landpaper")
	String txtlandpaper;
	
	@Column(name="land_number")
	String txtlandnumber;
	
	@Column(name="land_year")
	String txtlandyear;
	
	@Column(name="water_status")
	String water;
	
	@Column(name="land_area")
	String txtarea;
	
	@Column(name="electricity_status")
	String electricity;
	
	@Column(name="toilet_status")
	String txttoiletstrue;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTxtRoad() {
		return txtRoad;
	}
	public void setTxtRoad(String txtRoad) {
		this.txtRoad = txtRoad;
	}
	public String getTxtAddress1() {
		return txtAddress1;
	}
	public void setTxtAddress1(String txtAddress1) {
		this.txtAddress1 = txtAddress1;
	}
	public String getTxtAddress2() {
		return txtAddress2;
	}
	public void setTxtAddress2(String txtAddress2) {
		this.txtAddress2 = txtAddress2;
	}
	public String getTxtAddress3() {
		return txtAddress3;
	}
	public void setTxtAddress3(String txtAddress3) {
		this.txtAddress3 = txtAddress3;
	}
	public String getTxtAddress4() {
		return txtAddress4;
	}
	public void setTxtAddress4(String txtAddress4) {
		this.txtAddress4 = txtAddress4;
	}
	public String getHome_number() {
		return txtHomeNumber;
	}
	public void setHome_number(String home_number) {
		this.txtHomeNumber = home_number;
	}
	public String getTxtTelephone() {
		return txtTelephone;
	}
	public void setTxtTelephone(String txtTelephone) {
		this.txtTelephone = txtTelephone;
	}
	public String getTxtroof() {
		return txtroof;
	}
	public void setTxtroof(String txtroof) {
		this.txtroof = txtroof;
	}
	public String getTxtfloor() {
		return txtfloor;
	}
	public void setTxtfloor(String txtfloor) {
		this.txtfloor = txtfloor;
	}
	public String getTxtwall() {
		return txtwall;
	}
	public void setTxtwall(String txtwall) {
		this.txtwall = txtwall;
	}
	public String getTxtflows() {
		return txtflows;
	}
	public void setTxtflows(String txtflows) {
		this.txtflows = txtflows;
	}
	public String getTxtland() {
		return txtland;
	}
	public void setTxtland(String txtland) {
		this.txtland = txtland;
	}
	public String getTxtlandpaper() {
		return txtlandpaper;
	}
	public void setTxtlandpaper(String txtlandpaper) {
		this.txtlandpaper = txtlandpaper;
	}
	public String getTxtlandnumber() {
		return txtlandnumber;
	}
	public void setTxtlandnumber(String txtlandnumber) {
		this.txtlandnumber = txtlandnumber;
	}
	public String getTxtlandyear() {
		return txtlandyear;
	}
	public void setTxtlandyear(String txtlandyear) {
		this.txtlandyear = txtlandyear;
	}
	public String getWater() {
		return water;
	}
	public void setWater(String water) {
		this.water = water;
	}
	public String getTxtarea() {
		return txtarea;
	}
	public void setTxtarea(String txtarea) {
		this.txtarea = txtarea;
	}
	public String getElectricity() {
		return electricity;
	}
	public void setElectricity(String electricity) {
		this.electricity = electricity;
	}
	public String getTxttoiletstrue() {
		return txttoiletstrue;
	}
	public void setTxttoiletstrue(String txttoiletstrue) {
		this.txttoiletstrue = txttoiletstrue;
	}

	
	

	
	
	
	

}
