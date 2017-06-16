package com.im.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="family_detail")
public class Family {
	
	@GeneratedValue
	@Id
	int id;
	@Column(name="home_sub_number")
	private String homeSubNumber;
	
	@Column(name="salarary_detail")
	private String salararyDetail;
	
	@Column(name="samurdi_account")
	private String samurdi_account;
	
	@Column(name="people_donation")
	private String people_donation;
	
	@Column(name="people_account")
	private String people_account;
	
	@Column(name="education_donation")
	private String education_donation;
	
	@Column(name="education_account")
	private String education_account;
	
	@Column(name="samurdi_donation")
	private String samurdi_donation;
	
	@Column(name="home_number")
	private String homeNumber;

	public String getHomeNumber() {
		return homeNumber;
	}

	public void setHomeNumber(String homeNumber) {
		this.homeNumber = homeNumber;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getHomeSubNumber() {
		return homeSubNumber;
	}

	public void setHomeSubNumber(String homeSubNumber) {
		this.homeSubNumber = homeSubNumber;
	}

	public String getSalararyDetail() {
		return salararyDetail;
	}

	public void setSalararyDetail(String salararyDetail) {
		this.salararyDetail = salararyDetail;
	}

	public String getSamurdi_account() {
		return samurdi_account;
	}

	public void setSamurdi_account(String samurdi_account) {
		this.samurdi_account = samurdi_account;
	}

	public String getPeople_donation() {
		return people_donation;
	}

	public void setPeople_donation(String people_donation) {
		this.people_donation = people_donation;
	}

	public String getPeople_account() {
		return people_account;
	}

	public void setPeople_account(String people_account) {
		this.people_account = people_account;
	}

	public String getEducation_donation() {
		return education_donation;
	}

	public void setEducation_donation(String education_donation) {
		this.education_donation = education_donation;
	}

	public String getEducation_account() {
		return education_account;
	}

	public void setEducation_account(String education_account) {
		this.education_account = education_account;
	}

	public String getSamurdi_donation() {
		return samurdi_donation;
	}

	public void setSamurdi_donation(String samurdi_donation) {
		this.samurdi_donation = samurdi_donation;
	}
	
	
	
	

}
