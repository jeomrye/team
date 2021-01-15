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
import com.std.domain.FreeReplyPageDTO;
import com.std.domain.FreeReplyVO;
import com.std.service.FreeReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class FreeReplyController {

	private FreeReplyService replyservice;

	@PostMapping(value="/new",consumes = "application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody FreeReplyVO vo){	// 댓글 입력
		log.info("FreeReplyVO : "+vo);
		int insertCount = replyservice.register(vo);
		log.info("Reply INSERT COUNT : "+insertCount);
		return insertCount == 1 ? 
			new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 삼항 연산자 처리
	}
	
	@GetMapping(value="/pages/{fno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<FreeReplyPageDTO> getList(@PathVariable("page") int page,@PathVariable("fno") Long fno){
		Criteria cri = new Criteria(page,10);
		log.info("get Reply List fno : "+fno);
		log.info("cri : "+cri);
		return new ResponseEntity<>(replyservice.getListPage(cri, fno), HttpStatus.OK);		
	}
	
	@GetMapping(value="/{rno}", produces = {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<FreeReplyVO> get(@PathVariable("rno") Long rno){
		log.info("get : "+rno);
		return new ResponseEntity<>(replyservice.get(rno),HttpStatus.OK);
	}
	
	@DeleteMapping(value="/{rno}",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno){
		log.info("remove: "+rno);
		return replyservice.remove(rno) == 1 ? 
			new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},value= "/{rno}",consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody FreeReplyVO vo,@PathVariable("rno") Long rno){
		vo.setRno(rno);
		log.info("rno : " +rno);
		log.info("modify : "+vo);
		return replyservice.modify(vo) == 1 ? 
				new ResponseEntity<>("success",HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
