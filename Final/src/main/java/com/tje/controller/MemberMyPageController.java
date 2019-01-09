package com.tje.controller;

import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tje.model.Member;
import com.tje.service.MemberService;
import com.tje.service.MemberUpdateService;

@Controller
public class MemberMyPageController {

	@Autowired
	private MemberUpdateService service;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/member/myPageUpdate", method = RequestMethod.GET)
	public String myPageUpdate2() {

		return "member/myPageUpdate";
	}

	@RequestMapping(value = "/member/myPageUpdate", method = RequestMethod.POST)
	public String myPageUpdatePOST(Member member, HttpServletRequest req,
			HttpServletResponse res,HttpSession session) throws Exception {
		
	
	//	Object object = session.getAttribute("loginmember");
		HttpSession updateSession;
		updateSession = session;
		
		
	
		service.updateMember(member);
		

		session.removeAttribute("loginmember");
		//session.invalidate();
		

		
	
			
		member = memberService.login(member);	
			
		if (member == null) {
			System.out.println("로그인 실패");
			return "member/loginResult";
		}else {
			System.out.println("업데이트 실시간 반영");
			
			
			session.setAttribute("loginmember", member);
			//"member/mainForm"
		}


		
		return "member/myPage";
	}

	@RequestMapping(value = "/member/myPagePasswordUpdate", method = RequestMethod.GET)
	public String myPageUpdate3() {

		return "member/myPagePasswordUpdate";
	}

	@RequestMapping(value = "/member/myPagePasswordUpdate", method = RequestMethod.POST)
	public String myPageUpdate4(@PathVariable("member_password1") String member_password1, Model model, Member member) {
		member.getMember_id();
		member.getMember_password();

		boolean result = service.CKpassword(member);
		System.out.println(result);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put(member.getMember_id(), member_password1);

		/*
		 * map.get();
		 * 
		 * 
		 * if (result) { model.addAttribute("UpdatePW", service.) }
		 */
		return "member/myPagePasswordUpdate";
	}

	@RequestMapping(value = "/member/myPageDelete", method = RequestMethod.GET)
	public String myPage() {

		return "member/myPageDelete";
	}

	@RequestMapping(value = "/member/myPageDelete", method = RequestMethod.POST)
	public String myPageDelete(Model model, Member member, HttpSession session, HttpServletRequest req) {

		session = req.getSession(false);

		System.out.println(member.getMember_id());
		System.out.println(member.getMember_password());

		member.getMember_address_id();
		System.out.println(member.getMember_address_id());
		boolean result = service.CKpassword(member);

		System.out.println("result : " + result);
		if (session != null) {
			if (result) {
				result = true;
				session.invalidate();
				model.addAttribute("result", service.delete(member));
				return "member/myPageDeleteSuccess";

			} else {
				result = false;
				model.addAttribute("result2", "아이디 패스워드 불일치");
				return "member/myPageDeleteSuccess";
			}
		}
		return "member/myPageDelete";

	}

	@RequestMapping(value = "/member/myPageDeleteSuccess", method = RequestMethod.GET)
	public String myPage2() {

		return "member/myPageDeleteSuccess";
	}

}
