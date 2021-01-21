package com.std.service;

import java.util.List;

import com.std.domain.CouponAttachVO;
import com.std.domain.CouponDetailVO;
import com.std.domain.CouponVO;
import com.std.domain.Criteria;

public interface CouponService {

	public void couponRegister(CouponVO coupon);
	
	public CouponVO couponGet(int couponNumber);
	
	public boolean couponModify(CouponVO coupon);
	
	public boolean couponRemove(int couponNumber);
	
	//public List<CouponVO> couponGetList();
	
	public List<CouponVO> couponGetList(Criteria cri);
	
	public List<CouponAttachVO> getAttachList(int couponNumber);
	
	public int getTotal(Criteria cri);
	//내가 산 쿠폰확인
	public List<CouponDetailVO> couponGetDetail(String userId);
	
	//쿠폰 구매하기
	public void couponDetailRegister(CouponDetailVO vo);
//	
//	public void couponRegDetail(CouponDetailVO couponDetail);
	
	
}
