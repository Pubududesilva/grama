package com.im.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="member_detail")
public class Member {

	@GeneratedValue
	@Id
	int id;
	
	@Column(name="position")
	private String txtposition;
	
	@Column(name="first_name")
	private String txtMemberfirstName;
	
	@Column(name="identity_number")
	private String txtMemberIdentityNumber;
	
	@Column(name="telephone_number")
	private String txtMemberTelephone;
	
	@Column(name="member_address")
	private String txtMemberAddress;
	
	@Column(name="member_address_road")
	private String txtMemberRoad;
	
	@Column(name="member_address_city")
	private String txtMembercity;
	
	@Column(name="member_address_discrict")
	private String txtMemberdiscrict;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTxtposition() {
		return txtposition;
	}

	public void setTxtposition(String txtposition) {
		this.txtposition = txtposition;
	}

	public String getTxtMemberfirstName() {
		return txtMemberfirstName;
	}

	public void setTxtMemberfirstName(String txtMemberfirstName) {
		this.txtMemberfirstName = txtMemberfirstName;
	}

	public String getTxtMemberIdentityNumber() {
		return txtMemberIdentityNumber;
	}

	public void setTxtMemberIdentityNumber(String txtMemberIdentityNumber) {
		this.txtMemberIdentityNumber = txtMemberIdentityNumber;
	}

	public String getTxtMemberTelephone() {
		return txtMemberTelephone;
	}

	public void setTxtMemberTelephone(String txtMemberTelephone) {
		this.txtMemberTelephone = txtMemberTelephone;
	}

	public String getTxtMemberAddress() {
		return txtMemberAddress;
	}

	public void setTxtMemberAddress(String txtMemberAddress) {
		this.txtMemberAddress = txtMemberAddress;
	}

	public String getTxtMemberRoad() {
		return txtMemberRoad;
	}

	public void setTxtMemberRoad(String txtMemberRoad) {
		this.txtMemberRoad = txtMemberRoad;
	}

	public String getTxtMembercity() {
		return txtMembercity;
	}

	public void setTxtMembercity(String txtMembercity) {
		this.txtMembercity = txtMembercity;
	}

	public String getTxtMemberdiscrict() {
		return txtMemberdiscrict;
	}

	public void setTxtMemberdiscrict(String txtMemberdiscrict) {
		this.txtMemberdiscrict = txtMemberdiscrict;
	}
	
	
}

