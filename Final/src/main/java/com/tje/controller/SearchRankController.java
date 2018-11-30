package com.tje.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tje.service.SearchRankService;

@Controller
public class SearchRankController {

	@Autowired
	private SearchRankService service;
	
	//검색어 순위
	@RequestMapping("/search/rank")
	public String visitInsert(Model model) {
		
		model.addAttribute("searchRank", service.searchRankSelect());
		
		return "search/rank";
	}
	
}
