package com.std.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.std.domain.Criteria;
import com.std.domain.PageDTO;
import com.std.domain.QaVO;
import com.std.service.QaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor
public class QaController {
	
	private QaService service;
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list :" + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		log.info("total: "+total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@PostMapping("/register")
	public String questionRegi(QaVO qa, RedirectAttributes rttr) {
		log.info("QuestionRegister: " + qa);
		service.questionRegi(qa);
		return "redirect:/qna/list";
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("questionNo") Long questionNo, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("qna", service.get(questionNo));
	}

	@PostMapping("/modify")
	public String modify(QaVO qa,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify : " + qa);

		if (service.questionModi(qa)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/qna/list" + cri.getListLink();
		
	}
	
//	@RequestMapping(value = "/testModify")
//	public ModelAndView testModify() {
//		ModelAndView mv = new ModelAndView("/home");
//		return mv;
//	}
	
	@PostMapping({"/qRemove","/aRemove"})
	public String remove(@RequestParam("questionNo") Long questionNo, Criteria cri,  RedirectAttributes rttr) {
		log.info("remove..." + questionNo);
		if (service.questionDel(questionNo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/qna/list" + cri.getListLink();
	}

}
