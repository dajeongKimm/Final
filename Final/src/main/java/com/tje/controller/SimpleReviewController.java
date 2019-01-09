package com.tje.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tje.model.*;
import com.tje.service.*;

@Controller
public class SimpleReviewController {

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
	
	
	@RequestMapping(value="allRestaurantList/{restaurant_id}/writeSimpleReview", method=RequestMethod.GET)
	public String insertSimpleReviewForm(Model model, @PathVariable int restaurant_id) {
		model.addAttribute("restaurant_id", restaurant_id);
		
		return "simple/writeSimpleReviewForm";
	}
	
	@ResponseBody
	@RequestMapping(value="likeCount/{simple_review_id}", method=RequestMethod.POST)
	public String selectLikeCount(@PathVariable("simple_review_id") int simple_review_id) {
		SimpleReview simpleReview = reviewService.selectOne(simple_review_id);
		System.out.println(simple_review_id);
		
		int count = 0;
		try{
			count = reviewService.addLikeCount(simpleReview);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "{\"value\" : \"" + count + "\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="badCount/{simple_review_id}", method=RequestMethod.POST)
	public String selectBadCount(@PathVariable("simple_review_id") int simple_review_id) {
		SimpleReview simpleReview = reviewService.selectOne(simple_review_id);
		
		int count = 0;
		try{
			count = reviewService.addBadCount(simpleReview);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "{\"value\" : \"" + count + "\"}";
	}
	
	
	@RequestMapping(value="allRestaurantList/{restaurant_id}/writeSimpleReview", method=RequestMethod.POST)
	public String insertSimpleReview(Model model, SimpleReview simpleReview, 
									@ModelAttribute("realPath") String realPath,
									@PathVariable int restaurant_id,
									@RequestParam ArrayList<MultipartFile> simple_review_photo) {
		//
		System.out.println(realPath);
		String member_id = simpleReview.getSimpleReviewScore().getMember_id();
		
		SimpleReviewLike like = new SimpleReviewLike();
		like.setMember_id(member_id);
		like.setRestaurant_id(restaurant_id);
		
		SimpleReviewNotify notify = new SimpleReviewNotify();
		notify.setMember_id(member_id);
		notify.setRestaurant_id(restaurant_id);
		
		SimpleReviewScore score = new SimpleReviewScore();
		score.setMember_id(member_id);
		score.setRestaurant_id(restaurant_id);
		score.setScore_flavor(simpleReview.getSimpleReviewScore().getScore_flavor());
		score.setScore_volume(simpleReview.getSimpleReviewScore().getScore_volume());
		score.setScore_service(simpleReview.getSimpleReviewScore().getScore_service());
		score.setTotal_score(simpleReview.getSimpleReviewScore().getTotal_score());
		
		//
		// null이면 파일 안들어가게
		int fileSize = simple_review_photo.size();
		int index = 1;
		
		StringBuilder fileNames = new StringBuilder();
		
		for(MultipartFile mf : simple_review_photo) {
			FileVo file = new FileVo();
			file.setFile(mf);
			
			// file 이름 빼고 file name list 불러와서 중복 비교
			
			UUID uuid = UUID.randomUUID();
			String Original = mf.getOriginalFilename().replaceAll(" ", "");
			String file_name = uuid.toString();
			
			uploadService.saveFile(realPath, file, file_name);
			
			if(index == fileSize) {
				fileNames.append(file_name);
			}
			
			if(index < fileSize) {
				fileNames.append(file_name);
				fileNames.append(",");
				index++;
			}
		}
		
		SimpleReviewFile file = new SimpleReviewFile();
		file.setFile_name(fileNames.toString());
		
		System.out.println(fileNames.toString());
		//
		SimpleReview simple = new SimpleReview();
		simple.setMember_id(member_id);
		simple.setRestaurant_id(restaurant_id);
		simple.setSimple_review_contents_text(simpleReview.getSimple_review_contents_text());
		simple.setSimpleReviewLike(like);
		simple.setSimpleReviewNotify(notify);
		simple.setSimpleReviewScore(score);
		simple.setSimpleReviewFile(file);
		
		Map<String, Integer> map = new HashMap<>();
		map.put("total_score", score.getTotal_score());
		map.put("restaurant_id", restaurant_id);
		
		model.addAttribute("insertReview", reviewService.insert(simple, map));
		model.addAttribute("restaurant_id", restaurant_id);
		
		return "simple/writeSimpleReviewResult";
		
	}
	
	
	
	@RequestMapping("/allRestaurantList/{restaurant_id}/delete/{simple_review_id}")
	public String deleteSimpleReview(Model model, 
									@PathVariable int restaurant_id,
									@PathVariable int simple_review_id ) {
		
		SimpleReview selectReview = reviewService.selectOne(simple_review_id);
		
		SimpleReviewScore selectReviewScore = new SimpleReviewScore();
		selectReviewScore = reviewService.selectOneScore(selectReview.getSimple_review_score_id());
		
		Map<String, Integer> map = new HashMap<>();
		map.put("total_score", selectReviewScore.getTotal_score());
		map.put("restaurant_id", restaurant_id);
		
		model.addAttribute("deleteReview", reviewService.delete(selectReview, map));
		model.addAttribute("restaurant_id", restaurant_id);
		
		return "simple/deleteSimpleReviewResult";
	}
	
	
	
	@RequestMapping(value="/allRestaurantList/{restaurant_id}/update/{simple_review_id}", method=RequestMethod.GET)
	public String updateSimpleReviewForm(Model model,
										@PathVariable int simple_review_id,
										@PathVariable int restaurant_id ) {
		// 리뷰 작성 내용 갖고 오기 위해 select
		model.addAttribute("selectReview", reviewService.selectOne(simple_review_id));
		model.addAttribute("restaurant_id", restaurant_id);
		
		return "simple/updateSimpleReviewForm";
	}
	
	@RequestMapping(value="/allRestaurantList/{restaurant_id}/update/{simple_review_id}", method=RequestMethod.POST)
	public String updateSimpleReview(Model model,
									SimpleReview simpleReview,
									@PathVariable int restaurant_id,
									@PathVariable int simple_review_id,
									@RequestParam ArrayList<MultipartFile> simple_review_photo,
									@ModelAttribute("realPath") String realPath ) {
		
		SimpleReview originalSimple = reviewService.selectOne(simple_review_id);
		int score_id = originalSimple.getSimple_review_score_id();
		int file_id = originalSimple.getSimple_review_file_id();
		
		SimpleReview newSimple = new SimpleReview();
		
		SimpleReviewScore score = new SimpleReviewScore();
		score.setSimple_review_score_id(score_id);
		score.setScore_flavor(simpleReview.getSimpleReviewScore().getScore_flavor());
		score.setScore_volume(simpleReview.getSimpleReviewScore().getScore_volume());
		score.setScore_service(simpleReview.getSimpleReviewScore().getScore_service());
		score.setTotal_score(simpleReview.getSimpleReviewScore().getTotal_score());
		
		//
		int fileSize = simple_review_photo.size();
		int index = 1;
		
		StringBuilder fileNames = new StringBuilder();
		
		for(MultipartFile mf : simple_review_photo) {
			FileVo file = new FileVo();
			file.setFile(mf);
			
			UUID uuid = UUID.randomUUID();
			String file_name = uuid.toString() + "_" + mf.getOriginalFilename();
			
			uploadService.saveFile(realPath, file, file_name);
			
			if(index == fileSize) {
				fileNames.append(file_name);
			}
			
			if(index < fileSize) {
				fileNames.append(file_name);
				fileNames.append(",");
				index++;
			}
		}
		
		SimpleReviewFile file = new SimpleReviewFile();
		file.setSimple_review_file_id(file_id);
		file.setFile_name(fileNames.toString());
		
		newSimple.setSimple_review_contents_text(simpleReview.getSimple_review_contents_text());
		newSimple.setSimpleReviewScore(score);
		newSimple.setSimpleReviewFile(file);
		newSimple.setSimple_review_id(simple_review_id);
		
		Map<String, Integer> map = new HashMap<>();
		SimpleReviewScore originalScore = reviewService.selectOneScore(score_id);
		map.put("original_total_score", originalScore.getTotal_score());
		map.put("new_total_score", score.getTotal_score());
		map.put("restaurant_id", restaurant_id);
		
		model.addAttribute("updateReview", reviewService.update(newSimple, map));
		model.addAttribute("restaurant_id", restaurant_id);
		
		return "simple/updateSimpleReviewResult";
		
	}
	
}