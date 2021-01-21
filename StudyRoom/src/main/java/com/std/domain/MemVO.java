package com.std.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private Long uno;	//회원순번
	private String userid; //회원id
	private int memberno; //회원번호
	private String username; //회원이름
	private String password; //비밀번호
	private String email; //이메일
	private String phone; //전화번호
	private String gender; //성별
	private Date regdate; //회원가입일
	private Date updatedate; //회원정보 수정일
	private int mileage;	//마일리지
	private String coupon; //쿠폰번호
	private int companynumber; //사업자번호
	private List<AuthVO> authList;		

}