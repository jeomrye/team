package com.std.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.std.domain.Criteria;
import com.std.domain.QaReplyPageDTO;
import com.std.domain.QaReplyVO;
import com.std.service.QaReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class QaReplyController {

	private QaReplyService replyservice;
	
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody QaReplyVO vo){
		log.info("QaReplyVO: " + vo);
		int insertCount = replyservice.register(vo);
		log.info("Reply INSERT COUNT: " + insertCount);
		return insertCount == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)//200
			: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);//500
		//삼항 연산자 처리
	}
	
	@GetMapping(value = "/pages/{questionNo}/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<QaReplyPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("questionNo") Long questionNo) {
		Criteria cri = new Criteria(page,10);
		log.info("get Reply List questionNo: " + questionNo);
		log.info("cri:" + cri);
		
		return new ResponseEntity<>(replyservice.getListPage(cri, questionNo), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{rno}",
			produces = { MediaType.APPLICATION_XML_VALUE,
						 MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<QaReplyVO> get(@PathVariable("rno") Long rno) {
		log.info("get: " + rno);
		return new ResponseEntity<QaReplyVO>(replyservice.get(rno), HttpStatus.OK);
	}
	@DeleteMapping(value = "/{rno}" , produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
		log.info("remove: " + rno);
		int returnValue = replyservice.remove(rno);
		System.out.println("삭제확인");
		return returnValue == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
	}
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/{rno}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
			@RequestBody QaReplyVO vo,
			@PathVariable("rno") Long rno) {
		
		vo.setRno(rno);
		log.info("rno: " + rno);
		log.info("modify: " + vo);
		
		return replyservice.modify(vo) == 1
				? new ResponseEntity<String>("success", HttpStatus.OK)
						: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
