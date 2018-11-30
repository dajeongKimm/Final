package com.tje.model;

//검색순위
public class SearchRank {
	private int searchRank_id;
	private String keyword;
	private int count;
	
	public int getSearchRank_id() {
		return searchRank_id;
	}
	public void setSearchRank_id(int searchRank_id) {
		this.searchRank_id = searchRank_id;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
