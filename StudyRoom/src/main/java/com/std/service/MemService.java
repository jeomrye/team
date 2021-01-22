package com.std.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.std.domain.Criteria;
import com.std.domain.MemVO;

@Service
public interface MemService {
	
	
	//회원가입
	public void register(MemVO vo)throws Exception;
	
	//아이디 중복검사
	public int idCheck(String userid) throws Exception;
	
	//사업자 등록번호 검사
	public int companyNumCheck(String companynumber)throws Exception;
}
