package com.std.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class FaqVO {

	private Long faqNo; //글번호
	
	private String title; //제목
	
	private String content; //내용
	
	private String writer; //작성자
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date writedate; //작성일
	
	private int faqcnt; //조회수
	
	private String userid; //작성자 아이디
}
