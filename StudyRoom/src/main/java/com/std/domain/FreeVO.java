package com.std.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FreeVO {

	private Long fno;
	private String title;
	private String content; 
	private String writer; 
	private Date regdate; 
	private Date updateDate;
	private String userid;
}
