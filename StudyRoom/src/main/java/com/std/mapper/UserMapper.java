package com.std.mapper;

import com.std.domain.MemVO;

public interface UserMapper {
	
	//회원가입
	public void insertMem(MemVO vo)throws Exception; 
	
	//아이디 중복검사
	public int idCheck(String userid);
	
	
}
