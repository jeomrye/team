package com.std.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private int uno;
	private String userid;
	private int memberNo;
	private String username;
	private String password;
	private String email;
	private int phone;
	private String gender;
	private int mileage;
	private String coupon;
	private Date regdate;
	private Date updatedate;
	private int companynumber;
}
