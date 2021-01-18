package com.std.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.std.domain.MemVO;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	
	private MemVO member;

	public CustomUser(String userid, String password, Collection<? extends GrantedAuthority> authorities) {
		super(userid, password, authorities);
	}
	
	public CustomUser(MemVO vo) {
		super(vo.getUserid(), vo.getPassword(), vo.getAuthList().stream().map(auth -> 
				new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		
		this.member = vo;
	}

}
