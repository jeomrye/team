package com.std.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.std.domain.Criteria;
import com.std.domain.FreeReplyVO;

public interface FreeReplyMapper {

	public int insert(FreeReplyVO vo);
	
	public FreeReplyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(FreeReplyVO reply);
	
	public List<FreeReplyVO> getListWithPaging(@Param("cri") Criteria cri,@Param("fno") Long fno);
	
	public int getCountByFno(Long fno);
}
