package com.std.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.std.domain.Criteria;
import com.std.domain.MemVO;
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
	
	@Transactional //오류 발생시 rollback
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

	@Transactional //오류 발생시 rollback
	@Override
	public int remove(PlaceReVO reRemove) { //댓글 삭제
		log.info("remove reply : "+reRemove.getRno());
		
		PlaceReVO placeRe = mapper.read(reRemove.getRno());
		placeMapper.updateReplyCnt(placeRe.getBno(), -1); //댓글 수 감소
		return mapper.delete(reRemove);
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

	@Override
	public int getScore(Long bno) { //댓글 각각이 가지고 있는 점수 가져와서 총합 구하기
		String[] score = mapper.getScore(bno);
		int total = 0;
		for(int i = 0; i<score.length; i++) {
			total += Integer.parseInt(score[i]);
		}
		return total;
	}

	@Override
	public int getReplyPerDay(PlaceReVO placeRe) { //하루에 한개의 리뷰댓글만 쓸 수 있도록 제한
		return mapper.getReplyPerDay(placeRe);
	}

	@Override
	public void writeReview(String replyer, String userid) { //댓글 작성시 마일리지 지급
		mapper.writeReview(replyer, userid);
	}
	
	@Override
	public void deleteReview(String replyer, String userid) { //댓글 삭제시 마일리지 감소
		mapper.deleteReview(replyer, userid);
	}
}
