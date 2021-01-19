package com.std.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
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
	public String findId(HttpServletResponse response, String username,String email) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = mapper.findId(email, username);
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

	

	

}
