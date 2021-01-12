package com.std.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.std.domain.FreeVO;
import com.std.mapper.FreeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FreeServiceImpl implements FreeService {
	
	@Setter(onMethod_ = @Autowired)
	private FreeMapper mapper;

	@Override
	public void register(FreeVO free) {
		// TODO Auto-generated method stub

	}

	@Override
	public FreeVO get(Long fno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify(FreeVO free) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long fno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<FreeVO> getList() {
		log.info("getList........");
		return mapper.getList();
	}

}
