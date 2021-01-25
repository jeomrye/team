package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.std.domain.Criteria;
import com.std.domain.QaReplyPageDTO;
import com.std.domain.QaReplyVO;
import com.std.mapper.QaMapper;
import com.std.mapper.QaReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class QaReplyServiceImpl implements QaReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private QaReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private QaMapper QaMapper;

	@Transactional
	@Override
	public int register(QaReplyVO vo) {
		log.info("register......."+vo);
		return mapper.insert(vo);
	}

	@Override
	public QaReplyVO get(Long rno) {
		log.info("get......"+rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(QaReplyVO vo) {
		log.info("modify......."+vo);
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove....."+rno);
		return mapper.delete(rno);
	}

	@Override
	public List<QaReplyVO> getList(Criteria cri, Long questionNo) {
		log.info("get Reply List of a Board " +questionNo);
		return mapper.getListWithPaging(cri, questionNo);
	}

	@Override
	public QaReplyPageDTO getListPage(Criteria cri, Long questionNo) {
		return new QaReplyPageDTO(mapper.getCountByquestionNo(questionNo), mapper.getListWithPaging(cri, questionNo));
	}

}
