package com.tje.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tje.dao.MemberUpdateDAO;
import com.tje.model.Member;
import com.tje.model.Member_address;

@Service
public class MemberUpdateService {
		@Autowired
		private MemberUpdateDAO dao;
		
		public void setDao(MemberUpdateDAO dao) {
			this.dao = dao;
		}

		
		
		public boolean CKpassword(Member member) {
			System.out.println("SERVICE ID:" +member.getMember_id());
			System.out.println("SERVICE PW:" +member.getMember_password());
			
			return this.dao.CKpassword(member);
		}
		public boolean CKpassword2(Member member) {
			return this.dao.CKpassword2(member);
		}
		
		@Transactional
		public int delete(Member member) {
			System.out.println("@Transactional ID:" +member.getMember_id());
			System.out.println("@Transactional PW:" +member.getMember_address_id());
			member.setMember_address(new Member_address());
			member.getMember_address().setMember_address_id(member.getMember_address_id());
			System.out.println("a"+member.getMember_address());
			this.dao.deleteMember(member);
			
			return this.dao.deleteAddress(member.getMember_address());
		}
}
