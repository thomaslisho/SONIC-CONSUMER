package com.punisher.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Student {
	
	private int id;
	@JsonProperty("rollNo")
	private int  rollNo;
	
	@JsonProperty("dept")
	private String dept;
	
	@JsonProperty("name")
	private String name;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRollNo() {
		return rollNo;
	}
	public void setRollNo(int rollNo) {
		this.rollNo = rollNo;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", rollNo=" + rollNo + ", dept=" + dept + "]";
	}
}
