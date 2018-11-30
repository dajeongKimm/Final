package com.tje.model;

public class Member_address {
	private int address_id;
    private String address_city;
    private String address_gu;
    private String address_dong;
    private String address_detail;
    private String address_postcode;
	
    
    public  Member_address() {
		
	}
	
	public Member_address(int member_address_id, String address_city, String address_gu, String address_dong,
			String address_detail, String address_postcode) {
	
		this.address_id = member_address_id;
		this.address_city = address_city;
		this.address_gu = address_gu;
		this.address_dong = address_dong;
		this.address_detail = address_detail;
		this.address_postcode = address_postcode;
	}
	public int getMember_address_id() {
		return address_id;
	}
	public void setMember_address_id(int member_address_id) {
		this.address_id = member_address_id;
	}
	public String getAddress_city() {
		return address_city;
	}
	public void setAddress_city(String address_city) {
		this.address_city = address_city;
	}
	public String getAddress_gu() {
		return address_gu;
	}
	public void setAddress_gu(String address_gu) {
		this.address_gu = address_gu;
	}
	public String getAddress_dong() {
		return address_dong;
	}
	public void setAddress_dong(String address_dong) {
		this.address_dong = address_dong;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getAddress_postcode() {
		return address_postcode;
	}
	public void setAddress_postcode(String address_postcode) {
		this.address_postcode = address_postcode;
	}
	
    
	
    
}
