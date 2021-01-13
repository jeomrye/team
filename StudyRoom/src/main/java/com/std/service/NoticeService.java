package com.std.service;

import java.util.List;

import com.std.domain.NoticeVO;

public interface NoticeService {
	public void regNotice(NoticeVO notice);
	public NoticeVO	getNotice(Long notNo);
	public boolean modifyNotice(NoticeVO notice);
	public boolean deleteNotice(Long notNo);
	public List<NoticeVO> getlistNotice(Criteria cri);
	public int getTotal(Criteria cri);

}
