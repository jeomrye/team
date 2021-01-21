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
import com.std.domain.FaqVO;
import com.std.domain.PageDTO;
import com.std.service.FaqService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/faq/*")
@AllArgsConstructor
public class FaqController {
	
	private FaqService service;
	
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		log.info("list :" + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		log.info("total: "+total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@PostMapping("/register")
	public String register(FaqVO faq, RedirectAttributes rttr) {
		log.info("register: " + faq);
		service.register(faq);
		return "redirect:/faq/list";
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("faqNo") Long faqNo, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("faq", service.get(faqNo));
	}

	@PostMapping("/modify")
	public String modify(FaqVO faq,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("modify : " + faq);

		if (service.modify(faq)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/faq/list" + cri.getListLink();
		
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam(value = "faqNo", required = false) Long faqNo, Criteria cri, RedirectAttributes rttr) {
		log.info("remove..." + faqNo);
		if (service.delete(faqNo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/faq/list" + cri.getListLink();
	}

}
