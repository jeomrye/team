package com.std.service;

import java.util.List;

import com.std.domain.CouponDetailVO;
import com.std.domain.CouponVO;
import com.std.domain.Criteria;
import com.std.domain.MemVO;
import com.std.domain.PlaceReplyVO;


public interface MyPageService {
	
	
	//페이징처리 회원정보
	public List<MemVO> getList(Criteria cri);
	//관리자가 회원정보 모두 가져오기
	//public List<MemVO>getList();
	//총 페이지
	public int getTotal(Criteria cri);
	
	//쿠폰페이지 가져오기
	public List<CouponVO>getCoupon(String userid);
	
	//내가쓴 댓글 가져오기
	public List<PlaceReplyVO>getwrote(String userid);
	
	
	//회원 정보 가져오기
	public MemVO getinfo(String userid);
	//회원 정보 변경하기
	public void modifyinfo(MemVO vo);
	//회원 정보 삭제
	public void removeinfo(String userid);
	
	public CouponDetailVO checkusecoupon(int coup);
	
	public void usecoupon(int coup);
	
}
