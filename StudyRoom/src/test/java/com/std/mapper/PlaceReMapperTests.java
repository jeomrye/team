package com.std.mapper;

import static org.junit.Assert.*;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.std.domain.PlaceReVO;
import com.std.domain.PlaceVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PlaceReMapperTests {

	@Setter(onMethod_ = @Autowired)
	private PlaceReMapper mapper;
	
	@Test
	public void testInsert() {
		PlaceReVO placeRe = new PlaceReVO();
		placeRe.setScore(3);
		placeRe.setReply("되어라!");
		placeRe.setReplyer("user00");
		placeRe.setBno(43);
		mapper.insert(placeRe);
		log.info(placeRe);
		
	}

}
