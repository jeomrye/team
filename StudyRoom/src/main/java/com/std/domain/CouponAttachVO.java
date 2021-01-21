package com.std.domain;

import lombok.Data;

@Data
public class CouponAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private int couponNumber;
}
