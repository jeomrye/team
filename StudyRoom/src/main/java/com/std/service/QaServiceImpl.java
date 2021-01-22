package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.domain.Criteria;
import com.std.domain.QaVO;
import com.std.mapper.QaMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QaServiceImpl implements QaService {

	@Setter(onMethod_ = @Autowired)
	private QaMapper mapper;

	@Override
	public void questionRegi(QaVO qa) {
		log.info("QaRegister...." + qa);
		mapper.insertSelectKey(qa);
		
	}

	@Override
	public QaVO get(Long questionNo) {
		log.info("get....." + questionNo);
		return mapper.read(questionNo);
	}

	@Override
	public boolean questionModi(QaVO qa) {
		log.info("modify........"+qa);
		return mapper.update(qa) == 1;
	}

	@Override
	public boolean questionDel(Long questionNo) {
		log.info("remove........"+questionNo);
		return mapper.delete(questionNo) == 1;
	}

	@Override
	public List<QaVO> getList(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	
	
	
}
