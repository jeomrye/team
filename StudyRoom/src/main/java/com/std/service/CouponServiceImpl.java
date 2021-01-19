package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.std.domain.CouponVO;
import com.std.mapper.CouponAttachMapper;
import com.std.mapper.CouponMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CouponServiceImpl implements CouponService {

	@Setter(onMethod_ = @Autowired)
	private CouponMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private CouponAttachMapper attachMapper;
	
	@Transactional
	@Override
	public void couponRegister(CouponVO coupon) {

		log.info("register...." + coupon);
		
		mapper.couponInsertSelectKey(coupon);
		
		if(coupon.getAttachList() == null || coupon.getAttachList().size() <= 0) {
			return;
		}
		
		coupon.getAttachList().forEach(attach ->{
			attach.setCouponNumber(coupon.getCouponNumber());
			attachMapper.insert(attach);
		});
	}

	//쿠폰 조회
	@Override
	public CouponVO couponGet(int couponNumber) {

		log.info("couponGet........" + couponNumber);
		
		return mapper.couponRead(couponNumber);
	}

	//쿠폰 수정
	@Override
	public boolean couponModify(CouponVO coupon) {

		log.info("couponModify......" + coupon);
		return mapper.couponUpdate(coupon) == 1;
	}

	//쿠폰 삭제
	@Override
	public boolean couponRemove(int couponNumber) {

		log.info("couponRemove...." + couponNumber);
		return mapper.couponDelete(couponNumber) == 1;
	}
	
//쿠폰 목록 작업
	@Override
	public List<CouponVO> couponGetList() {

		log.info("couponGetList.....");
		
		return mapper.couponGetList();
	}

}
