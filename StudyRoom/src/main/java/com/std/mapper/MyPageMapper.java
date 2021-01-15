package com.std.mapper;



import com.std.domain.MemVO;

public interface MyPageMapper {
	
	public MemVO selectinfo(String userid);
	
	public String deleteinfo(String userid);
	
	public int updateinfo(MemVO vo);
}
