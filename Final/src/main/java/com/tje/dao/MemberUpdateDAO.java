package com.tje.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tje.model.Member;
import com.tje.model.Member_address;

@Repository
public class MemberUpdateDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "MemberUpdateMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public boolean CKpassword(Member member) {
		boolean result = false;
		System.out.println("DAO ID : " + member.getMember_id());
		System.out.println("DAO PW : " + member.getMember_password());

		int count = sqlSession.selectOne(strNameSpace + ".CKpassword", member);
		if (count == 1) {
			System.out.println("DAD_if : " + count);
			result = true;
			System.out.println("DAO_result : " + result);

		}
		return result;
	}

	public boolean CKpassword2(Member member) {
		boolean result = false;
		int count = sqlSession.selectOne(strNameSpace + ".CKpassword", member);

		if (count == 1) {
			System.out.println(count);
			result = true;
			System.out.println("CKPASS : "+ result);
		}

		return result;
	}

	public int deleteAddress(Member_address member_address) {
		return sqlSession.delete(strNameSpace + ".deleteAddress", member_address);
	}

	public int deleteMember(Member member) {
		return sqlSession.delete(strNameSpace + ".deleteMember", member);
	}

}
