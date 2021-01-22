package com.std.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CouponVO {
	private String couponnumber;
	private String couponname;
	private Long couponprice;
	private char couponuse;
	private Date couponbuydate;
	private Date couponrefunddate;
	private String userid;
}
