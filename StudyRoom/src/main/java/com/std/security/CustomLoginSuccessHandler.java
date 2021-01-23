package com.std.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		log.warn("Login Success");
		List<String> roleNames = new ArrayList<>();
		auth.getAuthorities().forEach(authority-> {
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES : "+roleNames);
		
		//로그인시 권한에 따라 다른페이지 호출
		if(roleNames.contains("ROLE_ADMIN")) {
			 response.sendRedirect("/main/mainpage");
			return; 
		}
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/main/mainpage");
			return;
		}
		response.sendRedirect("/");

	}

}
