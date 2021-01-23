package com.std.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.std.domain.CouponAttachVO;
import com.std.domain.CouponVO;
import com.std.domain.Criteria;
import com.std.domain.PageDTO;
import com.std.service.CouponService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/coupon/*")
@AllArgsConstructor
public class MileController {

	private CouponService  service;
	
	//쿠폰 목록에 대한 처리
//	@GetMapping("/couponList")
//	public void couponList(Model model) {
//		
//		log.info("couponList");
//			
//		model.addAttribute("list", service.couponGetList());
//	}
	@GetMapping("/couponList")
	public void couponList(Criteria cri, Model model) {
		
		log.info("couponList : " + cri);
		model.addAttribute("couponList", service.couponGetList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	//쿠폰 등록 처리와 테스트
	@PostMapping("/couponRegister")
	public String couponResister(CouponVO coupon, RedirectAttributes rttr) {
		
		log.info("==============================");
		
		log.info("CouponRegister : " + coupon);
			
		if(coupon.getAttachList() != null) {
			coupon.getAttachList().forEach(attach -> log.info(attach));
		}
		log.info("================================");
		service.couponRegister(coupon);
		rttr.addFlashAttribute("result", coupon.getCouponNumber());
		
		return "redirect:/coupon/couponList";
	}
	
	//쿠폰 조회 와 수정
	@GetMapping({"/couponGet", "/couponModify"})
	public void couponGet(@RequestParam("couponNumber") int couponNumber, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("/couponGet or /couponModify");
		
		model.addAttribute("coupon", service.couponGet(couponNumber));
	}
	
	//쿠폰 수정 
	@PostMapping("/couponModify")
	public String couponModify(CouponVO coupon, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("couponModify : " + coupon);
		
		if(service.couponModify(coupon)) {
			rttr.addFlashAttribute("result", "success");
		}
		
	
		return "redirect:/coupon/couponList" + cri.getListLink();
	}
	
	//쿠폰 삭제 처리와 테스트
	@PostMapping("/couponRemove")
	public String couponRemove(@RequestParam("couponNumber") int couponNumber, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("couponRemove : " + couponNumber);
		
		List<CouponAttachVO> attachList = service.getAttachList(couponNumber);
		
		if(service.couponRemove(couponNumber)) {
			
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}
		
		
		return "redirect:/coupon/couponList" + cri.getListLink();
	}
	
	//등록 입력 페이지와 등록 처리
	@GetMapping("/couponRegister")
	public void couponRegister() {
		
	}
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<CouponAttachVO>> getAttachList(int couponNumber){
		
		log.info("getAttachList : " + couponNumber);
		
		return new ResponseEntity<>(service.getAttachList(couponNumber), HttpStatus.OK);
	}
	
	private void deleteFiles(List<CouponAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files................");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);
				}
			} catch (Exception e) {
				log.error("delete file error"+e.getMessage());
			}
		});
		
	}
	
}