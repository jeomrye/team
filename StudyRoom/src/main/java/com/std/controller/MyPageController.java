package com.std.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/mypage/*")
@Log4j
public class MyPageController {

	
	//내정보 보기
	@RequestMapping(method = RequestMethod.POST, value = "/myinfo")
	public void myinfo() {
		log.info("마이페이지로 이동");
	}
	
}
