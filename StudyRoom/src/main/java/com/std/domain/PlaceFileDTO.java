package com.std.domain;

import lombok.Data;

@Data
public class PlaceFileDTO {
	private String fileName; //파일 이름
	private String uploadPath; //경로
	private String uuid; //식별자
	private boolean image; //이미지인지 아닌지 여부
}
