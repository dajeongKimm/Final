package com.tje.model;

import java.text.SimpleDateFormat;
import java.util.*;

public class ReviewListView {

	private int simple_review_id;
	private String member_id;
	private int restaurant_id;
	private int simple_review_like_count;
	private int simple_review_notify_count;
	private String member_nickname;
	private String member_photo;
	private String simple_review_contents_text;
	private String simple_review_file_id;
	private String file_name;
	private int score_flavor;
	private int score_volume;
	private int score_service;
	private int total_score;
	private Date simple_review_registdate;
	
	
	
	public String getSimple_review_file_id() {
		return simple_review_file_id;
	}
	public void setSimple_review_file_id(String simple_review_file_id) {
		this.simple_review_file_id = simple_review_file_id;
	}
	public int getSimple_review_id() {
		return simple_review_id;
	}
	public void setSimple_review_id(int simple_review_id) {
		this.simple_review_id = simple_review_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getRestaurant_id() {
		return restaurant_id;
	}
	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}
	public int getSimple_review_like_count() {
		return simple_review_like_count;
	}
	public void setSimple_review_like_count(int simple_review_like_count) {
		this.simple_review_like_count = simple_review_like_count;
	}
	public int getSimple_review_notify_count() {
		return simple_review_notify_count;
	}
	public void setSimple_review_notify_count(int simple_review_notify_count) {
		this.simple_review_notify_count = simple_review_notify_count;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_photo() {
		return member_photo;
	}
	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}
	public String getSimple_review_contents_text() {
		return simple_review_contents_text;
	}
	public void setSimple_review_contents_text(String simple_review_contents_text) {
		this.simple_review_contents_text = simple_review_contents_text;
	}
	
	
	
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String File_name) {
		this.file_name = File_name;
	}
	public int getScore_flavor() {
		return score_flavor;
	}
	public void setScore_flavor(int score_flavor) {
		this.score_flavor = score_flavor;
	}
	public int getScore_volume() {
		return score_volume;
	}
	public void setScore_volume(int score_volume) {
		this.score_volume = score_volume;
	}
	public int getScore_service() {
		return score_service;
	}
	public void setScore_service(int score_service) {
		this.score_service = score_service;
	}
	public double getTotal_score() {
		return total_score;
	}
	public void setTotal_score(int total_score) {
		this.total_score = total_score;
	}
	
	////Date 타입 String으로 변환시키기
	public String getSimple_review_registdate() {
		return changeDateType(this.simple_review_registdate);
	}
	/*
	public Date getSimple_review_registdate() {
		return simple_review_registdate;
	}
	*/
	public void setSimple_review_registdate(Date simple_review_registdate) {
		this.simple_review_registdate = simple_review_registdate;
	}
	//Date 타입 String으로 변환시키기
	public String changeDateType(Date simple_review_registdate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(simple_review_registdate);
	}
	
	
}
