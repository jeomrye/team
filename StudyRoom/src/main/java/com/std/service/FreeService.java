package com.std.service;

import java.util.List;

import com.std.domain.FreeVO;

public interface FreeService {

	public void register(FreeVO free);
	
	public FreeVO get(Long fno);
	
	public boolean modify(FreeVO free);
	
	public boolean remove(Long fno);
	
	public List<FreeVO> getList();
}
