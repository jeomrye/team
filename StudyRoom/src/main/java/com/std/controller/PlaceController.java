package com.std.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.std.domain.Criteria;
import com.std.service.PlaceService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/place/*")
@AllArgsConstructor
public class PlaceController {
	private PlaceService service;
	
	public void list(Criteria cri, Model model) {
		log.info("list : "+cri);
	
	}
}
