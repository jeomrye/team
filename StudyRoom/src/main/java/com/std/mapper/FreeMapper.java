package com.std.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.std.domain.Criteria;
import com.std.domain.FreeVO;

public interface FreeMapper {

	public List<FreeVO> getList();
	
	public List<FreeVO> getListWithPaging(Criteria cri);
	
	public void insert(FreeVO free);
	
	public void insertSelectKey(FreeVO free);
	
	public FreeVO read(Long fno);
	
	public int delete(Long fno);
	
	public int update(FreeVO free);
	
	public int getTotalCount(Criteria cri);
}
