package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.domain.CouponVO;
import com.std.mapper.CouponMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CouponServiceImpl implements CouponService {

	@Setter(onMethod_ = @Autowired)
	private CouponMapper mapper;
	
	@Override
	public void couponResister(CouponVO coupon) {

		log.info("register...." + coupon);
		
		mapper.couponInsertSelectKey(coupon);
	}

	//ÄíÆù Á¶È¸
	@Override
	public CouponVO couponGet(int couponNumber) {

		log.info("couponGet........" + couponNumber);
		
		return mapper.couponRead(couponNumber);
	}

	//ÄíÆù ¼öÁ¤
	@Override
	public boolean couponModify(CouponVO coupon) {

		log.info("couponModify......" + coupon);
		return mapper.couponUpdate(coupon) == 1;
	}

	//ÄíÆù »èÁ¦
	@Override
	public boolean couponRemove(int couponNumber) {

		log.info("couponRemove...." + couponNumber);
		return mapper.couponDelete(couponNumber) == 1;
	}
	
//ÄíÆù ¸ñ·Ï ÀÛ¾÷
	@Override
	public List<CouponVO> couponGetList() {

		log.info("couponGetList.....");
		
		return mapper.couponGetList();
	}

}
