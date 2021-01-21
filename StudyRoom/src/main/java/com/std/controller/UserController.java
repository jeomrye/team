package com.std.controller;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping(method = RequestMethod.GET, value = "/joinForm")
	public void insertMem() {
		log.info("회원가입 페이지로 이동");
		
		}
	
	//회원가입페이지에서 오는 메소드
	@RequestMapping(method = RequestMethod.POST, value = "/joinForm")
	public String insertMemSusscess(MemVO vo) throws Exception {
		log.info("insertMem 진입");
		service.register(vo);
		log.info("insert Service 성공");
		
		return "redirect:/main";
	}
	//아이디 중복 검사
	@RequestMapping(method = RequestMethod.POST, value = "/memberIdChk")
	@ResponseBody
	public String memberIdCkPOST(String userid) throws Exception{
		
		log.info("memberIdCheck() 진입");
		int result = service.idCheck(userid);
		log.info("결과값 : "+result);
		
		if(result != 0) {
			return "fail";
		}else {
			return "success";
		}
	}	
	//사업자 등록번호 검사
	@RequestMapping(method = RequestMethod.POST, value = "/member/companynumCheck")
	@ResponseBody
	public String companyNumCheck(String companynumber) throws Exception {
		log.info("사업자 등록 확인 진입");
		int result = service.companyNumCheck(companynumber);
		log.info("사업자 결과값:"+result);
		
		if(result == 0) {
			return "fail";
		}else {
			return "success";
		}
			
		
	}
		
		
	
	
    
    
    
	
	
	
		
}