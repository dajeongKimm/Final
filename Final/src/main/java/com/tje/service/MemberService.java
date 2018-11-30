package com.tje.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tje.dao.*;
import com.tje.model.*;
import java.util.*;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	public void setDao(MemberDAO dao) {
		this.dao=dao;
	}
	
	public Member selectOne(Member member){
		return this.dao.selectOne(member);
	}
	public Member CKnickName(Member member){
		return this.dao.CKnickName(member);
	}
	public Member login(Member member) {
		return this.dao.login(member);
	}
	
	@Transactional
	public int insert(Member member) {
		
		this.dao.insert(member.getMember_address());
		
		return this.dao.insert(member);
	}
}
