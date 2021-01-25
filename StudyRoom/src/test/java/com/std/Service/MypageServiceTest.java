package com.std.Service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.std.domain.MemVO;
import com.std.mapper.MyPageMapper;
import com.std.service.MyPageService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MypageServiceTest {

	@Setter(onMethod_ = @Autowired)
	private MyPageService service;
	
	/*
	 * @Test public void testGetList() { service.getList().forEach(member ->
	 * log.info(member)); }
	 */
	
	@Test
	public void testGet() {
		log.info(service.getinfo(6L));
	}
	
	@Test
	public void testDelete() {
		log.info("remove result"+service.removeinfo(6L));
	}
	@Test
	public void testUpdate() {
		MemVO vo = service.getinfo(5L);
		
		if(vo == null) {
			return;
		}
		vo.setPhone("010-8765-4321");
		log.info("modify result" + service.modifyinfo(vo));
	}
	
	
	
	
}
