package com.std.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.std.domain.CouponVO;
import com.std.domain.Criteria;

public interface CouponMapper {

	//@Select("select * from coupon where couponNumber > 0")  쿠폰 리스트 가져오기
	public List<CouponVO> couponGetList();
	
	public List<CouponVO> getListWithPaging(Criteria cri);	
	
	//insert문만 처리되고 생성된 PK값을 알 필요가 없는 경우
	public void couponInsert(CouponVO coupon);
	
	//insert문이 실행되고 생성된 PK값을 알아야 하는 경우
	public Integer couponInsertSelectKey(CouponVO coupon);
	
	//insert가 된 테이터를 조회하는 경우
	public CouponVO couponRead(int couponNumber);
	
    //쿠폰 삭제 delete
	public int couponDelete(int couponNumber);
	
	//쿠폰수정 update
	public int couponUpdate(CouponVO coupon);
	
	public int getTotalCount(Criteria cri);
}