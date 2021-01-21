package com.std.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CouponDetailVO {

	 private String userId;
	 private int couponNumber;
	 private String couponName;
	 private int couponPrice;
	 private int couponUse;
	 private Date couponBuyDate;
	 
}
