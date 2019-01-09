package com.tje.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.tje.service.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tje.model.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
public class SimpleReviewRestController {

   @Autowired
   private SimpleReviewService reviewService;
   @Autowired
   private FileUploadService uploadService;

   @ModelAttribute("realPath")
	public String getRealPath(HttpServletRequest request) {
		// 실제 서버가 구동중인 경로를 반환    	
		String realPath = request.getRealPath("/WEB-INF/resources/upload/simpleReview");
		return realPath;
	}
   
   /*
   @RequestMapping(value="/m/allRestaurantList/{restaurant_id}/writeSimpleReview", method=RequestMethod.POST)
	public void insertSimpleReview_2(MultipartFile simple_review_photo, @PathVariable int restaurant_id, @ModelAttribute("realPath") String realPath) {
	   	System.out.println("file test");
	   	System.out.println(realPath);
	   	System.out.println(simple_review_photo.getSize());
	   	
		FileVo file = new FileVo();
		file.setFile(simple_review_photo);
			
		// file 이름 빼고 file name list 불러와서 중복 비교
		UUID uuid = UUID.randomUUID();
		String file_name = uuid.toString();
			
		System.out.println(simple_review_photo.getOriginalFilename());
		System.out.println(file_name);
		// System.out.println(uploadService.saveFile(realPath, file, file_name));
   }
   */
  
   
   @RequestMapping(value="/m/allRestaurantList/{restaurant_id}/writeSimpleReview", method=RequestMethod.POST)
   public void restful_write_simple_review(String simple_review_contents_text, 
                                 @PathVariable int restaurant_id, 
                                 MultipartFile simple_review_photo,
                                 String score_flavor, 
                                 String score_volume, 
                                 String score_service, 
                                 String total_score,
                                 @ModelAttribute("realPath") String realPath) {
      
      String member_id = "admin";
      
      System.out.println(simple_review_contents_text);
      System.out.println(score_flavor);
      System.out.println(score_volume);
      System.out.println(score_service);
      System.out.println(total_score);
      
      SimpleReviewLike like = new SimpleReviewLike();
      like.setMember_id(member_id);
      like.setRestaurant_id(restaurant_id);
      
      SimpleReviewNotify notify = new SimpleReviewNotify();
      notify.setMember_id(member_id);
      notify.setRestaurant_id(restaurant_id);
      
      SimpleReviewScore score = new SimpleReviewScore();
      score.setMember_id(member_id);
      score.setRestaurant_id(restaurant_id);
      score.setScore_flavor(Integer.parseInt(score_flavor));
      score.setScore_volume(Integer.parseInt(score_volume));
      score.setScore_service(Integer.parseInt(score_service));
      score.setTotal_score(Integer.parseInt(total_score));
      
      SimpleReview simple = new SimpleReview();
      simple.setMember_id(member_id);
      simple.setRestaurant_id(restaurant_id);
      simple.setSimple_review_contents_text(simple_review_contents_text);
      simple.setSimpleReviewLike(like);
      simple.setSimpleReviewNotify(notify);
      simple.setSimpleReviewScore(score);
      // file
      SimpleReviewFile file;
      
      if(simple_review_photo != null) {
	      file = new SimpleReviewFile();
	      ///////
	      FileVo fileVo = new FileVo();
	      fileVo.setFile(simple_review_photo);
				
		  // file 이름 빼고 file name list 불러와서 중복 비교
		  UUID uuid = UUID.randomUUID();
		  String file_name = uuid.toString();
				
		  System.out.println(simple_review_photo.getOriginalFilename());
		  System.out.println(file_name);
		  uploadService.saveFile(realPath, fileVo, file_name);
	      ///////
	      
		  file.setFile_name(file_name);
	      simple.setSimpleReviewFile(file);
      } else {
    	  file = new SimpleReviewFile();
    	  simple.setSimpleReviewFile(file);
      }
      
      Map<String, Integer> map = new HashMap<>();
      map.put("total_score", Integer.parseInt(total_score));
      map.put("restaurant_id", restaurant_id);
      
      reviewService.insert(simple, map);
      
   }
   
   
   @RequestMapping(value="/m/select_one", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
   public String restful_select_one_simple_review(int simple_review_id) {
	   System.out.println(simple_review_id);
	   ReviewListView one = reviewService.selectOneView(simple_review_id);
	   Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm").create();
	   String strJson = gson.toJson(one);
	   System.out.println(strJson);
	   
	   return strJson;
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
