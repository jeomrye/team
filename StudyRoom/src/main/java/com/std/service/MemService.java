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
	public String findId(HttpServletResponse response,String email) throws Exception;
	
	//비밀번호 찾기
	public void findPw(HttpServletResponse response,MemVO vo) throws Exception;
	
	//임시 비밀번호 이메일발송
	public void sendEmail(MemVO vo,String div) throws Exception;
	
}
