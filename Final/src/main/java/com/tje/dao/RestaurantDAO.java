package com.tje.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;
import com.tje.model.*;

@Repository
public class RestaurantDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String strNameSpace = "com.tje.model.RestaurantMapper";

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 음식점 총 컬럼수
	public int allRestaurantCount() {
		return sqlSession.selectOne(strNameSpace + ".allRestaurantCount");
	}

	// 음식점 전체 보기
	public List<RestaurantListView> selectRestaurant(Map<String, Integer> map) {
		return sqlSession.selectList(strNameSpace + ".restaurantList", map);
	}


	// 한식 총 컬럼수
	public int allHansikCount() {
		return sqlSession.selectOne(strNameSpace + ".allHansikCount");
	}
	// 치킨/피자 총 컬럼수
	public int allChikenAndPizzaCount() {
		return sqlSession.selectOne(strNameSpace + ".allChikenAndPizzaCount");
	}
	// 양식 총 컬럼수
	public int allYangsikCount() {
		return sqlSession.selectOne(strNameSpace + ".allYangsikCount");
	}
	// 중식 총 컬럼수
	public int allJungsikCount() {
		return sqlSession.selectOne(strNameSpace + ".allJungsikCount");
	}
	// 일식 총 컬럼수
	public int allIlsikCount() {
		return sqlSession.selectOne(strNameSpace + ".allIlsikCount");
	}
	// 분식점 총 컬럼수
	public int allBunsikCount() {
		return sqlSession.selectOne(strNameSpace + ".allBunsikCount");
	}
	// 디저트 컬럼수
	public int allCafeCount() {
		return sqlSession.selectOne(strNameSpace + ".allCafeCount");
	}

	// 상세지도 보기
	public MapCoordinate selectOneMap(MapCoordinate mapcoordinate) {
		return sqlSession.selectOne(strNameSpace + ".selectOneMap", mapcoordinate);
	}

	// 음식점 메뉴 보기
	public List<MenuList> selectMenu(MenuList menuList) {
		return sqlSession.selectList(strNameSpace + ".selectMenu", menuList);
	}

	// 상세 음식점 정보
	public DetailRestaurantView selectOneRestaurant(DetailRestaurantView detailRestaurantView) {
		return sqlSession.selectOne(strNameSpace + ".detailRestaurant", detailRestaurantView);
	}

	// 한식만 분류
	public List<DetailRestaurantView> selectHansik(Map<String, Integer> map) {
		return sqlSession.selectList(strNameSpace + ".hansik", map);
	}

	// 치킨/피자만 분류
	public List<DetailRestaurantView> selectChikenAndPizza(Map<String, Integer> map) {
		return sqlSession.selectList(strNameSpace + ".chikenAndPizza", map);
	}

	// 양식만 분류
	public List<DetailRestaurantView> selectYangsik(Map<String, Integer> map) {
		return sqlSession.selectList(strNameSpace + ".yangsik", map);
	}

	// 일식만 분류
	public List<DetailRestaurantView> selectIlsik(Map<String, Integer> map) {
		return sqlSession.selectList(strNameSpace + ".ilsik", map);
	}

	// 중식만 분류
	public List<DetailRestaurantView> selectJungsik(Map<String, Integer> map) {
		return sqlSession.selectList(strNameSpace + ".jungsik", map);
	}

	// 분식만 분류
	public List<DetailRestaurantView> selectBunsik(Map<String, Integer> map) {
		return sqlSession.selectList(strNameSpace + ".bunsik", map);
	}

	// 디저트만 분류
	public List<DetailRestaurantView> selectCafe(Map<String, Integer> map) {
		return sqlSession.selectList(strNameSpace + ".cafe", map);
	}
	
	//조회수 증가
	public int increaseCount(RestaurantReadCount restaurantReadCount) {
		return sqlSession.update(strNameSpace + ".increaseCount", restaurantReadCount);
	}
	
	
	//검색필터
	public List<FilterView> selectFilter(FilterView filterview){
		return sqlSession.selectList(strNameSpace + ".filter", filterview);
	}
	
	//검색창
	public List<FilterView> selectSearch(String keyword){
		return sqlSession.selectList(strNameSpace + ".search", keyword);
	}
	//검색창 총 컬럼수
	public int searchCount(String keyword) {
		return sqlSession.selectOne(strNameSpace + ".searchCount", keyword);
	}
}
