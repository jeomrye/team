package com.std.service;

import com.std.domain.MemVO;

public interface MyPageService {
	
	public MemVO getinfo(String userid);
	
	public String removeinfo(String userid);
	
	public boolean modifyinfo(MemVO vo);
}
