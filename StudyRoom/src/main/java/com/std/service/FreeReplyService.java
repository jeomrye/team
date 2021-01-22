package com.std.service;

import java.util.List;

import com.std.domain.Criteria;
import com.std.domain.FreeReplyPageDTO;
import com.std.domain.FreeReplyVO;

public interface FreeReplyService {

	public int register(FreeReplyVO vo);	//등록
	
	public FreeReplyVO get(Long rno);	//상세
	
	public int modify(FreeReplyVO vo);	//수정
	
	public int remove(Long rno);	//삭제
	
	public List<FreeReplyVO> getList(Criteria cri , Long fno);	//댓글 리스트
	
	public FreeReplyPageDTO getListPage(Criteria cri, Long fno);	//댓글 수
}
