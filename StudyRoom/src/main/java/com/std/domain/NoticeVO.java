package com.std.domain;

import java.util.Date;

import lombok.Data;
@Data
public class NoticeVO {
	private Long notNo;
	private String title; 
	private String content; 
	private String wirter ;
	private Date regdate; 
	private Date updatedate;

}
