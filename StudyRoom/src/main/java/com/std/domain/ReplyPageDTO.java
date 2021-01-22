package com.std.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDTO {
	private int replyCnt; //댓글수
	private List<PlaceReVO> list; //댓글 목록
}
