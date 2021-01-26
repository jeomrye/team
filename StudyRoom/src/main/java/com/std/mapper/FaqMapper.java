package com.std.mapper;

import java.util.List;

import com.std.domain.Criteria;
import com.std.domain.FaqVO;

public interface FaqMapper {

	public List<FaqVO> getList();
	
	public List<FaqVO> getListWithPaging(Criteria cri);

	//public void insert(FaqVO faq);
	
	public void insertSelectKey(FaqVO faq);

	public FaqVO read(Long faqNo);
	
	public int delete(Long faqNo);	
	
	public int update(FaqVO faq);
	
	public int getTotalCount(Criteria cri);
}
