package com.std.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.std.service.MyPageService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/mypage/*")
@Log4j
public class MyPageController {

	private MyPageService service;
	
	//내정보 보기
	@RequestMapping(method = RequestMethod.GET, value = "/myinfo")
	public void myinfo(@RequestParam("userid")String userid, Model model) {
		log.info("마이페이지로 이동");
		model.addAttribute("userid", service.getinfo(userid));
	}
	
}
