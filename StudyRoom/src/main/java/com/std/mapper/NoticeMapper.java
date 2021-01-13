package com.std.mapper;

import java.util.List;

import com.std.domain.Criteria;
import com.std.domain.NoticeVO;

public interface NoticeMapper {

	public List<NoticeVO> getList();//getlistNotice
	public List<NoticeVO> getListWithPaging(Criteria cri);
	
	public void insert(NoticeVO notice);	//insertNotice
	public void insertSelectKey(NoticeVO notice);	//insertNotice
	public NoticeVO read(Long notNo);	//getNotice
	public int delete(Long notNo);	//deleteNotice
	public int update(NoticeVO notice);	//updateNotice
	public int getTotalCount(Criteria cri);
	
}




	

