package com.tje.model;

import java.util.Date;

public class SimpleReview {

	private int simple_review_id;
	private int simple_review_score_id;
	private String simple_review_contents_text;
	private int simple_review_file_id;
	private int restaurant_id;
	private String member_id;
	private int simple_review_like_id;
	private int simple_review_notify_id;
	private Date simple_review_registdate;

	
	private SimpleReviewLike simpleReviewLike;
	private SimpleReviewNotify simpleReviewNotify;
	private SimpleReviewScore simpleReviewScore;
	private SimpleReviewFile simpleReviewFile;
	
	public SimpleReview() {}
	

	
	
	public SimpleReviewFile getSimpleReviewFile() {
		return simpleReviewFile;
	}




	public void setSimpleReviewFile(SimpleReviewFile simpleReviewFile) {
		this.simpleReviewFile = simpleReviewFile;
	}




	public int getSimple_review_id() {
		return simple_review_id;
	}


	public SimpleReviewLike getSimpleReviewLike() {
		return simpleReviewLike;
	}


	public void setSimpleReviewLike(SimpleReviewLike simpleReviewLike) {
		this.simpleReviewLike = simpleReviewLike;
	}


	public SimpleReviewNotify getSimpleReviewNotify() {
		return simpleReviewNotify;
	}


	public void setSimpleReviewNotify(SimpleReviewNotify simpleReviewNotify) {
		this.simpleReviewNotify = simpleReviewNotify;
	}


	public SimpleReviewScore getSimpleReviewScore() {
		return simpleReviewScore;
	}


	public void setSimpleReviewScore(SimpleReviewScore simpleReviewScore) {
		this.simpleReviewScore = simpleReviewScore;
	}


	public void setSimple_review_id(int simple_review_id) {
		this.simple_review_id = simple_review_id;
	}


	public int getSimple_review_score_id() {
		return simple_review_score_id;
	}


	public void setSimple_review_score_id(int simple_review_score_id) {
		this.simple_review_score_id = simple_review_score_id;
	}


	public String getSimple_review_contents_text() {
		return simple_review_contents_text;
	}


	public void setSimple_review_contents_text(String simple_review_contents_text) {
		this.simple_review_contents_text = simple_review_contents_text;
	}

	
	
	

	public int getSimple_review_file_id() {
		return simple_review_file_id;
	}




	public void setSimple_review_file_id(int simple_review_file_id) {
		this.simple_review_file_id = simple_review_file_id;
	}




	public int getRestaurant_id() {
		return restaurant_id;
	}


	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public int getSimple_review_like_id() {
		return simple_review_like_id;
	}


	public void setSimple_review_like_id(int simple_review_like_id) {
		this.simple_review_like_id = simple_review_like_id;
	}


	public int getSimple_review_notify_id() {
		return simple_review_notify_id;
	}


	public void setSimple_review_notify_id(int simple_review_notify_id) {
		this.simple_review_notify_id = simple_review_notify_id;
	}


	public Date getSimple_review_registdate() {
		return simple_review_registdate;
	}


	public void setSimple_review_registdate(Date simple_review_registdate) {
		this.simple_review_registdate = simple_review_registdate;
	}
	
	
	
}
