package com.std.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.std.domain.AuthVO;
import com.std.domain.MemVO;
import com.std.mapper.UserMapper;
@Service
public class MemServiceImpl implements MemService {

	@Autowired
	UserMapper mapper;
	
	//회원가입
	@Override
	public void register(MemVO vo) throws Exception {
		mapper.insertMem(vo);
	}
	
	//권한주기
	@Override
	public void auth(AuthVO avo) throws Exception {
		mapper.insertAuth(avo);
	}

	//아이디 중복검사
	@Override
	public int idCheck(String userid) throws Exception {
		
		return mapper.idCheck(userid);
	}

	@Override
	public int companyNumCheck(String companynumber) throws Exception {
		
		return mapper.companyNumCheck(companynumber);
	}

	//아이디찾기
	@Override
	public String findId(HttpServletResponse response,String email) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = mapper.findId(email);
		if(id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	//비밀번호 찾기
	@Override
	public void findPw(HttpServletResponse response,MemVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if(mapper.read(vo.getUserid()) == null) {
			out.print("아이디가 없습니다.");
			out.close();
		}
		// 가입에 사용한 이메일이 아니면
		else if(!vo.getEmail().equals(mapper.findEmail(vo.getUserid()))) {;
			out.print("잘못된 이메일 입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setPassword(pw);
			System.out.println(vo.getPassword());
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findPw");
			// 비밀번호 암호화 처리
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			String password = encoder.encode(vo.getPassword());
			vo.setPassword(password);
			System.out.println(vo.getPassword());
			// 비밀번호 변경
			mapper.updatePw(vo);

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
		
	}

	@Override
	public void sendEmail(MemVO vo, String div) throws Exception {
		// Mail Server 설정
				String charSet = "utf-8";
				String hostSMTP = "smtp.naver.com";
				String hostSMTPid = "";	//이메일 아이디
				String hostSMTPpwd = "";	//이메일 비밀번호

				// 보내는 사람 EMail, 제목, 내용
				String fromEmail = "clcko30@naver.com";
				String fromName = "Study Room Finding Service:SRFS";
				String subject = "";
				String msg = "";
				
				if(div.equals("findPw")) {
					subject = "Study Room Finding Service:SRFS 임시 비밀번호 입니다.";
					msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
					msg += "<h3 style='color: blue;'>";
					msg += vo.getUserid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
					msg += "<p>임시 비밀번호 : ";
					msg += vo.getPassword() + "</p></div>";
				}
				// 받는 사람 E-Mail 주소
				String mail = vo.getEmail();
				try {
					HtmlEmail email = new HtmlEmail();
					email.setDebug(true);
					email.setCharset(charSet);
					email.setSSL(true);
					email.setHostName(hostSMTP);
					email.setSmtpPort(587);

					email.setAuthentication(hostSMTPid, hostSMTPpwd);
					email.setTLS(true);
					email.addTo(mail, charSet);
					email.setFrom(fromEmail, fromName, charSet);
					email.setSubject(subject);
					email.setHtmlMsg(msg);
					email.send();
				} catch (Exception e) {
					System.out.println("메일발송 실패 : " + e);
				}
			}

}	

	
