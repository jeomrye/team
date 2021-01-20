package com.std.service;

import java.util.List;

import com.std.domain.Criteria;
import com.std.domain.FreeVO;

public interface FreeService {

	public void register(FreeVO free);	// 글 등록
	
	public FreeVO get(Long fno);	// 상세 글 조회
	
	public boolean modify(FreeVO free);	//글 수정
	
	public boolean remove(Long fno);	//글 삭제
	
	public List<FreeVO> getList(Criteria cri);	// 글 리스트 
	
	public int getTotal(Criteria cri);	//총 페이지 
}
