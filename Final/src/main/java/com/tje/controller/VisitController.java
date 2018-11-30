package com.tje.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tje.model.Member;
import com.tje.model.VisitView;
import com.tje.service.VisitService;

@Controller
public class VisitController {

	@Autowired
	private VisitService service;
	
	@RequestMapping("/visit")
	public String visitInsert(Model model, VisitView visitView, HttpSession session) {
		
		Member loginMember = (Member)session.getAttribute("loginmember");
		String member_id = loginMember.getMember_id();
		
		// 여기도 로그인된 아이디값 가져와야됨.
		visitView.setMember_id(member_id);
		model.addAttribute("visitLog", service.visitSelect(visitView));
		
		return "visit/visit";
	}
	
}
