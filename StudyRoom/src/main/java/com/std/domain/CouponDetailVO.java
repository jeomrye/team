package com.std.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CouponDetailVO {

	 private String userid;
	 private int couponnumber;
	 private String couponName;
	 private int couponprice;
	 private int couponuse;
	 private Date couponbuydate;
	 
	 private List<AuthVO> authList;
	 
}
