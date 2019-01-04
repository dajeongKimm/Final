package com.tje.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.tje.service.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tje.model.*;
import java.util.*;

import javax.servlet.http.HttpSession;

@RestController
public class SimpleReviewRestController {

   @Autowired
   private SimpleReviewService reviewService;

   
   @RequestMapping(value="/m/allRestaurantList/{restaurant_id}/writeSimpleReview", method=RequestMethod.POST)
   public void restful_write_simple_review(SimpleReviewScore review_score, String simple_review_contents_text, 
                                 @PathVariable int restaurant_id) {
      
//      System.out.println(score.getScore_flavor());
//      System.out.println(score.getScore_volume());
//      System.out.println(score.getScore_service());
//      System.out.println(score.getTotal_score());
//      System.out.println(simple_review_contents_text);
//      System.out.println(restaurant_id);
      
      String member_id = "admin";
      
      SimpleReviewLike like = new SimpleReviewLike();
      like.setMember_id(member_id);
      like.setRestaurant_id(restaurant_id);
      
      SimpleReviewNotify notify = new SimpleReviewNotify();
      notify.setMember_id(member_id);
      notify.setRestaurant_id(restaurant_id);
      
      SimpleReviewScore score = new SimpleReviewScore();
      score.setMember_id(member_id);
      score.setRestaurant_id(restaurant_id);
      score.setScore_flavor(review_score.getScore_flavor());
      score.setScore_volume(review_score.getScore_volume());
      score.setScore_service(review_score.getScore_service());
      score.setTotal_score(review_score.getTotal_score());
      
      SimpleReview simple = new SimpleReview();
      simple.setMember_id(member_id);
      simple.setRestaurant_id(restaurant_id);
      simple.setSimple_review_contents_text(simple_review_contents_text);
      simple.setSimpleReviewLike(like);
      simple.setSimpleReviewNotify(notify);
      simple.setSimpleReviewScore(score);
      // file
      
      Map<String, Integer> map = new HashMap<>();
      map.put("total_score", review_score.getTotal_score());
      map.put("restaurant_id", restaurant_id);
      
      reviewService.insert(simple, map);
      
   }
   

   @RequestMapping(value="/m/review_list", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
   public String restful_read_simple_review(int restaurant_id) {
	   
	   System.out.println(restaurant_id);
	   System.out.println("review_list 메소드 호출");
	   // List<ReviewListView> list = reviewService.selectList(restaurant_id);
	   
	   Map<String, Object> map = new HashMap<>();
	   map.put("review_list", reviewService.selectList(restaurant_id));
	   map.put("review_count", reviewService.allCount(restaurant_id));
	   
	   Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
	   String strJson = gson.toJson(map);
	   System.out.println(strJson);
	   
	   return strJson;
	   
   }
   
   
	@RequestMapping(value="/m/addLikeCount", method=RequestMethod.POST)
	public String selectLikeCount_add(int simple_review_id) {
		SimpleReview simpleReview = reviewService.selectOne(simple_review_id);
		System.out.println(simple_review_id + " like");
		
		int count = 0;
		try{
			count = reviewService.addLikeCount(simpleReview);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		Gson gson = new Gson();
		String strJson = gson.toJson(count);
		
		System.out.println(strJson);
		return strJson;
	}
	
	@RequestMapping(value="/m/cancelLikeCount", method=RequestMethod.POST)
	public String selectLikeCount_cancel(int simple_review_id) {
		SimpleReview simpleReview = reviewService.selectOne(simple_review_id);
		System.out.println(simple_review_id + " like cancel");
		
		int count = 0;
		try{
			count = reviewService.cancelLikeCount(simpleReview);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		Gson gson = new Gson();
		String strJson = gson.toJson(count);
		
		System.out.println(strJson);
		return strJson;
	}
	
	@RequestMapping(value="/m/cancelBadCount", method=RequestMethod.POST)
	public String selectBadCount_add(int simple_review_id) {
		SimpleReview simpleReview = reviewService.selectOne(simple_review_id);
		System.out.println(simple_review_id + "bad");
		
		int count = 0;
		try{
			count = reviewService.cancelBadCount(simpleReview);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		Gson gson = new Gson();
		String strJson = gson.toJson(count);
		
		System.out.println(strJson);
		return strJson;
	}
	
	
	@RequestMapping(value="/m/addBadCount", method=RequestMethod.POST)
	public String selectBadCount_cancel(int simple_review_id) {
		SimpleReview simpleReview = reviewService.selectOne(simple_review_id);
		System.out.println(simple_review_id + "bad cancel");
		
		int count = 0;
		try{
			count = reviewService.addBadCount(simpleReview);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		Gson gson = new Gson();
		String strJson = gson.toJson(count);
		
		System.out.println(strJson);
		return strJson;
	}
   
}
