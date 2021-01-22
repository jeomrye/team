package com.std.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class CouponVO {

	private int couponNumber;
	private String couponName;
	private int couponPrice;
	private int couponUse;
	private Date couponregDate;
	private Date couponupdateDate;
	
	private List<CouponAttachVO> attachList;
	
}
