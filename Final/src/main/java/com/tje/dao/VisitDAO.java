package com.tje.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tje.model.*;


@Repository
public class VisitDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.tje.model.VisitMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int visitInsert(Visit visit) {
		return this.sqlSession.insert(strNameSpace + ".visitInsert", visit);
	}
	
	public List<VisitView> visitSelect(VisitView visistView){
		return this.sqlSession.selectList(strNameSpace + ".visitSelect", visistView);
	}
}
