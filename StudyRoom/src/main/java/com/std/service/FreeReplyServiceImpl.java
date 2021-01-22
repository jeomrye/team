package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.std.domain.Criteria;
import com.std.domain.FreeReplyPageDTO;
import com.std.domain.FreeReplyVO;
import com.std.mapper.FreeMapper;
import com.std.mapper.FreeReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FreeReplyServiceImpl implements FreeReplyService {

	@Setter(onMethod_ = @Autowired)
	private FreeReplyMapper mapper;
	
	//484 트랜잭션 처리
	@Setter(onMethod_ = @Autowired)
	private FreeMapper FreeMapper;
	
	@Transactional
	@Override
	public int register(FreeReplyVO vo) {
		log.info("register......."+vo);
		return mapper.insert(vo);
	}

	@Override
	public FreeReplyVO get(Long rno) {
		log.info("get......"+rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(FreeReplyVO vo) {
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
	public List<FreeReplyVO> getList(Criteria cri, Long fno) {
		log.info("get Reply List of a Board " +fno);
		return mapper.getListWithPaging(cri, fno);
	}

	@Override
	public FreeReplyPageDTO getListPage(Criteria cri, Long fno) {
		return new FreeReplyPageDTO(mapper.getCountByFno(fno), mapper.getListWithPaging(cri, fno));
	}

}
