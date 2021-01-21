package com.std.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.domain.MemVO;
import com.std.mapper.UserMapper;
@Service
public class MemServiceImpl implements MemService {

	@Autowired
	UserMapper mapper;
	
	//회원가입
	@Override
	public void register(MemVO vo) throws Exception {
		
		mapper.insertMem(vo);

	}

	//아이디 중복검사
	@Override
	public int idCheck(String userid) throws Exception {
		
		return mapper.idCheck(userid);
	}

	@Override
	public int companyNumCheck(String companynumber) throws Exception {
		
		return mapper.companyNumCheck(companynumber);
	}

}