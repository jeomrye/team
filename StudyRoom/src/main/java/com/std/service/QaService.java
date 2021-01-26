package com.std.service;

import java.util.List;

import com.std.domain.Criteria;
import com.std.domain.QaVO;

public interface QaService {

	public void questionRegi(QaVO qa); //insert 등록
	
	public QaVO get(Long questionNo); //select

	public boolean questionModi(QaVO qa); //update 수정
	
	public boolean questionDel(Long questionNo); //select 삭제

	public List<QaVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
}
