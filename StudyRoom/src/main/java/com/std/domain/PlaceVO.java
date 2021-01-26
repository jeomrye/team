package com.std.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class PlaceVO {
	private int score; //점수
	private long bno; //글번호
	private String title; //상호명
	private String offer; //구비목록
	private String extra; //추가제공품 목록
	private String content; //내용
	private String time; //운영시간
	private String clean; //청소시간
	private int tel; //전화번호
	private String address; //주소
	private String page; //홈페이지, 각종 SNS계정
	private String writer; //작성자(자유 입력, 닉네임)
	private Date regdate; //작성일
	private Date updateDate; //수정일
	private String userid; //작성자 아이디
	private long placeReCnt; //댓글 수
	
	private List<PlacePhotoVO> photoList; //사진 리스트
}
