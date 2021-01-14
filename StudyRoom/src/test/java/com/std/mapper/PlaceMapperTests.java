package com.std.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.std.domain.PlaceVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PlaceMapperTests {

	@Setter(onMethod_ = @Autowired)
	private PlaceMapper mapper;
	
	@Test
	public void testInsert() {
		PlaceVO place = new PlaceVO();
		place.setTitle("자양동2점 시작스터디");
		place.setContent("독서실형 15, 테이블형20");
		place.setTime("청소 시간 제외 연중 무휴");
		place.setClean("매일 새벽2~3시");
		place.setTel(01012341234);
		place.setAddress("광진구 뚝섬로 34길");
		place.setWriter("자양동 시작스터디");
		
		mapper.insert(place);
		log.info(place);
		
	}

}
