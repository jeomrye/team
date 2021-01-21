package com.std.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FreeVO {

	private Long fno;	//글번호
	private String title;	//글제목
	private String content; 	//글내용
	private String writer; 	// 글작성자
	private Date regdate; 	//글작성일
	private Date updateDate;	//글수정일
	private String userid;	//userid
}
