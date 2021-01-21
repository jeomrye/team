package com.std.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.std.domain.Criteria;
import com.std.domain.MemVO;
import com.std.domain.PlaceReVO;
import com.std.domain.ReplyPageDTO;
import com.std.service.PlaceReService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/placeRe/")
@RestController
@Log4j
@AllArgsConstructor
public class PlaceReController {
	
	private PlaceReService service;
	
	//새로운 댓글 등록
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody PlaceReVO placeRe, MemVO member){
		log.info("PlaceReVO : " +placeRe);
		int countPerDay = service.getReplyPerDay(placeRe);
		if(countPerDay >= 1) {//아이디당 하루에 한개의 리뷰만 가능	
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); //한개를 넘어가면 에러 발생, 등록 불가
		}else {
			int ange = placeRe.getReply().length();//reply 길이
			log.info("reply 길이 : "+ange);
			if(ange < 150) { //리뷰 최소 길이 150으로 지정
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); //150이 안되면 에러 발생, 등록 불가
			}else {
				int insertCount = service.register(placeRe);//댓글 등록
				service.writeReview(placeRe.getReplyer(), member.getUserid());//댓글 등록시 해당 작성자 마일리지 지급
				log.info("Reply Insert Count : "+ insertCount);
				
				//삼항 연산자
				return insertCount==1 
				? new ResponseEntity<>("리뷰가 등록되었습니다.",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}	
	}
	
	//댓글 목록
	@GetMapping(value = "/pages/{bno}/{page}",produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno){
				log.info("getList...................");
				Criteria cri = new Criteria(page, 10);
				log.info(cri);
				return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
			}
	
	//댓글 상세보기
	@GetMapping(value="/{rno}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<PlaceReVO> get(@PathVariable("rno") Long rno){
		log.info("get : " + rno);
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}

	//댓글 삭제
	@PreAuthorize("principal.username == #placeRe.replyer")
	@DeleteMapping(value = "/{rno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody PlaceReVO placeRe, MemVO member){
		long rno = placeRe.getRno();
		log.info("reply remove : "+rno);
		
		member = service.forDelete(placeRe.getReplyer(), member.getUserid());

		log.info(member.getUserid());
		if(member.getMileage() > 0) {
			service.deleteReview(placeRe.getReplyer(), member.getUserid()); //댓글 삭제시 해당 작성자 마일리지 회수
		}else {
			member.setMileage(0);
		}
		
		//삼항연산자
		return service.remove(placeRe) == 1 
		? new ResponseEntity<>("마일리지가 회수됩니다.",HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 수정
	@PreAuthorize("principal.username == #placeRe.replyer")		
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{rno}", consumes = "application/json")
	public ResponseEntity<String> modify(@RequestBody PlaceReVO placeRe, @PathVariable("rno") Long rno){
		placeRe.setRno(rno);
		log.info("rno : "+rno);
		log.info("reply modify : "+placeRe);
		
		return service.modify(placeRe)==1 
		? new ResponseEntity<>("리뷰가 수정되었습니다.",HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}