package com.std.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class QaReplyPageDTO {
	
	private int replyCnt;
	private List<QaReplyVO> list;

}
