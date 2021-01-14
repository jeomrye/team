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
	public void couponRegister(CouponVO coupon) {

		log.info("register...." + coupon);
		
		mapper.couponInsertSelectKey(coupon);
	}

	//���� ��ȸ
	@Override
	public CouponVO couponGet(int couponNumber) {

		log.info("couponGet........" + couponNumber);
		
		return mapper.couponRead(couponNumber);
	}

	//���� ����
	@Override
	public boolean couponModify(CouponVO coupon) {

		log.info("couponModify......" + coupon);
		return mapper.couponUpdate(coupon) == 1;
	}

	//���� ����
	@Override
	public boolean couponRemove(int couponNumber) {

		log.info("couponRemove...." + couponNumber);
		return mapper.couponDelete(couponNumber) == 1;
	}
	
//���� ��� �۾�
	@Override
	public List<CouponVO> couponGetList() {

		log.info("couponGetList.....");
		
		return mapper.couponGetList();
	}

}
