package com.tje.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tje.model.*;


@Repository
public class SearchRankDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.tje.model.SearchRankMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//검색어 추가
	public int searchRankInsert(SearchRank searchRank) {
		return this.sqlSession.insert(strNameSpace + ".searchRankInsert", searchRank);
	}
	
	//기존의 검색어가 있는지 확인
	public SearchRank checkKeyword(SearchRank searchRank){
		return this.sqlSession.selectOne(strNameSpace + ".checkKeyword", searchRank);
	}
	
	//기존검색어가 있다면 count update
	public int updateCount(SearchRank searchRank) {
		return this.sqlSession.update(strNameSpace + ".updateCount", searchRank);
	}
	
	//검색어 순위별로 정렬
	public List<SearchRank> searchRankSelect(){
		return this.sqlSession.selectList(strNameSpace + ".searchRankSelect");
	}
}
