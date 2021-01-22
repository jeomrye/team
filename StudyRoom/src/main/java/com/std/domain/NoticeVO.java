package com.std.domain;

import java.util.Date;

import lombok.Data;
@Data
public class NoticeVO {
	private Long notNo;	//공지게시고유번호
	private String title; 	//제목
	private String content; //내용
	private String writer ;//작성자
	private Date regdate; //작성일자
	private Date updatedate;//수정일자

}
