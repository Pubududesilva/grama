package com.im.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="socities_detail")
public class Societies {
	@GeneratedValue
	@Id
	int id;
	
	@Column(name="type")
	private String txtorganizationgroup;
	
	@Column(name="name")
	private String txtNameofOrginization;
	
	@Column(name="address")
	private String txtaddressofOrginizationnumber;
	
	@Column(name="road")
	private String txtaddressofOrginizationroad; 	
	
	@Column(name="city")
	private String txtaddressofOrginizationcity;
	
	@Column(name="distric")
	private String txtaddressofOrginizationdistric;
	
	@Column(name="registation_number")
	private String txtRegNumber;
	
	@Column(name="start_date")
	private String txtStartDate;
	
	@Column(name="membership_number")
	private String txtmembershipnumber;
	
	@Column(name="help_type")
	private String txtorganizationhelp;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTxtorganizationgroup() {
		return txtorganizationgroup;
	}

	public void setTxtorganizationgroup(String txtorganizationgroup) {
		this.txtorganizationgroup = txtorganizationgroup;
	}

	public String getTxtNameofOrginization() {
		return txtNameofOrginization;
	}

	public void setTxtNameofOrginization(String txtNameofOrginization) {
		this.txtNameofOrginization = txtNameofOrginization;
	}

	public String getTxtaddressofOrginizationnumber() {
		return txtaddressofOrginizationnumber;
	}

	public void setTxtaddressofOrginizationnumber(String txtaddressofOrginizationnumber) {
		this.txtaddressofOrginizationnumber = txtaddressofOrginizationnumber;
	}

	public String getTxtaddressofOrginizationroad() {
		return txtaddressofOrginizationroad;
	}

	public void setTxtaddressofOrginizationroad(String txtaddressofOrginizationroad) {
		this.txtaddressofOrginizationroad = txtaddressofOrginizationroad;
	}

	public String getTxtaddressofOrginizationcity() {
		return txtaddressofOrginizationcity;
	}

	public void setTxtaddressofOrginizationcity(String txtaddressofOrginizationcity) {
		this.txtaddressofOrginizationcity = txtaddressofOrginizationcity;
	}

	public String getTxtaddressofOrginizationdistric() {
		return txtaddressofOrginizationdistric;
	}

	public void setTxtaddressofOrginizationdistric(String txtaddressofOrginizationdistric) {
		this.txtaddressofOrginizationdistric = txtaddressofOrginizationdistric;
	}

	public String getTxtRegNumber() {
		return txtRegNumber;
	}

	public void setTxtRegNumber(String txtRegNumber) {
		this.txtRegNumber = txtRegNumber;
	}

	public String getTxtStartDate() {
		return txtStartDate;
	}

	public void setTxtStartDate(String txtStartDate) {
		this.txtStartDate = txtStartDate;
	}

	public String getTxtmembershipnumber() {
		return txtmembershipnumber;
	}

	public void setTxtmembershipnumber(String txtmembershipnumber) {
		this.txtmembershipnumber = txtmembershipnumber;
	}

	public String getTxtorganizationhelp() {
		return txtorganizationhelp;
	}

	public void setTxtorganizationhelp(String txtorganizationhelp) {
		this.txtorganizationhelp = txtorganizationhelp;
	}
	
	
	
}
