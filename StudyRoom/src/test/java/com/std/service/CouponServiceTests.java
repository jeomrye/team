package com.std.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.std.domain.CouponVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CouponServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private CouponService service;
	
	@Test
	public void testExist() {

		log.info(service);
		assertNotNull(service);
	}
	
	//couponInsertSelectKey를 이용해 나중에 생성된 쿠폰의 번호를 확인 가능
	@Test
	public void testCouponRegister() {
		
		CouponVO coupon = new CouponVO();
		coupon.setCouponName("수정하는 쿠폰");
		coupon.setCouponPrice(20000);
		
		service.couponRegister(coupon);
		
		log.info("생성된 쿠폰의 번호: " + coupon.getCouponNumber());
	}
	
	//모든 쿠폰 목록 불러오기
	@Test
	public void testCoupongetList() {
		
		service.couponGetList().forEach(coupon -> log.info(coupon));
	}

	//쿠폰 조회
	@Test
	public void testCouponGet() {
		
		log.info(service.couponGet(15));
	}
	
	//쿠폰 삭제
	public void testCouponDelete() {
		
		//쿠폰 번호의 존재를 확인하고 테스트
		log.info("REMOVE RESULT : " + service.couponRemove(16));
	}
	
	//쿠폰 수정
	public void testCouponUpdate() {
		
		CouponVO coupon = service.couponGet(7);
		
		if(coupon == null) {
			return;
		}
		
		coupon.setCouponName("두번째 수정 쿠폰");
		log.info("MODIFY RESULT : " + service.couponModify(coupon));
	}
}
