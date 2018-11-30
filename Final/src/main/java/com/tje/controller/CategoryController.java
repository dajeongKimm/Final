package com.tje.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tje.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService service;
	
	
	@RequestMapping("/best/rank")
	public String bestRanking(Model model) {

		// 리스트
		model.addAttribute("bestRanking", service.bestRanking5());
		
		return "category/bestRanking";
	}
	
	@RequestMapping("/best/score")
	public String bestScore(Model model) {

		// 리스트
		model.addAttribute("bestScore", service.bestScore());
		
		return "category/bestScore";
	}
	
	@RequestMapping("/best/review")
	public String bestReview(Model model) {
		
		model.addAttribute("bestReview", service.bestReview());
		
		return "category/bestReview";
	}

	
}
