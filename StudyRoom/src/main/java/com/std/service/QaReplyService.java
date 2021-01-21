package com.std.service;

import java.util.List;

import com.std.domain.Criteria;
import com.std.domain.QaReplyPageDTO;
import com.std.domain.QaReplyVO;

public interface QaReplyService {

	public int register(QaReplyVO vo); //작성
	
	public QaReplyVO get(Long rno); //상세보기
	
	public int modify(QaReplyVO vo); //수정
	
	public int remove(Long rno); //삭제
	
	public List<QaReplyVO> getList(Criteria cri, Long questionNo); //댓글리스트
	
	public QaReplyPageDTO getListPage(Criteria cri, Long questionNo);
}
