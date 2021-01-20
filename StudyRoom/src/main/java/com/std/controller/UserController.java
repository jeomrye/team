package com.std.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.xml.ws.RequestWrapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	
	//메일샌더를 이용하기위한 의존성 주입
	@Autowired
	private JavaMailSender mailSender;
	
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
		
		
	//이메일 인증
    @RequestMapping(value="/emailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
    	 //insertMem.jsp로 부터 넘어온 email데이터
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + email);
        
        //인증번호 생성
        Random random = new Random();
        int checkNum = random.nextInt(88888)+11111;
        log.info("인증번호"+checkNum);
        
        
        String From = "jisuh12@naver.com";	//보낸는 사람메일
        String toEmail = email;	//받는사람 메일 입력 (입력받은 메일가져와서 변수입력)
        String title = "Study Room Finding Service:SRFS 회원가입 인증 메일입니다.";	//메일 제목입력
        String content = 
        		"<h1>"+"홈페이지를 방문해주셔서 감사합니다."+"</h1><br>"+
        		"인증 번호는 "+checkNum+"입니다"+"<br>"+
        		"인증번호 확인란에 인증번호를 입력해주세요.";	//메일 내용입력
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(From);
            helper.setTo(toEmail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        String num = Integer.toString(checkNum);//int로 받은 값을 String으로 변환
        return num;
    }
	
    
    
    
	
	
	
		
}
