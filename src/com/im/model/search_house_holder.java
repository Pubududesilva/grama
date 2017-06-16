package com.im.model;

import javax.persistence.Entity;

@Entity
public class search_house_holder {
	public String home_sub_number;
	public String first_name;
	public String id_number;
	public String road_name;
	
	public String getHome_sub_number() {
		return home_sub_number;
	}
	public void setHome_sub_number(String home_sub_number) {
		this.home_sub_number = home_sub_number;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getId_number() {
		return id_number;
	}
	public void setId_number(String id_number) {
		this.id_number = id_number;
	}
	public String getRoad_name() {
		return road_name;
	}
	public void setRoad_name(String road_name) {
		this.road_name = road_name;
	}
	
	

}
