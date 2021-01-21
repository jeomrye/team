package com.std.domain;

import lombok.Data;

@Data
public class PlacePhotoVO {
	private String uuid; //식별자
	private String uploadPath; //경로
	private String fileName; //파일이름
	private String fileType; //파일타입
	private Long bno; //글 번호
}
