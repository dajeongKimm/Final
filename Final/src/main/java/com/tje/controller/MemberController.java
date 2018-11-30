package com.tje.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.tje.model.Member;
import com.tje.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

	//메인페이지이동
	@RequestMapping(value="member/main" ,method=RequestMethod.GET)
	public String mainPage( ) {
		
	return "${pageContext.request.contextPath}/Final/";
	}
	
	
	//회원정보(my page) 폼으로 이동
	@RequestMapping(value="/member/myPage", method=RequestMethod.GET)
	public String myPageUpdate1() {
		
		return "member/myPage";
	}
	
	

	
	//회원가입 폼으로 이동
	@RequestMapping(value="/member/insert", method=RequestMethod.GET)
	public String insertMemberForm() {
		return "member/insertForm";
	}
	
	@RequestMapping(value="/member/insert", method=RequestMethod.POST)
	public String insertMember(Model model, Member member) {
		
		
		//member
		
		member.getMember_id();
		member.getMember_password();
		member.getMember_name();
		member.getMember_nickname();
		member.getMember_tel();
		member.getMember_address().getAddress_city();
		member.getMember_address().getAddress_gu();
		member.getMember_address().getAddress_dong();
		member.getMember_address().getAddress_detail();
		member.getMember_address().getAddress_postcode();
		member.getMember_email();
		
		member.getMember_birthday();
		member.getMember_gender();
		member.getMember_photo();
		
		System.out.println(member.getMember_id());
		System.out.println(member.getMember_password());
		System.out.println(member.getMember_name());
		System.out.println(member.getMember_nickname());
		System.out.println(member.getMember_tel());
		System.out.println(member.getMember_address().getAddress_city());
		System.out.println(member.getMember_address().getAddress_gu());
		System.out.println(member.getMember_address().getAddress_dong());
		System.out.println(member.getMember_address().getAddress_detail());
		System.out.println(member.getMember_address().getAddress_postcode());
		System.out.println(member.getMember_email());
		System.out.println(member.getMember_birthday());
		System.out.println(member.getMember_gender());
		System.out.println(member.getMember_photo());
		//주소 insert
		
		//주소포함한 member정보 insert
		
		model.addAttribute("result", service.insert(member));
		
		return "member/insertSuccess";
	}
	
	//로그인 
	@RequestMapping(value="member/login" ,method=RequestMethod.GET)
	public String login( ) {
	return "member/loginForm";
	}
	
	
	@RequestMapping(value="member/login" ,method=RequestMethod.POST)
	public String login( Member member, HttpSession session) {
		
		
		
		member = service.login(member);
		
		System.out.println("service login : "+member);
		String msg;
		if (member == null) {
			msg = "회원정보가 맞지 않습니다.";
			return "member/loginResult";
		}else {
			
			session.setAttribute("loginmember", member);
			msg = "회원정보가 맞습니다.";
			
			System.out.println("세선 ID : " + session.getId());
			
			System.out.println(msg);
			return "member/loginResult";
			//"member/mainForm"
		}
		
	}
	//로그아웃
	@RequestMapping(value="member/logout" ,method=RequestMethod.GET)
	public String mainLogout(HttpSession session,HttpServletRequest req , HttpServletResponse res) throws Exception {
		session =req.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		
		
		res.sendRedirect(req.getContextPath()+"/");
		
		System.out.println(session);
		return null;

	
	}
	@RequestMapping(value="member/session" ,method=RequestMethod.GET)
	public String mainLogoutCK(HttpSession session,HttpServletRequest req , HttpServletResponse res) throws Exception {
		
		System.out.println(session);
		res.sendRedirect(req.getContextPath()+"/");
		return null;

		  
	}
	
	
	//회원가입
	//ID중복체크
	@ResponseBody
	@RequestMapping(value="member/checkId/{member_id}", method=RequestMethod.POST)
	public String checkId(@PathVariable("member_id") String member_id) {
		
		System.out.println(member_id);
		
		Member member = new Member();
		member.setMember_id(member_id);
		
		Member result = service.selectOne(member);
		String msg;
		System.out.println(member_id + " ////  " + result);
		
		if(member_id.length()<4) {
			msg = "ID를 4글자이상 입력해주세요.";
		}else if( result == null ) {
			msg = "사용 가능한 ID 입니다.";
		}else {
			msg = "이미 사용중인 ID 입니다.";
		}
		System.out.println(msg);
		
		return "{\"value\" : \"" + msg + "\"}";
		
	}
	
	//닉네임 중복체크
	@ResponseBody
	@RequestMapping(value="member/checkNick/{member_nickname}", method=RequestMethod.POST)
	public String checkNickname(@PathVariable("member_nickname") String member_nickname) {
		
		System.out.println(member_nickname);
		
		Member member = new Member();
		member.setMember_nickname(member_nickname);
		
		Member result = service.CKnickName(member);
		String msg;
		System.out.println("result"+result);
		if( result == null )
			msg = "사용 가능한 별명 입니다.";
		else
			msg = "이미 사용중인 별명 입니다.";
		
		return "{\"value\" : \"" + msg + "\"}";
		
	} 
	
	
//	// 채팅 
//		@RequestMapping("/ws-echo")
//		public String echo_ws(HttpSession session, HttpServletRequest request) {
//			
//			
//			session = request.getSession(false);
//			System.out.println("세션 정보 :"+session.getAttribute("loginmember"));
//			return "chat/chattingview";
//		}
}
