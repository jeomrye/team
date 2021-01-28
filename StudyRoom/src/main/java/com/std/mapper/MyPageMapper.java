package com.std.mapper;



import java.util.List;

import com.std.domain.CouponDetailVO;
import com.std.domain.CouponVO;
import com.std.domain.Criteria;
import com.std.domain.MemVO;
import com.std.domain.PlaceReplyVO;

public interface MyPageMapper {
	
	
	//페이징처리
	public List<MemVO> getListWithPaging(Criteria cri);
	//총 페이지 수
	public int getTotalCount(Criteria cri);
	
	//쿠폰정보 가져오기
	public List<CouponVO> getCoupon(String userid);

	//내가 쓴 댓글정보 가져오기
	public List<PlaceReplyVO> getwrote(String userid);
	
	
	
	//관리자가 맴버 모두 가져오기
	//public List<MemVO> getList();
		
	public MemVO selectinfo(String userid);
	
	public void deleteinfo(String userid);
	
	public void updateinfo(MemVO vo);
	
	public CouponDetailVO checkusecoupon(int coup);
	
	public void usecoupon(int coup);
	
	
	
	
}
