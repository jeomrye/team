package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.domain.Criteria;
import com.std.domain.FreeVO;
import com.std.mapper.FreeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FreeServiceImpl implements FreeService {
	
	@Setter(onMethod_ = @Autowired)
	private FreeMapper mapper;

	@Override
	public void register(FreeVO free) {
		log.info("register....."+free);
		mapper.insertSelectKey(free);

	}

	@Override
	public FreeVO get(Long fno) {
		log.info("get..............: "+fno);
		return mapper.read(fno);
	}

	@Override
	public boolean modify(FreeVO free) {
		log.info("modify........"+free);
		return mapper.update(free) == 1;
	}

	@Override
	public boolean remove(Long fno) {
		log.info("remove.........."+fno);
		return mapper.delete(fno) == 1;
	}

	@Override
	public List<FreeVO> getList(Criteria cri) {
		log.info("get List With Criteria : "+cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

}
