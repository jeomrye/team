package com.std.mapper;

import java.util.List;

import com.std.domain.CouponAttachVO;

public interface CouponAttachMapper {

	public void insert(CouponAttachVO vo);
	
	public void delete(String uuid);
	
	public List<CouponAttachVO> findByCouponNumber(int couponNumber);
	
	public void deleteAll(int couponNumber);
}
