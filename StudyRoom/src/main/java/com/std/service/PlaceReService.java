package com.std.service;

import java.util.List;

import com.std.domain.Criteria;
import com.std.domain.PlaceReVO;
import com.std.domain.ReplyPageDTO;

public interface PlaceReService {
	public int register(PlaceReVO placeRe);
	public PlaceReVO get(Long rno);
	public int modify(PlaceReVO placeRe);
	public int remove(Long rno);
	public List<PlaceReVO> getList(Criteria cri, Long bno);
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
	
}
