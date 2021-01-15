package com.std.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.std.domain.Criteria;
import com.std.domain.FreeVO;

public interface FreeMapper {
	
	public List<FreeVO> getListWithPaging(Criteria cri); //글 목록 페이징 나누기
	
	public void insertSelectKey(FreeVO free);	//글  등록
	
	public FreeVO read(Long fno);	// 상세 글 조회
	
	public int delete(Long fno);	//글 삭제
	
	public int update(FreeVO free);	//글 수정
	
	public int getTotalCount(Criteria cri);	//총 페이지 수

}
