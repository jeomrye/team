package com.std.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.std.domain.Criteria;
import com.std.domain.PlaceVO;

public interface PlaceMapper {
	
	public List<PlaceVO> getListWithPaging(Criteria cri); //장소 목록 Criteria 설정에 맞춰 가져오기
	public void insert(PlaceVO place); //장소 추가하기
	public PlaceVO read(Long bno); //장소 상세보기
	public int delete(Long bno); //장소 삭제하기
	public int update(PlaceVO place); //장소 수정하기
	
	public int getTotalCount(Criteria cri); //장소 목록에 있는 글 총 개수
	
	//bno : 글 번호 , amount : 증가, 감소 의미하는 변수
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount); //댓글 수 업데이트
	
	public long getReplyCnt(Long bno);//댓글 수
	
	
}
