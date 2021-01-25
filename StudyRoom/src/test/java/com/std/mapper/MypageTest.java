package com.std.Mapper;



import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.std.domain.Criteria;
import com.std.domain.MemVO;
import com.std.mapper.MyPageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MypageTest {

	@Setter(onMethod_ = @Autowired)
	private MyPageMapper mapper;
	
	/*
	 * @Test public void testGetList() { mapper.getList().forEach(member ->
	 * log.info(member)); }
	 */
	
	@Test
	public void testGet() {
		log.info(mapper.selectinfo(6L));
	}
	
	@Test
	public void testDelete() {
		log.info("remove result"+mapper.deleteinfo(6L));
	}
	@Test
	public void testUpdate() {
		MemVO vo = new MemVO();
		vo.setUno(1L);
		vo.setPassword("123456");
		vo.setPhone("01098765432");
		
		
		int count = mapper.updateinfo(vo);
		log.info("Update Count:" + count);
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		List<MemVO> list = mapper.getListWithPaging(cri);
		list.forEach(member -> log.info(member));
	}
	
	
	
}
