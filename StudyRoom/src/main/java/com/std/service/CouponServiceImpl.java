package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.std.domain.AuthVO;
import com.std.domain.CouponAttachVO;
import com.std.domain.CouponDetailVO;
import com.std.domain.CouponVO;
import com.std.domain.Criteria;
import com.std.domain.MemVO;
import com.std.mapper.CouponAttachMapper;
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
	
	@Setter(onMethod_ = @Autowired)
	private CouponAttachMapper attachMapper;
	
	
//	
//	@Override
//	public void couponRegDetail(CouponDetailVO couponDetail) {
//
//		log.info("couponRegDetail...." + couponDetail);
//		mapper.couponRegDetail(couponDetail);
//		
//	}
	
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
	
	@Override
	public List<CouponAttachVO> getAttachList(int couponNumber){
		
		log.info("get Attach list by couponNumber");
		
		return attachMapper.findByCouponNumber(couponNumber);
	}

	//쿠폰 조회
	@Override
	public CouponVO couponGet(int couponNumber) {

		log.info("couponGet........" + couponNumber);
		
		return mapper.couponRead(couponNumber);
	}

	//쿠폰 수정
	@Transactional
	@Override
	public boolean couponModify(CouponVO coupon) {

		log.info("couponModify......" + coupon);
		
		attachMapper.deleteAll(coupon.getCouponNumber());
		
		boolean modifyResult = mapper.couponUpdate(coupon) == 1;
		
		if(modifyResult && coupon.getAttachList() != null && coupon.getAttachList().size() > 0) {
			
			coupon.getAttachList().forEach(attach -> {
				
				attach.setCouponNumber(coupon.getCouponNumber());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}

	//쿠폰 삭제
	@Transactional
	@Override
	public boolean couponRemove(int couponNumber) {

		log.info("couponRemove...." + couponNumber);
		
		attachMapper.deleteAll(couponNumber);
		
		return mapper.couponDelete(couponNumber) == 1;
	}
	
//쿠폰 목록 작업
//	@Override
//	public List<CouponVO> couponGetList() {
//
//		log.info("couponGetList.....");
//		
//		return mapper.couponGetList();
//	}
	@Override
	public List<CouponVO> couponGetList(Criteria cri){
		
		log.info("get List with criteria: " + cri);
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		log.info("get total count");
		
		return mapper.getTotalCount(cri);
	}
	//내가 산 쿠폰확인
	@Override
	public List<CouponDetailVO> couponGetDetail(String userId) {
		
		log.info("couponGetDetail....." + userId);	
		return mapper.couponGetDetail(userId);
	}
	//쿠폰 구매하기
	@Override
	public void couponDetailRegister(CouponDetailVO vo) {
		log.info("couponBuy: "+vo);
		
		mapper.couponDetailInsert(vo);
	}

	@Override
	public MemVO mileGet(String userid) {
		log.info("mileGet: "+userid);
		
		return mapper.mileGet(userid);
	}

	@Override
	public AuthVO authGet(String userid) {
		log.info("authGet: "+userid);
		return mapper.authGet(userid);
	}

	@Override
	public CouponVO Getcoupon(int couponNumber) {
		log.info("Getcoupon"+couponNumber);
		return mapper.Getcoupon(couponNumber);
	}

	//맴버테이블에서 모든것 가져오기
	@Override
	public List<MemVO> getList() {
		log.info("getList");
		return mapper.getList();
	}

	@Override
	public void mileage(MemVO vo) {
		mapper.mileage(vo);
	}


	


	

	
	
}
