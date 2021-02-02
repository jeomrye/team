package com.std.controller;


import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.std.domain.CouponDetailVO;
import com.std.domain.Criteria;
import com.std.domain.MemVO;
import com.std.domain.PageDTO;
import com.std.security.domain.CustomUser;
import com.std.service.MemService;
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
	private MemService service1;
	// 암호화하기
	@Inject	
	PasswordEncoder passwordEncoder;
	
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
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/checkCoupon")
	public void getcouponList(@RequestParam("userid") String userid,Model model) {
		log.info("CheckCoupon 페이지");
		model.addAttribute("cplist", service.getCoupon(userid));
	}
	
	
	
	
	//내가 쓴 댓글 가져오기
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/checkwrote")
	public void getiwrote(@RequestParam("userid") String userid,Model model) {
		log.info("Checkwrote 페이지");
		model.addAttribute("replylist", service.getwrote(userid));
	}
	
	
	//내정보 보기, 수정, 삭제페이지로 이동
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/myinfo")
	public void getinfo(MemVO vo,Model model) {
		log.info("내정보 보기페이지 이동");
		model.addAttribute("vo",service.getinfo(vo.getUserid()));
		log.info("내 아이디는 말이지~"+service.getinfo(vo.getUserid()));
	}

	
	//회원정보 수정페이지로 이동
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/modifyinfo")
	public void getmodify(@RequestParam("userid") String userid,Model model) {
		log.info("수정, 삭제 페이지 이동");
		model.addAttribute("vo",service.getinfo(userid));
		log.info(service.getinfo(userid));
	}
	
	
	//회원정보 수정페이지에서 오는 메소드
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/modifyinfo1")
	public void modifyinfo(@RequestParam("userid") String userid,MemVO vo,Model model, RedirectAttributes rttr) {
		log.info("modify:" + vo);
		model.addAttribute("vo",service.getinfo(userid));
		 String enPassword = passwordEncoder.encode(vo.getPassword());
	      vo.setPassword(enPassword);
	      
		service.modifyinfo(vo);
		
	}
	
	//회원탈퇴페이지로 가기
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteinfo")
	public void removeinfopage(@RequestParam("userid")String userid,Model model, RedirectAttributes rttr) {
		log.info("삭제 페이지로 이동"+userid);
		model.addAttribute("vo",service.getinfo(userid));
		
		
	}
	
	//회원탈퇴 페이지에서 서비스로 보내기
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteinfo1")
	public void removeinfo(@RequestParam("userid")String userid, RedirectAttributes rttr) {
		log.info("회원탈퇴 진행"+userid);
		service.removeinfo(userid);
		
		
	}
	

	
	//쿠폰사용 확인페이지로이동
	@PostMapping("/usecoupon")
	@PreAuthorize("isAuthenticated()")
	public void usecoupon() {
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/usecoupon.do", method=RequestMethod.POST)
    public String findId(HttpServletResponse response,CouponDetailVO vo, @RequestParam("coup") int coup,Model model) throws Exception{
    	log.info("쿠폰사용");
    	CouponDetailVO num = service.checkusecoupon(coup);
    	log.info("쿱쿱쿱등이"+num);
    	if(num.getCouponuse() ==0) {
    		log.info("0이다");
    		service.usecoupon(coup);
    		model.addAttribute("result","쿠폰사용이 완료되었습니다 할인적용하세요");
    		return "/mypage/usecoupon";
    	} else {
    		model.addAttribute("result","쿠폰사용실패 이미 사용한 쿠폰입니다");
    		return "/mypage/usecoupon";
    	}
    	
    	//log.info("쿠폰넘버는 뭘까요~?"+couponnumber);
    	 
    }
		
		
		
		
	
	  //마이페이지 로그인
	  
	  @GetMapping("/mypagelogin") 
	  public void loginInput(String userid, String error, String logout, Model model) { 
		  log.info("error : "+error);
		  log.info("logout : "+logout); 
//		  log.info("패스워드 : "+vo.getPassword());
		  if(error != null) { model.addAttribute("error","Login Error Check Your Account");} 
		  if(logout !=null) { model.addAttribute("logout", "Logout!!"); } 
		  
		  
		 
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
        
        
        String From = "";	//보낸는 사람메일
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

