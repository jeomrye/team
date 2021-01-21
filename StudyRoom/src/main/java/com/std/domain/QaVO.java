package com.std.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class QaVO {

	private Long questionNo; //글번호
	
	private String title; //제목
	
	private String content; //내용
	
	private String writer; //작성자
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date writedate; //작성일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedate; //수정일
	
	private int qnacnt; //조회수
	
	private String replycontent; //답변내용
	
	private Date replywritedate; //답변 작성일
	
	private Date replyupdatedate; //답변 수정일
	
	private String status; //상태
	
	private String pub; //글 공개여부
	
	private int password; //비밀번호
	
	private String userid; //작성자 아이디
	
	
}
