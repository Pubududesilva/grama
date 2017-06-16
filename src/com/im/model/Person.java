package com.im.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="person_detail")
public class Person {
	@GeneratedValue
	@Id
	int id;
	

	
	
	@Column(name="person_sub_no")
	private String personSubNumber;
	
	@Column(name="first_name")
	private String txtfirstName;
	
	@Column(name="relationship")
	private String txtInitial;
	
	@Column(name="id_number")
	private String txtIdNumber;
	
	@Column(name="telephone_number")
	private String txtTelephoneNumber;
	
	@Column(name="generic")
	private String txtGeneric;
	
	@Column(name="birthday")
	private String txtBrithday;
	
	@Column(name="sex")
	private String txtsex;
	
	@Column(name="householder_status")
	private String txtSurname;
	
	@Column(name="name_by_letter")
	private String txtnameByLetter;
	
	@Column(name="passport_number")
	private String txtPasspoertNumber;
	
	@Column(name="email")
	private String txtEmail;
	
	@Column(name="religion")
	private String txtReligion;
	
	@Column(name="birth_distric")
	private String txtBirthDistric;
	
	@Column(name="marage")
	private String txtMarage;

	@Column(name="job_catagory")
	private String txtJobcatagory;

	@Column(name="before_live_distric")
	private String txtBeforeDistric;

	@Column(name="health_status")
	private String txtHealth;

	@Column(name="job_name")
	private String txtJobName;

	@Column(name="reason_for_commin_live")
	private String txtReasonforLive;

	@Column(name="education_catagory")
	private String txtEducationCatagory;

	@Column(name="sinhala_knoledge")
	private String txtSinhalaKnoledge;

	@Column(name="english_knoledge")
	private String txtEnglishKnoledge;

	@Column(name="computer_knoledge")
	private String computerLiteracy;
	

	@Column(name="tamil_knoledge")
	private String txtTamilKnoledge;
	
	@Column(name="family_id")
	private String txtFamilyId;


	public String getTxtFamilyId() {
		return txtFamilyId;
	}


	public void setTxtFamilyId(String txtFamilyId) {
		this.txtFamilyId = txtFamilyId;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}




	public String getPersonSubNumber() {
		return personSubNumber;
	}


	public void setPersonSubNumber(String personSubNumber) {
		this.personSubNumber = personSubNumber;
	}


	public String getTxtfirstName() {
		return txtfirstName;
	}


	public void setTxtfirstName(String txtfirstName) {
		this.txtfirstName = txtfirstName;
	}


	public String getTxtInitial() {
		return txtInitial;
	}


	public void setTxtInitial(String txtInitial) {
		this.txtInitial = txtInitial;
	}


	public String getTxtIdNumber() {
		return txtIdNumber;
	}


	public void setTxtIdNumber(String txtIdNumber) {
		this.txtIdNumber = txtIdNumber;
	}


	public String getTxtTelephoneNumber() {
		return txtTelephoneNumber;
	}


	public void setTxtTelephoneNumber(String txtTelephoneNumber) {
		this.txtTelephoneNumber = txtTelephoneNumber;
	}


	public String getTxtGeneric() {
		return txtGeneric;
	}


	public void setTxtGeneric(String txtGeneric) {
		this.txtGeneric = txtGeneric;
	}


	public String getTxtBrithday() {
		return txtBrithday;
	}


	public void setTxtBrithday(String txtBrithday) {
		this.txtBrithday = txtBrithday;
	}


	public String getTxtsex() {
		return txtsex;
	}


	public void setTxtsex(String txtsex) {
		this.txtsex = txtsex;
	}


	public String getTxtSurname() {
		return txtSurname;
	}


	public void setTxtSurname(String txtSurname) {
		this.txtSurname = txtSurname;
	}


	public String getTxtnameByLetter() {
		return txtnameByLetter;
	}


	public void setTxtnameByLetter(String txtnameByLetter) {
		this.txtnameByLetter = txtnameByLetter;
	}


	public String getTxtPasspoertNumber() {
		return txtPasspoertNumber;
	}


	public void setTxtPasspoertNumber(String txtPasspoertNumber) {
		this.txtPasspoertNumber = txtPasspoertNumber;
	}


	public String getTxtEmail() {
		return txtEmail;
	}


	public void setTxtEmail(String txtEmail) {
		this.txtEmail = txtEmail;
	}


	public String getTxtReligion() {
		return txtReligion;
	}


	public void setTxtReligion(String txtReligion) {
		this.txtReligion = txtReligion;
	}


	public String getTxtBirthDistric() {
		return txtBirthDistric;
	}


	public void setTxtBirthDistric(String txtBirthDistric) {
		this.txtBirthDistric = txtBirthDistric;
	}


	public String getTxtMarage() {
		return txtMarage;
	}


	public void setTxtMarage(String txtMarage) {
		this.txtMarage = txtMarage;
	}


	public String getTxtJobcatagory() {
		return txtJobcatagory;
	}


	public void setTxtJobcatagory(String txtJobcatagory) {
		this.txtJobcatagory = txtJobcatagory;
	}


	public String getTxtBeforeDistric() {
		return txtBeforeDistric;
	}


	public void setTxtBeforeDistric(String txtBeforeDistric) {
		this.txtBeforeDistric = txtBeforeDistric;
	}


	public String getTxtHealth() {
		return txtHealth;
	}


	public void setTxtHealth(String txtHealth) {
		this.txtHealth = txtHealth;
	}


	public String getTxtJobName() {
		return txtJobName;
	}


	public void setTxtJobName(String txtJobName) {
		this.txtJobName = txtJobName;
	}


	public String getTxtReasonforLive() {
		return txtReasonforLive;
	}


	public void setTxtReasonforLive(String txtReasonforLive) {
		this.txtReasonforLive = txtReasonforLive;
	}


	public String getTxtEducationCatagory() {
		return txtEducationCatagory;
	}


	public void setTxtEducationCatagory(String txtEducationCatagory) {
		this.txtEducationCatagory = txtEducationCatagory;
	}


	public String getTxtSinhalaKnoledge() {
		return txtSinhalaKnoledge;
	}


	public void setTxtSinhalaKnoledge(String txtSinhalaKnoledge) {
		this.txtSinhalaKnoledge = txtSinhalaKnoledge;
	}


	public String getTxtEnglishKnoledge() {
		return txtEnglishKnoledge;
	}


	public void setTxtEnglishKnoledge(String txtEnglishKnoledge) {
		this.txtEnglishKnoledge = txtEnglishKnoledge;
	}


	public String getComputerLiteracy() {
		return computerLiteracy;
	}


	public void setComputerLiteracy(String computerLiteracy) {
		this.computerLiteracy = computerLiteracy;
	}


	public String getTxtTamilKnoledge() {
		return txtTamilKnoledge;
	}


	public void setTxtTamilKnoledge(String txtTamilKnoledge) {
		this.txtTamilKnoledge = txtTamilKnoledge;
	}
	

	
	
}
