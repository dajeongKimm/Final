package com.tje.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
import com.tje.model.*;

@Repository
public class CategoryDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.tje.model.CategoryMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 검색 순위 베스트 5
	public List<RestaurantListView> bestRanking5() {
		return sqlSession.selectList(strNameSpace + ".bestRanking5");
	}

	// 평점 순위 베트스 5
	public List<RestaurantListView> bestScore() {
		return sqlSession.selectList(strNameSpace + ".bestScore");
	}
	
	// 리뷰가 많은 순 5
	public List<RestaurantListView> bestReview() {
		return sqlSession.selectList(strNameSpace + ".bestReview");
	}
}
