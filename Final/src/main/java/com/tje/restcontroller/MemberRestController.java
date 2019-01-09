package com.tje.restcontroller;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.tje.model.Member;
import com.tje.model.Member_address;
import com.tje.service.MemberService;
import com.tje.service.MemberUpdateService;


@RestController
public class MemberRestController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private MemberUpdateService updateService;
	

	
	@RequestMapping(value="/member/insert.m", method=RequestMethod.POST)
	public String insertMember(Member member,Member_address member_address) {
		


		service.insert(member);
		System.out.println(member.getMember_id());
		
		
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String strJson = gson.toJson(member);

		return strJson;
	}
	
	// 마이페이지로 맴버 객체 정보 넘김
	@RequestMapping(value="/mypage.m",method=RequestMethod.POST)
	public String mypage(Member member) {
		
		
		
		//HashMap<String, Object> map = new HashMap<>();
		
		
		Gson gson = new Gson();
		String data = gson.toJson(member);
		
		return data;
				

	}
	// 회원 정보 수정
	@RequestMapping(value = "/member/myPageUpdate.m", method = RequestMethod.POST,produces="application/text; charset=utf-8")
	public String myPageUpdatePOST(Member member,Member_address member_address) throws Exception {
		
	
		System.out.println(member);
		updateService.updateMember_m(member);
				
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String strJson = gson.toJson(member);
		System.out.println("모바일 업데이트 정보 :"+strJson);


		return strJson;
	}

	
	// 로그인
	@RequestMapping(value="member/login.m" ,method=RequestMethod.POST,produces="application/text; charset=utf-8")
	public String login( Member member, HttpSession session) {
		
		
		
	
		
		member = service.login(member);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String strJson = gson.toJson(member);
		
		System.out.println("service login : "+member);
		String msg;
		if (member == null) {
			msg = "회원정보가 맞지 않습니다.";
			System.out.println(msg);
			session.invalidate();
			return null;
		}else {
			
			session.setAttribute("loginmember", member);
			msg = "회원정보가 맞습니다.";
			System.out.println("세선 ID : " + session.getId());
			System.out.println(msg);
			System.out.println(strJson);
			
			return strJson;
			
			//"member/mainForm"
		}
		
	}
	
	
	//로그아웃
	@RequestMapping(value="member/logout.m" ,method=RequestMethod.GET)
	public String mainLogout(HttpSession session,HttpServletRequest req , HttpServletResponse res) throws Exception {
		session =req.getSession(false);
		
		
		if(session != null) {
			session.invalidate();
		}
		
		
	//	res.sendRedirect(req.getContextPath()+"/");
		
		System.out.println(session);

		return null;

	
	}
	
/*	@RequestMapping(value="member/session" ,method=RequestMethod.GET)
	public String mainLogoutCK(HttpSession session,HttpServletRequest req , HttpServletResponse res) throws Exception {
		
		System.out.println(session);
		res.sendRedirect(req.getContextPath()+"/");
		return null;

		  
	}*/
	
	
	//ID중복체크
	
	@RequestMapping(value="member/checkId.m", method=RequestMethod.POST)
	public String checkId(String member_id) {
		
		System.out.println("검색을 요청한 ID : "+member_id);
		
		int count = 0;
		HashMap<Object,Object> map = new HashMap<>();
		
		count = service.idcheck(member_id);
		map.put("count",count);
		System.out.println("아이디 체크 카운트 : "+count);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String strJson = gson.toJson(map);

		return strJson;
		
	}
	
	//닉네임 중복체크
	@RequestMapping(value="member/checkNickname.m", method=RequestMethod.POST)
	public String checkNickname(String member_nickname) {
		
		System.out.println("검색을 요청한 닉네임 : "+member_nickname);
		
		int count = 0;
		HashMap<Object,Object> map = new HashMap<>();
		
		count = service.nicknamecheck(member_nickname);
		map.put("count",count);
		System.out.println("아이디 체크 카운트 : "+count);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String strJson = gson.toJson(map);

		return strJson;
		
	}
	
	
	
	
	
}
