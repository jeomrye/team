package com.std.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.std.domain.MemVO;
import com.std.mapper.UserMapper;
import com.std.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {	//DB에서 유저 정보를 가져오는 역할

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	//UserDetailsService 인터페이스에서 DB에서 유저정보를 불러오는 중요한 메소드는 loadUserByUsername() 메소드이다.
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserName : "+username);
		MemVO vo = mapper.read(username);
		log.warn("queried by member mapper :"+vo);
		return vo == null ? null : new CustomUser(vo);
	}

}
