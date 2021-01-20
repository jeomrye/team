package com.std.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.std.domain.PlaceVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PlaceMapperTests {

	@Setter(onMethod_ = @Autowired)
	private PlaceMapper mapper;
	
	@Test
	public void testInsert() {
		PlaceVO place = new PlaceVO();
		place.setTitle("상암동 독서실");
		place.setOffer("공기청정기");
		place.setContent("독서실형 15, 테이블형20");
		place.setTime("청소 시간 제외 연중 무휴");
		place.setClean("매일 새벽2~3시");
		place.setTel(01012341234);
		place.setAddress("상암구 상암동");
		place.setWriter("상암동 독서실");
		
		mapper.insert(place);
		log.info(place);
		
	}

}
