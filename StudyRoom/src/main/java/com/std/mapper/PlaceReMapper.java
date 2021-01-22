package com.std.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.std.domain.Criteria;
import com.std.domain.PlaceReVO;

public interface PlaceReMapper {
	public int insert(PlaceReVO placeRe); //댓글 추가하기
	public PlaceReVO read(Long rno); //댓글 상세보기
	public int delete(PlaceReVO reRemove); //댓글 삭제하기
	public int update(PlaceReVO placeRe); //댓글 수정하기
	//댓글 목록 가져오기
	public List<PlaceReVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	public int getCountByBno(Long bno); //총 댓글 수
	
	public String[] getScore(Long bno);//리뷰 댓글에 달린 점수들의 합
	
	public int getReplyPerDay(PlaceReVO placeRe);//작성자당 하루 댓글 수 가져오기
	
	public void writeReview(@Param("replyer") String replyer, @Param("userid") String userid);//댓글 작성시 마일리지 증가
	
	public void deleteReview(@Param("replyer") String replyer, @Param("userid") String userid);//댓글 삭제시 마일리지 감소
}
