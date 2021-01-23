package com.std.controller;


import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.std.domain.Criteria;
import com.std.domain.FreeVO;
import com.std.domain.PageDTO;
import com.std.service.FreeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/free/*")
@AllArgsConstructor
@Controller
public class FreeController {

	private FreeService service;
	
	@GetMapping("/list")		//전체 목록의 페이지 나누기
	public void list(Criteria cri,Model model) {
		log.info("list...: "+ cri);
		model.addAttribute("list", service.getList(cri));
		int total = service.getTotal(cri);		//전체 페이지 수 처리
		log.info("total : "+total);
		model.addAttribute("pageMaker",new PageDTO(cri, total));
	}
	
	@GetMapping("/register")//등록처리
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
	
	@PostMapping("/register")		//등록처리
	@PreAuthorize("isAuthenticated()")
	public String register(FreeVO free,RedirectAttributes rttr) {
		log.info("register : "+free);
		service.register(free);
		rttr.addFlashAttribute("result",free.getFno());	//Model
		return "redirect:/free/list";		//url 경로
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping({"/get","/modify"})		//상세조회
	public void get(@RequestParam("fno") Long fno,@ModelAttribute("cri") Criteria cri,Model model) {
		log.info("/get or /modify");
		model.addAttribute("free",service.get(fno));
	}
	
	@PreAuthorize("(principal.username == #writer) or hasRole('ROLE_ADMIN')")
	@PostMapping("/modify")		//수정처리
	public String modify(FreeVO free, Criteria cri, RedirectAttributes rttr, String writer) {
		log.info("modify: "+free);
		if(service.modify(free)) {
			rttr.addFlashAttribute("result","success");
		}
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/free/list";
	}
	
	@PreAuthorize("(principal.username == #writer) or hasRole('ROLE_ADMIN')")
	@PostMapping("/remove")		//삭제처리
	public String remove(@RequestParam("fno") Long fno, Criteria cri, RedirectAttributes rttr, String writer) {
		log.info("remove: " + fno);
		
		if(service.remove(fno)) {
			rttr.addFlashAttribute("result","success"); //일회성 전달
		}
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());
		return "redirect:/free/list";
	}	
}
