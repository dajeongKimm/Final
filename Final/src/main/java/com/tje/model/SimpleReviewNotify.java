package com.tje.model;

public class SimpleReviewNotify {

   private int simple_review_notify_id;
   private int restaurant_id;
   private String member_id;
   private int simple_review_notify_count;
   
   
   public SimpleReviewNotify() {}


   public int getSimple_review_notify_id() {
      return simple_review_notify_id;
   }


   public void setSimple_review_notify_id(int simple_review_notify_id) {
      this.simple_review_notify_id = simple_review_notify_id;
   }


   public int getRestaurant_id() {
      return restaurant_id;
   }


   public void setRestaurant_id(int restaurant_id) {
      this.restaurant_id = restaurant_id;
   }


   public String getMember_id() {
      return member_id;
   }


   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }

   public int getSimple_review_notify_count() {
      return simple_review_notify_count;
   }


   public void setSimple_review_notify_count(int simple_review_notify_count) {
      this.simple_review_notify_count = simple_review_notify_count;
   }
   
   
   
}