package com.tje.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tje.dao.SimpleReviewDAO;
import java.util.*;
import com.tje.model.*;

@Service
public class SimpleReviewService {
	
	private static final int COUNT = 3;

	@Autowired
	private SimpleReviewDAO dao;
	
	public void setDao(SimpleReviewDAO dao) {
		this.dao = dao;
	}
	
	//여기 수정
	public List<ReviewListView> selectList(Map<String, Integer> map){
		return this.dao.selectList(map);
	}
	
	public List<ReviewListView> selectList(int restaurant_id) {
		return this.dao.selectList(restaurant_id);
	}
	
	/* ajax 시도
	//처음봤을 때
	public List<ReviewListView> get_list(int startIdx){
		Search_helper helper = new Search_helper(startIdx, COUNT);
		return dao.selectList(helper);
	}
	//그다음 부터 startIdx 바꾸기
	public String add_list(int startIdx) {
		Search_helper helper = new Search_helper(startIdx, COUNT);
		List<ReviewListView> list = dao.selectList(helper);
		if(list != null) {
			String str = "";
			
			for(int i=0; i<list.size(); i++) {
				str += "<tr>";
				str += "<td width=\"200px\">" + list.get(i).getMember_nickname() + "</td>";
				str += "<td colspan=\"2\">" +list.get(i).getSimple_review_registdate() + "</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td><img id=\"member\" src=\"${ pageContext.request.contextPath }/resources/upload/member/" + list.get(i).getMember_photo() + "\" class=\"img-circle\" width=\"100px\" height=\"100px\"></td>";
				str += "<td colspan=\"2\">" + list.get(i).getSimple_review_contents_text() + "</td>";
				str += "<td td rowspan=\"5\">    "
						+ "<c:if test=\"${ empty loginmember }\" var=\"result\">\r\n" + 
						"               <button type=\"button\" onclick=\"countBtn_click();\" class=\"btn btn-link\">\r\n" + 
						"                  <img src=\"${ pageContext.request.contextPath }/resources/img/like.png\" width=\"40px\" height=\"40px\">\r\n" + 
						"               </button>\r\n" + 
						"               <span>" + list.get(i).getSimple_review_like_count() + "</span>\r\n" + 
						"               \r\n" + 
						"               <button type=\"button\" onclick=\"countBtn_click();\" class=\"btn btn-link\">\r\n" + 
						"                  <img src=\"${ pageContext.request.contextPath }/resources/img/bad.png\" width=\"40px\" height=\"40px\">\r\n" + 
						"               </button>\r\n" + 
						"                <span>" + list.get(i).getSimple_review_notify_count() + "</span>\r\n" + 
						"            </c:if>\r\n" + 
						"   \r\n" + 
						"         \r\n" + 
						"         	<c:if test=\"${ not result }\">\r\n" + 
						"            <button id=\"likeBtn\" type=\"button\" name=\"" + list.get(i).getSimple_review_id() + "\" class=\"btn btn-link\">\r\n" + 
						"            <img src=\"${ pageContext.request.contextPath }/resources/img/like.png\" width=\"40px\" height=\"40px\">\r\n" + 
						"            </button>\r\n" + 
						"               <span id=\"likeCount\">" + list.get(i).getSimple_review_like_count() + "</span>\r\n" + 
						"            <button id=\"badBtn\" type=\"button\" name=\"${ reviewList.simple_review_id }\" class=\"btn btn-link\">\r\n" + 
						"            <img src=\"${ pageContext.request.contextPath }/resources/img/bad.png\" width=\"40px\" height=\"40px\">\r\n" + 
						"            </button>\r\n" + 
						"               <span id=\"badCount\">" + list.get(i).getSimple_review_notify_count() + "</span>\r\n" + 
						"              </c:if>"
						+ "</td>";
				str += "<td colspan=\"2\">"
						+ " <c:forTokens var=\"fileName\" items=\"" + list.get(i).getFile_name() + "\" delims=\",\">\r\n" + 
						"               <img src=\"${ pageContext.request.contextPath }/resources/upload/simpleReview/${ fileName }\" width=\"200px\" height=\"200px\">\r\n" + 
						"            </c:forTokens>" +
						"</td>";
				
				str += "<tr>";
				str += "<td class=\"score\" width=\"60px\">맛</td>";
				str += "<td>";
				str += "<c:forEach begin=\"1\" end=\""+ list.get(i).getScore_flavor() + "\">\r\n" + 
						"	<img src=\"${ pageContext.request.contextPath }/resources/img/star.png\" width=\"20px\" height=\"20px\">\r\n" + 
						"</c:forEach>";
				str += "</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td class=\"score\">양</td>";
				str += "<td>";
				str += "<c:forEach begin=\"1\" end=\""+ list.get(i).getScore_volume() + "\">\r\n" + 
						"	<img src=\"${ pageContext.request.contextPath }/resources/img/star.png\" width=\"20px\" height=\"20px\">\r\n" + 
						"</c:forEach>";
				str += "</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td class=\"score\">서비스</td>";
				str += "<td>";
				str += "<c:forEach begin=\"1\" end=\""+ list.get(i).getScore_service() + "\">\r\n" + 
						"	<img src=\"${ pageContext.request.contextPath }/resources/img/star.png\" width=\"20px\" height=\"20px\">\r\n" + 
						"</c:forEach>";
				str += "</td>";
				str += "</tr>";
				
				str += "<tr>";
				str += "<td class=\"score\">총점</td>";
				str += "<td>";
				str += "<c:forEach begin=\"1\" end=\""+ list.get(i).getTotal_score() + "\">\r\n" + 
						"	<img src=\"${ pageContext.request.contextPath }/resources/img/star.png\" width=\"20px\" height=\"20px\">\r\n" + 
						"</c:forEach>";
				str += "</td>";
				str += "</tr>";
			}
			
			return str;
		}else {
			return "";
		}
	}
	
	*/
	
	public SimpleReview selectOne(int simple_review_id) {
		return this.dao.select(simple_review_id);
	}
	
	public SimpleReviewScore selectOneScore(int simple_review_score_id) {
		return this.dao.selectScore(simple_review_score_id);
	}
	
	public ReviewListView selectOneView(int simple_review_id) {
		return this.dao.selectOneView(simple_review_id);
	}
	
	@Transactional
	public int insert(SimpleReview simpleReview, Map<String, Integer> map) {
		this.dao.insert(simpleReview.getSimpleReviewScore());
		this.dao.insert(simpleReview.getSimpleReviewLike());
		this.dao.insert(simpleReview.getSimpleReviewNotify());
		this.dao.insert(simpleReview.getSimpleReviewFile());
		
		this.dao.insert(map);
		
		return this.dao.insert(simpleReview);
	}
	
	@Transactional
	public int delete(SimpleReview selectReview, Map<String, Integer> map) {
		this.dao.deleteReview(selectReview);
		this.dao.deleteScore(selectReview.getSimple_review_score_id());
		this.dao.deleteLike(selectReview.getSimple_review_like_id());
		this.dao.deleteNotify(selectReview.getSimple_review_notify_id());
		this.dao.deleteFile(selectReview.getSimple_review_file_id());
		
		return this.dao.delete(map);
	}
	
	
	@Transactional
	public int update(SimpleReview simpleReview, Map<String, Integer> map) {
		this.dao.update(simpleReview.getSimpleReviewScore());
		this.dao.update(simpleReview.getSimpleReviewFile());
		this.dao.update(map);
		
		return this.dao.update(simpleReview);
	}
	
	public int allCount(int restaurant_id) {
		return this.dao.allCount(restaurant_id);
	}
	
	
	
	
	// 좋아요
	@Transactional
	public int addLikeCount(SimpleReview simpleReview) {
		this.dao.addLikeCount(simpleReview.getSimple_review_like_id());
		return this.dao.selectLikeCount(simpleReview.getSimple_review_id());
	}
	@Transactional
	public int cancelLikeCount(SimpleReview simpleReview) {
		this.dao.cancelLikeCount(simpleReview.getSimple_review_like_id());
		return this.dao.selectLikeCount(simpleReview.getSimple_review_id());
	}
	
	
	// 싫어요
	@Transactional
	public int addBadCount(SimpleReview simpleReview) {
		this.dao.addBadCount(simpleReview.getSimple_review_notify_id());
		return this.dao.selectBadCount(simpleReview.getSimple_review_id());
	}
	@Transactional
	public int cancelBadCount(SimpleReview simpleReview) {
		this.dao.cancelBadCount(simpleReview.getSimple_review_notify_id());
		return this.dao.selectBadCount(simpleReview.getSimple_review_id());
	}
}
