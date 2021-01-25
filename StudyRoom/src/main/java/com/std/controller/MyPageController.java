package com.std.controller;


import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.std.domain.Criteria;
import com.std.domain.MemVO;
import com.std.domain.PageDTO;
import com.std.service.MyPageService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/mypage/*")
@Log4j
@AllArgsConstructor
public class MyPageController {

	@Setter(onMethod_ = @Autowired)
	private MyPageService service;
	
	
	//메일샌더를 이용하기위한 의존성 주입
	@Setter(onMethod_ = @Autowired)
	private JavaMailSender mailSender;
	
	//관리자가 회원목록가져오기
	@GetMapping("/infoList")
	public void getList(Criteria cri,Model model) {
		log.info("list...: "+ cri);
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);		//전체 페이지 수 처리
		log.info("total : "+total);
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	//쿠폰목록가져오기
	@GetMapping("/checkCoupon")
	public void getcouponList(@RequestParam("userid") String userid,Model model) {
		log.info("CheckCoupon 페이지");
		model.addAttribute("cplist", service.getCoupon(userid));
	}
	//내가 쓴 댓글 가져오기
	@GetMapping("/checkwrote")
	public void getiwrote(@RequestParam("userid") String userid,Model model) {
		log.info("Checkwrote 페이지");
		model.addAttribute("replylist", service.getwrote(userid));
	}
	
	
	//내정보 보기, 수정, 삭제페이지로 이동
	@GetMapping({"/myinfo","/modifyinfo"})
	public void getmodify(@RequestParam("uno")Long uno,Model model) {
		log.info("내정보 보기,수정, 삭제 페이지 이동");
		model.addAttribute("vo",service.getinfo(uno));
		log.info(service.getinfo(uno));
	}
	
	
	//회원정보 수정
	@PostMapping("/modifyinfo")
	public String modifyinfo(MemVO vo, RedirectAttributes rttr) {
		log.info("modify:" + vo);
		
		if(service.modifyinfo(vo)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/main";
	}
	//회원탈퇴하기
	@PostMapping("/deleteinfo")
	public String removeinfo(@RequestParam("uno")Long uno, RedirectAttributes rttr) {
		log.info("remove"+uno);
		if(service.removeinfo(uno)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/main";
	}
	
	
	//이메일 변경하기 인증
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
        String title = "Study Room Finding Service:SRFS 회원정보 변경 인증 메일입니다.";	//메일 제목입력
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

