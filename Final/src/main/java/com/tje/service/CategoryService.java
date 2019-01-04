package com.tje.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tje.dao.*;
import com.tje.model.*;


import java.util.*;

@Service
public class CategoryService {

	@Autowired
	private CategoryDAO dao;

	public void setDao(CategoryDAO dao) {
		this.dao = dao;
	}

	// 검색 순위 베스트 5
	public List<RestaurantListView> bestRanking5() {
		return this.dao.bestRanking5();
	}

	// 검색 순위 베스트 5
	public List<RestaurantListView> bestScore() {
		return this.dao.bestScore();
	}
	
	//리뷰가 많은 순 5
	public List<RestaurantListView> bestReview(){
		return this.dao.bestReview();
	}
}
