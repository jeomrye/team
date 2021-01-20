package com.std.service;


import javax.servlet.http.HttpServletResponse;

import com.std.domain.AuthVO;
import com.std.domain.MemVO;

public interface MemService {
	//회원가입
	public void register(MemVO vo)throws Exception;
	
	//권한주기
	public void auth(AuthVO avo) throws Exception;
	
	//아이디 중복검사
	public int idCheck(String userid) throws Exception;
	
	//사업자 등록번호 검사
	public int companyNumCheck(String companynumber)throws Exception;
	
	//아이디 찾기
	public String findId(HttpServletResponse response,String username,String email) throws Exception;
}
