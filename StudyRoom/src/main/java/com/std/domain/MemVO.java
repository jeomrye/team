package com.std.domain;

import java.util.Date;


public class MemVO {
	private String userid; //회원id
	private int memberno; //회원번호
	private String username; //회원이름
	private String password; //비밀번호
	private String email; //이메일
	private int phone; //전화번호
	private String gender; //성별
	private Date regdate; //회원가입일
	private Date updatedate; //회원정보 수정일
	private int companynumber; //사업자번호
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	public int getCompanynumber() {
		return companynumber;
	}
	public void setCompanynumber(int companynumber) {
		this.companynumber = companynumber;
	}

	
	
}