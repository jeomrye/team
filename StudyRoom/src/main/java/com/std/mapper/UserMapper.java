package com.std.mapper;


import com.std.domain.AuthVO;
import com.std.domain.MemVO;

public interface UserMapper {
	
	//회원가입
	public void insertMem(MemVO vo)throws Exception; 
	
	//권한주기
	public void insertAuth(AuthVO avo);
	
	//아이디 중복검사
	public int idCheck(String userid)throws Exception;
	
	//사업자 등록검사
	public int companyNumCheck(String companynumber)throws Exception;
	
	//userid 불러오기
	public MemVO read(String userid);
	
	//아이디 찾기
	public String findId(String email,String username) throws Exception;
}
