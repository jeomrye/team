package com.std.mapper;

import java.util.List;

import com.std.domain.PlacePhotoVO;

public interface PlacePhotoMapper {
	public void insert(PlacePhotoVO placePho); //파일 하나 추가
	public void insertP(PlacePhotoVO placePho); //파일 하나 추가(수정용)
	public void delete(String uuid); //파일 하나 삭제
	public List<PlacePhotoVO> findByBno(Long bno); //파일 목록
	public void deleteAll(Long bno); //글 삭제시 파일 모두 삭제
}
