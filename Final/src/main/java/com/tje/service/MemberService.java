package com.tje.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tje.dao.*;
import com.tje.model.*;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	public Member selectOne(Member member) {
		return this.dao.selectOne(member);
	}

	public Member CKnickName(Member member) {
		return this.dao.CKnickName(member);
	}

	public Member login(Member member) {

		return this.dao.login(member);
	}
	
	

	
	

	// 아이디 체크 모바일 맵 형식으로 int count 값 전달
	public int idcheck(String member_id) {
		return this.dao.idcheck(member_id);
	}

	// 닉네임 체크 모바일
	public int nicknamecheck(String member_nickname) {
		return this.dao.nicknamecheck(member_nickname);
	}

	// 회원 가입
	@Transactional
	public int insert(Member member) {

		this.dao.insert(member.getMember_address());

		return this.dao.insert(member);
	}



}
