package com.std.mapper;

import java.util.List;

import com.std.domain.Criteria;
import com.std.domain.QaVO;

public interface QaMapper {
	
	public List<QaVO> getList();
	
	public List<QaVO> getListWithPaging(Criteria cri);

	public void insert(QaVO qa);
	
	public void insertSelectKey(QaVO qa);

	public QaVO read(Long questionNo);
	
	public int delete(Long questionNo);	
	
	public int update(QaVO qa);
	
	public int getTotalCount(Criteria cri);
}
