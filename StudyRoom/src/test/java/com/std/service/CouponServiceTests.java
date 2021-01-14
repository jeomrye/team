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
	
	//couponInsertSelectKey�� �̿��� ���߿� ������ ������ ��ȣ�� Ȯ�� ����
	@Test
	public void testCouponRegister() {
		
		CouponVO coupon = new CouponVO();
		coupon.setCouponName("�����ϴ� ����");
		coupon.setCouponPrice("20000");
		
		service.couponRegister(coupon);
		
		log.info("������ ������ ��ȣ: " + coupon.getCouponNumber());
	}
	
	//��� ���� ��� �ҷ�����
	@Test
	public void testCoupongetList() {
		
		service.couponGetList().forEach(coupon -> log.info(coupon));
	}

	//���� ��ȸ
	@Test
	public void testCouponGet() {
		
		log.info(service.couponGet(15));
	}
	
	//���� ����
	public void testCouponDelete() {
		
		//���� ��ȣ�� ���縦 Ȯ���ϰ� �׽�Ʈ
		log.info("REMOVE RESULT : " + service.couponRemove(16));
	}
	
	//���� ����
	public void testCouponUpdate() {
		
		CouponVO coupon = service.couponGet(7);
		
		if(coupon == null) {
			return;
		}
		
		coupon.setCouponName("�ι�° ���� ����");
		log.info("MODIFY RESULT : " + service.couponModify(coupon));
	}
}
