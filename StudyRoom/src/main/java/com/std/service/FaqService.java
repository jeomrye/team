package com.std.service;

import java.util.List;

import com.std.domain.Criteria;
import com.std.domain.FaqVO;

public interface FaqService {
	
	public void register(FaqVO faq); //insert 등록
	
	public FaqVO get(Long faqNo); //select

	public boolean modify(FaqVO faq); //update 수정
	
	public boolean delete(Long faqNo); //select 삭제

	public List<FaqVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

}