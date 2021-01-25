package com.std.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QaReplyVO {

	private Long rno;// 댓글 번호
	private Long questionNo;// 게시글 번호
	private String reply;// 댓글내용
	private String replyer;	//댓글작성자
	private Date replyDate;	//댓글작성일
	private Date updateDate; //댓글수정일
}
