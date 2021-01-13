package com.std.mapper;

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
public class CouponMapperTests {

	@Setter(onMethod_ = @Autowired)
	private CouponMapper mapper;
	
//	쿠폰 리스트 가져오기
	@Test
	public void testGetList() {
		mapper.couponGetList().forEach(goods -> log.info(goods));
	}

//	insert문만 처리되고 생성된 PK값을 알 필요가 없는 경우
	@Test
	public void testInsert() {
		
		CouponVO coupon = new CouponVO();
		coupon.setCouponName("테스트쿠폰");
		coupon.setCouponPrice(8000);
		
		mapper.couponInsert(coupon);
		
		log.info(coupon);
	}
	
//	insert문이 실행되고 생성된 PK값을 알아야 하는 경우
	@Test
	public void testInsertSelectKey() {
		
		CouponVO coupon = new CouponVO();
		coupon.setCouponName("테스트쿠폰 select key");
		coupon.setCouponPrice(10000);
		
		mapper.couponInsertSelectKey(coupon);
		
		log.info(coupon);
	}
	
//	insert가 된 테이터를 조회하는 경우
	@Test
	public void testRead() {
//		존재하는 쿠폰 번호로 테스트
		CouponVO coupon = mapper.couponRead(2);
		
		log.info(coupon);
	}
	
	
	//쿠폰 삭제 delete
	@Test
	public void testDelete() {
		
		log.info("DELETE COUNT: " + mapper.couponDelete(4));
	}
	
//	쿠폰 수정 update
	@Test
	public void testUpdate() {
		
		CouponVO coupon = new CouponVO();
		//실행전 있는 쿠폰번호인지 확인
		coupon.setCouponNumber(9);
		coupon.setCouponName("수정된쿠폰");
		coupon.setCouponPrice(15000);
		
		int count = mapper.couponUpdate(coupon);
		log.info("UPDATE COUNT: " + count);
	}
	
}
