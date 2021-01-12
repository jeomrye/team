package com.std.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.std.domain.NoticeVO;
import com.std.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/notice/*")
@AllArgsConstructor
public class NoticeController {
	private NoticeService service;

//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list", service.getList());
//	}
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("list : " + cri);
		model.addAttribute("list", service.getList(cri));

		int total = service.getTotal(cri);
		log.info("total : " + total);

		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@PostMapping("/register")
	public String register(NoticeVO notice, RedirectAttributes rttr) {

		log.info("register : " + notice);

		service.regNotice(notice);
		rttr.addFlashAttribute("result", notice.getNotNo());
		return "redirect:/notice/list";
	}

	@GetMapping("/register")
	public void register() {

	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("notNo") Long notNo, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("notice", service.getNotice(notNo));
	}

	@PostMapping("/modify")
	public String modify(NoticeVO notice, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify : " + notice);

		if (service.modifyNotice(notice)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/notice/list" + cri.getListLink();
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("notNo") Long notNo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove....." + notNo);
		if (service.deleteNotice(notNo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/notice/list" + cri.getListLink();
	}
}
