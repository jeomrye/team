package com.std.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.std.domain.Criteria;
import com.std.domain.PlaceReVO;
import com.std.domain.ReplyPageDTO;

public interface PlaceReService {
	public int register(PlaceReVO placeRe); //댓글 등록
	public PlaceReVO get(Long rno); //댓글 상세보기
	public int modify(PlaceReVO placeRe); //댓글 수정
	public int remove(PlaceReVO reRemove); //댓글 삭제
	public List<PlaceReVO> getList(Criteria cri, Long bno); //댓글 목록
	public ReplyPageDTO getListPage(Criteria cri, Long bno); //댓글 페이지 목록
	
	public int getScore(Long bno); //댓글 점수 총합
	
	public int getReplyPerDay(PlaceReVO placeRe);//작성자당 하루 댓글 수 가져오기

	public void writeReview(@Param("replyer") String replyer, @Param("userid") String userid);//댓글 작성시 마일리지 증가
	
	public void deleteReview(@Param("replyer") String replyer, @Param("userid") String userid);//댓글 삭제시 마일리지 감소
}
