package com.tje.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.tje.model.*;
import java.util.*;

@Repository
public class SimpleReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strNameSpace = "com.tje.model.SimpleReviewMapper";
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 리뷰 리스트 select
	public List<ReviewListView> selectList(Map<String, Integer> map){
		return sqlSession.selectList(strNameSpace + ".selectSimpleReviewList", map);
	}
	
	public List<ReviewListView> selectList(int restaurant_id) {
		return sqlSession.selectList(strNameSpace + ".selectAllSimpleReview", restaurant_id);
	}
	
	// 리뷰 1개 select
	public SimpleReview select(int simple_review_id) {
		return sqlSession.selectOne(strNameSpace + ".selectSimpleReview", simple_review_id);
	}
	
	// 리뷰 전체 카운트
	public int allCount(int restaurant_id) {
		return sqlSession.selectOne(strNameSpace + ".selectSimpleReviewCount", restaurant_id);
	}
	
	public SimpleReviewScore selectScore(int simple_review_score_id) {
		return sqlSession.selectOne(strNameSpace + ".selectSimpleReviewScore", simple_review_score_id);
	}
	
	
	
	// 리뷰 작성 이전 insert (3개)
	public int insert(SimpleReviewScore simpleReviewScore) {
		return sqlSession.insert(strNameSpace + ".insertSimpleReviewScore", simpleReviewScore);
	}
	
	public int insert(SimpleReviewLike simpleReviewLike) {
		return sqlSession.insert(strNameSpace + ".insertSimpleReviewLike", simpleReviewLike);
	}
	
	public int insert(SimpleReviewNotify simpleReviewNotify) {
		return sqlSession.insert(strNameSpace + ".insertSimpleReviewNotify", simpleReviewNotify);
	}
	
	// 리뷰  포토 insert
	public int insert(SimpleReviewFile simpleReviewFile) {
		return sqlSession.insert(strNameSpace + ".insertFileName", simpleReviewFile);
	}
	
	// 리뷰 insert
	public int insert(SimpleReview simpleReview) {
		return sqlSession.insert(strNameSpace + ".insertSimpleReview", simpleReview);
	}
	
	public int insert(Map<String, Integer> map) {
		return sqlSession.update(strNameSpace + ".insertSumScore", map);
	}
	
	
	
	
	
	// 리뷰 delete
	public int deleteReview(SimpleReview selectReview) {
		return sqlSession.delete(strNameSpace + ".deleteSimpleReview", selectReview);
	}
	
	public int deleteScore(int simple_review_score_id) {
		return sqlSession.delete(strNameSpace + ".deleteSimpleReviewScore", simple_review_score_id);
	}
	
	public int deleteLike(int simple_review_like_id) {
		return sqlSession.delete(strNameSpace + ".deleteSimpleReviewLike", simple_review_like_id);
	}
	
	public int deleteNotify(int simple_review_notify_id) {
		return sqlSession.delete(strNameSpace + ".deleteSimpleReviewNotify", simple_review_notify_id);
	}
	
	public int deleteFile(int simple_review_file_id) {
		return sqlSession.delete(strNameSpace + ".deleteSimpleReviewFile", simple_review_file_id);
	}
	
	public int delete(Map<String, Integer> map) {
		return sqlSession.delete(strNameSpace + ".deleteSumScore", map);
	}
	


	// 리뷰 update
	public int update(SimpleReviewScore simpleReviewScore) {
		return sqlSession.update(strNameSpace + ".updateSimpleReviewScore", simpleReviewScore); 
	}
	
	public int update(SimpleReviewFile simpleReviewFile) {
		return sqlSession.update(strNameSpace + ".updateSimpleReviewFile", simpleReviewFile);
	}
	
	public int update(Map<String, Integer> map) {
		return sqlSession.update(strNameSpace + ".updateSumScore", map);
	}
	
	public int update(SimpleReview simpleReview) {
		return sqlSession.update(strNameSpace + ".updateSimpleReview", simpleReview);
	}
	
	
	// 좋아요
	public int selectLikeCount(int simple_review_id) {
		return sqlSession.selectOne(strNameSpace + ".getLikeCount", simple_review_id);
	}
	
	public int addLikeCount(int simple_review_like_id) {
		return sqlSession.update(strNameSpace + ".addLikeCount", simple_review_like_id);
	}
	
	public int cancelLikeCount(int simple_review_like_id) {
		return sqlSession.update(strNameSpace + ".cancelLikeCount", simple_review_like_id);
	}
	
	
	// 싫어요
	public int selectBadCount(int simple_review_id) {
		return sqlSession.selectOne(strNameSpace + ".getBadCount", simple_review_id);
	}
	
	public int addBadCount(int simple_review_notify_id) {
		return sqlSession.update(strNameSpace + ".addBadCount", simple_review_notify_id);
	}
	
	public int cancelBadCount(int simple_review_notify_id) {
		return sqlSession.update(strNameSpace + ".cancelBadCount", simple_review_notify_id);
	}
}
