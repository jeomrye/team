package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.domain.CouponDetailVO;
import com.std.domain.CouponVO;
import com.std.domain.Criteria;
import com.std.domain.MemVO;
import com.std.domain.PlaceReplyVO;
import com.std.mapper.MyPageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MyPageServiceImpl implements MyPageService {

	@Setter(onMethod_ = @Autowired)
	MyPageMapper mapper;
	
	
	@Override
	public List<MemVO> getList(Criteria cri) {
		log.info("get List With Criteria : "+cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public List<CouponVO> getCoupon(String userid) {
		log.info("getCoupon");
		return mapper.getCoupon(userid);
	}
	@Override
	public List<PlaceReplyVO> getwrote(String userid) {
		log.info("get i wrote reply");
		return mapper.getwrote(userid);
	}
	
	
	
	@Override
	public MemVO getinfo(String userid) {
		log.info("get"+userid);
		return mapper.selectinfo(userid);
	}

	@Override
	public void modifyinfo(MemVO vo) {
		log.info("modify"+vo);
		mapper.updateinfo(vo);
		
	}

	@Override
	public void removeinfo(String userid) {
		log.info("remove"+userid);
		mapper.deleteinfo(userid);
	}

	@Override
	public CouponDetailVO checkusecoupon(int coup) {
		log.info("couponcheck"+coup);
		return mapper.checkusecoupon(coup);
	}

	@Override
	public void usecoupon(int coup) {
		mapper.usecoupon(coup);
		
	}

	

	

	

	

	
	



}
