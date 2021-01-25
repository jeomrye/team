package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.domain.Criteria;
import com.std.domain.FaqVO;
import com.std.mapper.FaqMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FaqServiceImpl implements FaqService {

	@Setter(onMethod_ = @Autowired)
	private FaqMapper mapper;

	@Override
	public void register(FaqVO faq) {
		log.info("register..........."+faq);
		mapper.insertSelectKey(faq);
	}

	@Override
	public FaqVO get(Long faqNo) {
		log.info("get........."+faqNo);
		return mapper.read(faqNo);
	}

	@Override
	public boolean modify(FaqVO faq) {
		log.info("modify........."+ faq);
		return mapper.update(faq)==1;
	}

	@Override
	public boolean delete(Long faqNo) {
		log.info("remove........."+ faqNo);
		return mapper.delete(faqNo) == 1;
	}

	@Override
	public List<FaqVO> getList(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {

		return mapper.getTotalCount(cri);
	}

	

}