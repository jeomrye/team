package com.std.domain;

import lombok.Data;

@Data
public class AuthVO {
	
	private String userid;	//회원아이디
	private String auth;	// 권한
}
