package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.domain.Criteria;
import com.std.domain.NoticeVO;
import com.std.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{

	@Setter(onMethod_ =@Autowired )
	public NoticeMapper mapper;
	
	
	@Override
	public void regNotice(NoticeVO notice) {
		
		log.info("register..........."+notice);
		mapper.insertSelectKey(notice);
		
	}

	@Override
	public NoticeVO getNotice(Long notNo) {
		log.info("get........."+notNo);
		return mapper.read(notNo);
	}

	@Override
	public boolean modifyNotice(NoticeVO notice) {
		log.info("modify........."+ notice);
		return mapper.update(notice)==1;
	}

	@Override
	public boolean deleteNotice(Long notNo) {
		log.info("remove........."+ notNo);
		return mapper.delete(notNo) == 1;
	}

	@Override
	public List<NoticeVO> getlistNotice(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
	}

}
