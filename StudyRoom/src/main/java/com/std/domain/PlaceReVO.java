package com.std.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PlaceReVO {
	private long rno; //댓글번호
	private long bno; //글 번호
	private String reply; //댓글
	private int score; //점수
	private String replyer; //작성자
	private Date replydate; //작성일
	private Date updateDate; //수정일
}
