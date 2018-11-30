package com.tje.model;

// 정적 지도 사용
public class MapCoordinate {
	
	private int map_coordinate_id;
	private int restaurant_id;
	private double map_coordinate_lat; // 위도
	private double map_coordinate_long; // 경도
	public int getMap_coordinate_id() {
		return map_coordinate_id;
	}
	public void setMap_coordinate_id(int map_coordinate_id) {
		this.map_coordinate_id = map_coordinate_id;
	}
	public int getRestaurant_id() {
		return restaurant_id;
	}
	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
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
