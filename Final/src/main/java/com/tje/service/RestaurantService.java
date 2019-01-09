package com.tje.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tje.dao.*;
import com.tje.model.*;


import java.util.*;

@Service
public class RestaurantService {

	@Autowired
	private RestaurantDAO dao;
	@Autowired
	private VisitDAO visitDAO;
	@Autowired
	private SearchRankDAO searchRankDAO;

	public void setDao(RestaurantDAO dao) {
		this.dao = dao;
	}

	// 음식점 전체 컬럼수
	public int allRestaurantCount() {
		return this.dao.allRestaurantCount();
	}
	// 한식 전체 컬럼수
	public int allHansikCount() {
		return this.dao.allHansikCount();
	}
	// 치킨/피자 전체 컬럼수
	public int allChikenAndPizzaCount() {
		return this.dao.allChikenAndPizzaCount();
	}
	// 양식 전체 컬럼수
	public int allYangsikCount() {
		return this.dao.allYangsikCount();
	}
	// 중식 전체 컬럼수
	public int allJungsikCount() {
		return this.dao.allJungsikCount();
	}
	// 일식 전체 컬럼수
	public int allIlsikCount() {
		return this.dao.allIlsikCount();
	}
	// 분식점 전체 컬럼수
	public int allBunsikCount() {
		return this.dao.allBunsikCount();
	}
	// 디저트 전체 컬럼수
	public int allCafeCount() {
		return this.dao.allCafeCount();
	}

	// 음식점 전체 리스트(페이징 포함)
	public List<RestaurantListView> selectRestaurant(Map<String, Integer> map) {
		return this.dao.selectRestaurant(map);
	}
	////////////////////RestController ////////////////////////
	// 음식점 전체 리스트(페이징 미포함)
	public List<RestaurantListView> selectStore(){
		return this.dao.selectStore();
	}
	//상세페이지 보기
	public DetailRestaurantView selectOneStore(int restaurant_id) {
		return this.dao.selectOneStore(restaurant_id);
	}
	//메뉴
	public List<MenuList> selectStoreMenu(int restaurant_id) {
		return this.dao.selectStoreMenu(restaurant_id);
	}
	//리뷰3개 보이기
	public List<ReviewListView> selectIntroReview(int restaurant_id){
		return this.dao.selectIntroReview(restaurant_id);
	}
	public int selectReviewCount(int restaurant_id) {
		return this.dao.selectReviewCount(restaurant_id);
	}
	//조회수 증가
	public int increaseStore(int restaurant_id) {
		return this.dao.increaseStore(restaurant_id);
	}
	//검색 결과
	public List<ReviewListView> searchStore(String keyword){
		return this.dao.searchStore(keyword);
	}
	
	///////////////////////////////////////////////////////////
	

	// 상세지도 보기
	public MapCoordinate selectOneMap(MapCoordinate mapcoordinate) {
		return this.dao.selectOneMap(mapcoordinate);
	}

	// 음식 메뉴 보기
	public List<MenuList> selectMenu(MenuList menuList) {
		return this.dao.selectMenu(menuList);
	}

	// 상세페이지
	@Transactional
	public DetailRestaurantView selectOneRestaurant(DetailRestaurantView detailRestaurantView, Visit visit) {
		// 상세페이지 클릭될때마다 visit insert
		this.visitDAO.visitInsert(visit);
		
		return this.dao.selectOneRestaurant(detailRestaurantView);
	}

	// 한식만 분류
	public List<DetailRestaurantView> selectHansik(Map<String, Integer> map) {
		return this.dao.selectHansik(map);
	}

	// 치킨/피자만 분류
	public List<DetailRestaurantView> selectChikenAndPizza(Map<String, Integer> map) {
		return this.dao.selectChikenAndPizza(map);
	}

	// 양식만 분류
	public List<DetailRestaurantView> selectYangsik(Map<String, Integer> map) {
		return this.dao.selectYangsik(map);
	}

	// 일식만 분류
	public List<DetailRestaurantView> selectIlsik(Map<String, Integer> map) {
		return this.dao.selectIlsik(map);
	}

	// 중식만 분류
	public List<DetailRestaurantView> selectJungsik(Map<String, Integer> map) {
		return this.dao.selectJungsik(map);
	}

	// 분식만 분류
	public List<DetailRestaurantView> selectBunsik(Map<String, Integer> map) {
		return this.dao.selectBunsik(map);
	}

	// 디저트만 분류
	public List<DetailRestaurantView> selectCafe(Map<String, Integer> map) {
		return this.dao.selectCafe(map);
	}
	
	//조회수 증가
	public int increaseCount(RestaurantReadCount restaurantReadCount) {
		return this.dao.increaseCount(restaurantReadCount);
	}
	
	
	//검색 필터
	public List<FilterView> selectFilter(FilterView filterview){
		return this.dao.selectFilter(filterview);
	}
	
	//검색창
	@Transactional
	public List<FilterView> selectSearch(String keyword, SearchRank searchRank){
		//검색될때마다 검색어 테이블에 레코드추가
		this.searchRankDAO.searchRankInsert(searchRank);
		
		return this.dao.selectSearch(keyword);
	}
	
	public List<FilterView> selectSearch2(String keyword){
		return this.dao.selectSearch(keyword);
	}
	
	//검색창 결과 총 컬럼수
	public int searchCount(String keyword) {
		return this.dao.searchCount(keyword);
	}

}
