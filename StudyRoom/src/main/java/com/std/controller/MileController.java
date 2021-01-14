package com.std.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.std.domain.CouponVO;
import com.std.service.CouponService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/coupon/*")
@AllArgsConstructor
public class MileController {

	private CouponService  service;
	
	//���� ��Ͽ� ���� ó��
	@GetMapping("/couponList")
	public void couponList(Model model) {
		
		log.info("couponList");
		
		model.addAttribute("list", service.couponGetList());
	}
	
	//���� ��� ó���� �׽�Ʈ
	@PostMapping("/couponResister")
	public String couponResister(CouponVO coupon, RedirectAttributes rttr) {
		
		log.info("CouponResister : " + coupon);
		
		service.couponRegister(coupon);
		
		rttr.addFlashAttribute("result", coupon.getCouponNumber());
		
		return "redirect:/coupon/couponList";
	}
	
	//���� ��ȸ ó���� �׽�Ʈ
	@GetMapping("/couponGet")
	public void couponGet(@RequestParam("couponNumber") int couponNumber, Model model) {
		
		log.info("/couponGet");
		
		model.addAttribute("coupon", service.couponGet(couponNumber));
	}
	
	//���� ���� ó���� �׽�Ʈ
	@PostMapping("/couponModify")
	public String couponModify(CouponVO coupon, RedirectAttributes rttr) {
		log.info("couponModify : " + coupon);
		
		if(service.couponModify(coupon)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/coupon/couponList";
	}
	
	//���� ���� ó���� �׽�Ʈ
	@PostMapping("/couponRemove")
	public String couponRemove(@RequestParam("couponNumber") int couponNumber, RedirectAttributes rttr) {
		
		log.info("couponRemove : " + couponNumber);
		if(service.couponRemove(couponNumber)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/coupon/couponList";
	}
	
	//��� �Է� �������� ��� ó��
	@GetMapping("/couponRegister")
	public void couponRegister() {
		
	}
}
