package com.tje.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tje.dao.*;
import com.tje.model.*;


import java.util.*;

@Service
public class SearchRankService {

	@Autowired
	private SearchRankDAO dao;

	public void setDao(SearchRankDAO dao) {
		this.dao = dao;
	}

	//기존의 검색어가 있는지 확인
	public SearchRank checkKeyword(SearchRank searchRank){
		return this.dao.checkKeyword(searchRank);
	}
	
	//기존 검색어가 있으면 count 1증가
	public int updateCount(SearchRank searchRank) {
		return this.dao.updateCount(searchRank);
	}
	
	//검색어 순위별로 정렬
	public List<SearchRank> searchRankSelect(){
		return this.dao.searchRankSelect();
	}
}
