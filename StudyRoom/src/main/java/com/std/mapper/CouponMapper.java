package com.std.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.std.domain.CouponVO;

public interface CouponMapper {

	//@Select("select * from coupon where couponNumber > 0")  ���� ����Ʈ ��������
	public List<CouponVO> couponGetList();
	
	
	//insert���� ó���ǰ� ������ PK���� �� �ʿ䰡 ���� ���
	public void couponInsert(CouponVO coupon);
	//insert���� ����ǰ� ������ PK���� �˾ƾ� �ϴ� ���
	public void couponInsertSelectKey(CouponVO coupon);
	
	//insert�� �� �����͸� ��ȸ�ϴ� ���
	public CouponVO couponRead(int couponNumber);
	
    //���� ���� delete
	public int couponDelete(int couponNumber);
	
	//�������� update
	public int couponUpdate(CouponVO coupon);
}
