package com.tje.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
import com.tje.model.*;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String strNameSpace = "com.tje.model.MemberMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public Member selectOne(Member member) {
		return sqlSession.selectOne(strNameSpace + ".oneMember", member);
	}
	public Member CKnickName(Member member) {
		return sqlSession.selectOne(strNameSpace + ".CKnickName", member);
	}

	
	// address 자동증가
	public int insert(Member_address member_address) {
		System.out.println(member_address.getMember_address_id());
		return sqlSession.insert(strNameSpace + ".insertAddress", member_address);
	}

	// 멤버 insert
	public int insert(Member member) {
		return sqlSession.insert(strNameSpace + ".insertMember", member);
	}

	public Member login(Member member) {
		return sqlSession.selectOne(strNameSpace + ".login", member);
	}

}
