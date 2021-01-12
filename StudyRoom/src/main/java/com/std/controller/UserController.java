package com.std.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.std.domain.MemVO;
import com.std.service.MemService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/member/*")
@Log4j
public class UserController {
	
	

	@Autowired
	private MemService service;
	
	//회원가입페이지로 가는 메소드
	@RequestMapping(method = RequestMethod.GET, value = "/insertMem")
	public void insertMem() {
		log.info("회원가입 페이지로 이동");
		
		}
	
	//회원가입페이지에서 오는 메소드
	@RequestMapping(method = RequestMethod.POST, value = "/insertMem")
	public String insertMemSusscess(MemVO vo) throws Exception {
		log.info("insertMem 진입");
		service.register(vo);
		log.info("insert Service 성공");
		
		return "redirect:/main";
	}
	
	
	
	
		
}
