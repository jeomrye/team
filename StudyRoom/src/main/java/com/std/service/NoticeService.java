package com.std.service;

import java.util.List;

import com.std.domain.Criteria;
import com.std.domain.NoticeVO;

public interface NoticeService {
	public void regNotice(NoticeVO notice);	//작성
	public NoticeVO	getNotice(Long notNo);	//상세보기
	public boolean modifyNotice(NoticeVO notice);	//수정
	public boolean deleteNotice(Long notNo);	//삭제
	public List<NoticeVO> getlistNotice(Criteria cri);
	public int getTotal(Criteria cri);

}
