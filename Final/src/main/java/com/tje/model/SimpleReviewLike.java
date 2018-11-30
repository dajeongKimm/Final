package com.tje.model;

public class SimpleReviewLike {

	private int simple_review_like_id;
	private int simple_review_like_count;
	private int restaurant_id;
	private String member_id;
	
	public SimpleReviewLike() {}
	
	public SimpleReviewLike(int simple_review_like_id, int simple_review_like_count, int restaurant_id,
			String member_id) {
		this.simple_review_like_id = simple_review_like_id;
		this.simple_review_like_count = simple_review_like_count;
		this.restaurant_id = restaurant_id;
		this.member_id = member_id;
	}

	
	public int getSimple_review_like_id() {
		return simple_review_like_id;
	}

	public void setSimple_review_like_id(int simple_review_like_id) {
		this.simple_review_like_id = simple_review_like_id;
	}

	public int getSimple_review_like_count() {
		return simple_review_like_count;
	}

	public void setSimple_review_like_count(int simple_review_like_count) {
		this.simple_review_like_count = simple_review_like_count;
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
	
	
}
