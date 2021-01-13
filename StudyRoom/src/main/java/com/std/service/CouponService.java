package com.std.service;

import java.util.List;

import com.std.domain.CouponVO;

public interface CouponService {

	public void couponResister(CouponVO coupon);
	
	public CouponVO couponGet(int couponNumber);
	
	public boolean couponModify(CouponVO coupon);
	
	public boolean couponRemove(int couponNumber);
	
	public List<CouponVO> couponGetList();
}
