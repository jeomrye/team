package com.std.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.std.domain.Criteria;
import com.std.domain.QaReplyVO;

public interface QaReplyMapper {

	public int insert(QaReplyVO vo);
	
	public QaReplyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(QaReplyVO rno);

	public List<QaReplyVO> getListWithPaging(
			@Param("cri") Criteria cri, 
			@Param("questionNo") Long questionNo);
	
	public int getCountByquestionNo(Long questionNo);
}

