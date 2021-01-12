package com.std.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.std.domain.FreeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FreeMapperTests {

	@Setter(onMethod_ = @Autowired)
	private FreeMapper mapper;
	
	@Test
	public void test() {
		mapper.getList().forEach(free ->log.info(free));
	}
	
	//@Test
	public void testInsert() {
		FreeVO free = new FreeVO();
		free.setTitle("새글");
		free.setContent("새내용");
		free.setWriter("작성자");
		mapper.insert(free);
		
		log.info(free);
	}
	
	//@Test
	public void testInsertSelectKey() {
		FreeVO free = new FreeVO();
		free.setTitle("새글 key");
		free.setContent("새내용 key");
		free.setWriter("작성자 key");
		mapper.insertSelectKey(free);
		
		log.info(free);
	}
	
	//@Test
	public void testRead() {
		FreeVO free = mapper.read(2L);
		log.info(free);
	}
	
	//@Test
	public void testDelete() {
		log.info("delete count : "+mapper.delete(2L));
	}
	
	//@Test
	public void testUpdate() {
		FreeVO free = new FreeVO();
		free.setFno(2L);
		free.setTitle("수정");
		free.setContent("수정");
		free.setWriter("수정");
		
		int count = mapper.update(free);
		log.info("update count :"+count);
	}

}
