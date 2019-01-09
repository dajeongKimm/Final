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
	private String strNameSpace2 = "com.tje.model.MemberMapper";

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

	public int updateMember(Member member) {
		System.out.println(member.getMember_id());
		System.out.println(member.getMember_email());
		System.out.println(member.getMember_nickname());
		System.out.println(member.getMember_tel());
		
		return sqlSession.update(strNameSpace2 + ".updateMember",member);
	}
	
	public int updateMember_m(Member member) {

		
		return sqlSession.update(strNameSpace2 + ".MobileUpdateMember",member);
	}

	public int updateMemberAddress(Member_address member_address) {
		
		System.out.println("주소 먼저 수정");
		System.out.println(member_address.getAddress_postcode());
		System.out.println(member_address.getAddress_general());
		System.out.println(member_address.getAddress_detail());
		
		
		return sqlSession.update(strNameSpace2 + ".updateAddress",member_address);
		
	}

}
