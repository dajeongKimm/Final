package com.tje.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tje.dao.SimpleReviewDAO;
import java.util.*;
import com.tje.model.*;

@Service
public class SimpleReviewService {

	@Autowired
	private SimpleReviewDAO dao;
	
	public void setDao(SimpleReviewDAO dao) {
		this.dao = dao;
	}
	
	public List<ReviewListView> selectList(Map<String, Integer> map){
		return this.dao.selectList(map);
	}
	
	public SimpleReview selectOne(int simple_review_id) {
		return this.dao.select(simple_review_id);
	}
	
	public SimpleReviewScore selectOneScore(int simple_review_score_id) {
		return this.dao.selectScore(simple_review_score_id);
	}
	
	@Transactional
	public int insert(SimpleReview simpleReview, Map<String, Integer> map) {
		this.dao.insert(simpleReview.getSimpleReviewScore());
		this.dao.insert(simpleReview.getSimpleReviewLike());
		this.dao.insert(simpleReview.getSimpleReviewNotify());
		this.dao.insert(simpleReview.getSimpleReviewFile());
		
		this.dao.insert(map);
		
		return this.dao.insert(simpleReview);
	}
	
	@Transactional
	public int delete(SimpleReview selectReview, Map<String, Integer> map) {
		this.dao.deleteReview(selectReview);
		this.dao.deleteScore(selectReview.getSimple_review_score_id());
		this.dao.deleteLike(selectReview.getSimple_review_like_id());
		this.dao.deleteNotify(selectReview.getSimple_review_notify_id());
		this.dao.deleteFile(selectReview.getSimple_review_file_id());
		
		return this.dao.delete(map);
	}
	
	
	@Transactional
	public int update(SimpleReview simpleReview, Map<String, Integer> map) {
		this.dao.update(simpleReview.getSimpleReviewScore());
		this.dao.update(simpleReview.getSimpleReviewFile());
		this.dao.update(map);
		
		return this.dao.update(simpleReview);
	}
	
	public int allCount(int restaurant_id) {
		return this.dao.allCount(restaurant_id);
	}
	
	
	
	
	// 좋아요
	@Transactional
	public int likeCount(SimpleReview simpleReview) {
		this.dao.addLikeCount(simpleReview.getSimple_review_like_id());
		return this.dao.selectLikeCount(simpleReview.getSimple_review_id());
	}
	
	
	// 싫어요
	@Transactional
	public int badCount(SimpleReview simpleReview) {
		this.dao.addBadCount(simpleReview.getSimple_review_notify_id());
		return this.dao.selectBadCount(simpleReview.getSimple_review_id());
	}
}
