package com.tje.model;


public class RestaurantListView {

	private int restaurant_id;
	private String restaurant_mainimage;
	private String restaurant_name;
	private String restaurant_description;
	private String menu_type;
	private double map_coordinate_lat;
	private double map_coordinate_long;
	private int read_count;
	private double sum_score;
	private int allcount;	

	public int getAllcount() {
		return allcount;
	}
	public void setAllcount(int allcount) {
		this.allcount = allcount;
	}
	public double getSum_score() {
		return sum_score;
	}
	public void setSum_score(double sum_score) {
		this.sum_score = sum_score;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public int getRestaurant_id() {
		return restaurant_id;
	}
	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}
	public String getRestaurant_mainimage() {
		return restaurant_mainimage;
	}
	public void setRestaurant_mainimage(String restaurant_mainimage) {
		this.restaurant_mainimage = restaurant_mainimage;
	}
	public String getRestaurant_name() {
		return restaurant_name;
	}
	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
	}
	public String getRestaurant_description() {
		return restaurant_description;
	}
	public void setRestaurant_description(String restaurant_description) {
		this.restaurant_description = restaurant_description;
	}
	public String getMenu_type() {
		return menu_type;
	}
	public void setMenu_type(String menu_type) {
		this.menu_type = menu_type;
	}
	public double getMap_coordinate_lat() {
		return map_coordinate_lat;
	}
	public void setMap_coordinate_lat(double map_coordinate_lat) {
		this.map_coordinate_lat = map_coordinate_lat;
	}
	public double getMap_coordinate_long() {
		return map_coordinate_long;
	}
	public void setMap_coordinate_long(double map_coordinate_long) {
		this.map_coordinate_long = map_coordinate_long;
	}

}
