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
	
//	���� ����Ʈ ��������
	@Test
	public void testGetList() {
		mapper.couponGetList().forEach(goods -> log.info(goods));
	}

//	insert���� ó���ǰ� ������ PK���� �� �ʿ䰡 ���� ���
	@Test
	public void testInsert() {
		
		CouponVO coupon = new CouponVO();
		coupon.setCouponName("�׽�Ʈ����");
		coupon.setCouponPrice(8000);
		
		mapper.couponInsert(coupon);
		
		log.info(coupon);
	}
	
//	insert���� ����ǰ� ������ PK���� �˾ƾ� �ϴ� ���
	@Test
	public void testInsertSelectKey() {
		
		CouponVO coupon = new CouponVO();
		coupon.setCouponName("�׽�Ʈ���� select key");
		coupon.setCouponPrice(10000);
		
		mapper.couponInsertSelectKey(coupon);
		
		log.info(coupon);
	}
	
//	insert�� �� �����͸� ��ȸ�ϴ� ���
	@Test
	public void testRead() {
//		�����ϴ� ���� ��ȣ�� �׽�Ʈ
		CouponVO coupon = mapper.couponRead(2);
		
		log.info(coupon);
	}
	
	
	//���� ���� delete
	@Test
	public void testDelete() {
		
		log.info("DELETE COUNT: " + mapper.couponDelete(4));
	}
	
//	���� ���� update
	@Test
	public void testUpdate() {
		
		CouponVO coupon = new CouponVO();
		//������ �ִ� ������ȣ���� Ȯ��
		coupon.setCouponNumber(9);
		coupon.setCouponName("����������");
		coupon.setCouponPrice(15000);
		
		int count = mapper.couponUpdate(coupon);
		log.info("UPDATE COUNT: " + count);
	}
	
}
