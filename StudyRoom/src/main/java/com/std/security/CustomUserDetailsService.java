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
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.warn("Load User By UserName : "+username);
		MemVO vo = mapper.read(username);
		log.warn("queried by member mapper :"+vo);
		return vo == null ? null : new CustomUser(vo);
	}

}
