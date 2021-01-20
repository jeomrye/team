package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.std.domain.Criteria;
import com.std.domain.PlacePhotoVO;
import com.std.domain.PlaceVO;
import com.std.mapper.PlaceMapper;
import com.std.mapper.PlacePhotoMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class PlaceServiceImpl implements PlaceService {
	@Setter(onMethod_ = @Autowired)
	private PlaceMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PlacePhotoMapper photoMapper;
	
	@Transactional //오류 발생시 rollback
	@Override
	public void register(PlaceVO place) { //글 등록
		log.info("register : "+place);
		mapper.insert(place);	
		
		if(place.getPhotoList() == null || place.getPhotoList().size()<=0) {
			return;
		}
		
		place.getPhotoList().forEach(attach -> {
			log.info("getBno!!!!!!!!!!! : "+place.getBno());
			attach.setBno(place.getBno());
			photoMapper.insert(attach);
		});
	}

	@Override
	public PlaceVO get(Long bno) { //글 상세보기
		log.info("get : "+bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(PlaceVO place) { //글 수정
		log.info("modify : "+place);
		photoMapper.deleteAll(place.getBno());
		
		boolean modifyResult = mapper.update(place)==1;
		if(modifyResult && place.getPhotoList() != null && place.getPhotoList().size() > 0) {
			place.getPhotoList().forEach(attach -> {
				attach.setBno(place.getBno());
				photoMapper.insertP(attach);
			});
		}
		return modifyResult;
	}
	
	@Transactional //오류 발생시 rollback
	@Override
	public boolean remove(Long bno) { //글 삭제
		log.info("remove : "+bno);
		photoMapper.deleteAll(bno);
		return mapper.delete(bno)==1;
	}

	@Override
	public List<PlaceVO> getList(Criteria cri) { //글 목록
		log.info("getList : "+cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) { //총 글 개수
		log.info("TotalCount");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<PlacePhotoVO> getPhotoList(Long bno) { //글에 첨부된 사진 목록
		log.info("get Photo List : "+bno);
		return photoMapper.findByBno(bno);
	}

	@Override
	public long getReplyCnt(Long bno) {// 총 리뷰댓글 수
		log.info("get reply count");
		return mapper.getReplyCnt(bno);
	}

}
