package com.std.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.domain.MemVO;
import com.std.mapper.UserMapper;
@Service
public class MemServiceImpl implements MemService {

	@Autowired
	UserMapper mapper;
	
	@Override
	public void register(MemVO vo) throws Exception {
		mapper.insertMem(vo);

	}

}
