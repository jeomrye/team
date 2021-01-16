package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.std.domain.Criteria;
import com.std.domain.PlaceReVO;
import com.std.domain.ReplyPageDTO;
import com.std.mapper.PlaceMapper;
import com.std.mapper.PlaceReMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PlaceReServiceImpl implements PlaceReService {
	
	@Setter(onMethod_ = @Autowired)
	private PlaceReMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PlaceMapper placeMapper;
	
	//@Transactional //오류 발생시 rollback
	@Override
	public int register(PlaceReVO placeRe) { //댓글 등록
		log.info("register reply : "+placeRe);
		placeMapper.updateReplyCnt(placeRe.getBno(), 1); //댓글 수 증가
		return mapper.insert(placeRe);
	}

	@Override
	public PlaceReVO get(Long rno) { //댓글 상세보기
		log.info("get reply : "+rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(PlaceReVO placeRe) { //댓글 수정
		log.info("modify reply : "+placeRe);
		return mapper.update(placeRe);
	}

	//@Transactional //오류 발생시 rollback
	@Override
	public int remove(Long rno) { //댓글 삭제
		log.info("remove reply : "+rno);
		
		PlaceReVO placeRe = mapper.read(rno);
		placeMapper.updateReplyCnt(placeRe.getBno(), -1); //댓글 수 감소
		return mapper.delete(rno);
	}

	@Override
	public List<PlaceReVO> getList(Criteria cri, Long bno) { //전체 댓글 목록
		log.info("get reply List : "+bno);
		return mapper.getListWithPaging(cri, bno);
	}

	//댓글 페이징 처리 : 댓글 목록, 전체 댓글 수 필요
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}

}
