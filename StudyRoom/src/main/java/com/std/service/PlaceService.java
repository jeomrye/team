package com.std.service;

import java.util.List;

import com.std.domain.Criteria;
import com.std.domain.PlacePhotoVO;
import com.std.domain.PlaceVO;

public interface PlaceService {
	public void register(PlaceVO place);//글 등록하기
	public PlaceVO get(Long bno); //글 상세보기
	public boolean modify(PlaceVO place); //글 수정하기
	public boolean remove(Long bno); //글 삭제하기
	public List<PlaceVO> getList(Criteria cri); //글 목록 가져오기(Criteria 기준)
	
	public int getTotal(Criteria cri); //총 글 개수
	
	public List<PlacePhotoVO> getPhotoList(Long bno); //첨부된 사진 목록
	
	public long getReplyCnt(Long bno);//댓글 수
}
