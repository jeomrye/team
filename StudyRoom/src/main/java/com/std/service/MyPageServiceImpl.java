package com.std.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.std.domain.MemVO;
import com.std.mapper.MyPageMapper;

public class MyPageServiceImpl implements MyPageService {

	@Autowired
	MyPageMapper mapper;
	
	@Override
	public MemVO getinfo(String userid) {
		
		return mapper.selectinfo(userid);
	}

	@Override
	public String removeinfo(String userid) {

		return mapper.deleteinfo(userid);
	}

	@Override
	public boolean modifyinfo(MemVO vo) {

		return mapper.updateinfo(vo) ==1;
	}

}
