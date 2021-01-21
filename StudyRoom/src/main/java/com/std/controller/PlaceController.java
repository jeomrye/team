package com.std.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.std.domain.Criteria;
import com.std.domain.PageDTO;
import com.std.domain.PlacePhotoVO;
import com.std.domain.PlaceVO;
import com.std.service.PlaceReService;
import com.std.service.PlaceService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/place/*")
@AllArgsConstructor
public class PlaceController {
	
	private PlaceService service;
	private PlaceReService serviceRe;
	
	@GetMapping("/list") //글 목록 가져오기
	public void list(Criteria cri, Model model) {

		log.info("place list: " + cri);
		model.addAttribute("placeList", service.getList(cri)); //list 목록 가져오기

		int total = service.getTotal(cri);

		log.info("total: " + total);
		
		//페이지 생성(기준(cri)을 기반으로 게시글들 배치)
		model.addAttribute("placePage", new PageDTO(cri, total));

	}
	
	//get방식으로 들어온 경우의 글 등록
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
	
	//post방식으로 들어온 경우의 글 등록(register.jsp)
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(PlaceVO place, RedirectAttributes rttr) {//redirect : 다른 주소로 이동시키기 위함
		log.info("----------------------------");
		log.info("place register : "+place);
		
		//게시물이 가진 사진 목록 가져오기
		if(place.getPhotoList() != null) {place.getPhotoList().forEach(attach -> log.info(attach));}
		log.info("----------------------------");
		
		service.register(place); //게시글 등록
		rttr.addFlashAttribute("placeResult",place.getBno()); //화면에 딱 한번만 사용하고 사라지는 데이터를 전달
		return "redirect:/place/list"; //경로를 의미 : place/list를 찾아감
	}
	
	//글 상세보기
	@PreAuthorize("isAuthenticated()")
	@GetMapping({"/get","/modify"})
	//@RequestParam : 하나의 값만을 request방식으로 전달, @ModelAttribute : 객체 통으로 값 전달 
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or /modify");
		model.addAttribute("place",service.get(bno)); //해당 글 가져오기
		
		int score = serviceRe.getScore(bno); //리뷰 댓글마다 달린 점수의 총합 구하기
		int replyCnt = (int)service.getReplyCnt(bno); //리뷰댓글 수 가져오기
		int result; //평점 내기
		if(score==0 || replyCnt ==0) {
			result=0;
		}else {
			result = score/replyCnt;
		}
		model.addAttribute("score",result);
	}
	
	//글 수정
	@PreAuthorize("principal.username == #place.writer")
	@PostMapping("/modify")//modify.jsp
	public String modify(PlaceVO place, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("place modify : "+place);
		
		if(service.modify(place)) {
			rttr.addFlashAttribute("result","글이 수정되었습니다.");
		}
		
		//넘기는 페이지에 값 전달
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		//검색된 결과 리스트로 돌아오도록
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		
		return "redirect:/place/list";
	}
	
	//글 삭제
	@PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("place remove : "+bno);
		
		List<PlacePhotoVO> photoList = service.getPhotoList(bno);
		if(service.remove(bno)) {
			//delete photo files
			deleteFiles(photoList);
			
			rttr.addFlashAttribute("result","글이 삭제되었습니다.");
		}
		
		//넘기는 페이지에 값 전달
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		//검색된 결과 리스트로 돌아오도록
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
				
		return "redirect:/place/list";
	}
	
	//사진 목록 가져오기
	@GetMapping(value = "/getPhotoList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody //서버와 클라이언트 간 통신 역할
	public ResponseEntity<List<PlacePhotoVO>> getPhotoList(Long bno){
		log.info("getPhotoList : "+ bno);
		return new ResponseEntity<>(service.getPhotoList(bno),HttpStatus.OK);
	}
	
	//게시글 속 사진(들) 삭제
	private void deleteFiles(List<PlacePhotoVO> photoList) {
		if(photoList == null || photoList.size() <= 0) {
			return;
		}
		log.info("delete photo files!");
		log.info(photoList);
		
		photoList.forEach(attach -> {
			try {
				//파일 삭제
				Path file = Paths.get("C:\\place\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				//이미지 파일인 경우
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\place\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error"+e.getMessage());
			}//end catch			
		});//end foreach
	}
}