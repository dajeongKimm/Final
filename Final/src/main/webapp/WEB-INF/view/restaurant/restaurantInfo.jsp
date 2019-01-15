<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , inital-scale=1.0">
<meta name="author" content="tje" , inital-scale=1.0">
<meta name="description" content="더조은 미슐랭: 테마별 맛집 추천 어플리케이션">
<meta name="keywords" content="맛집, 맛집 추천">
<meta name="robots" content="all">
<title>${selectOneRestaurant.restaurant_name}의 상세페이지 </title>

<%-- 부트스트랩 이용하기 --%>
<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script> 
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"> </script>

<!-- html 메인화면 적용시킨 것  -->
<%-- 부트스트랩 이용하기 --%>
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
	rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet">
<script>
function writeReviewBtn_click() {
	alert("로그인 후 작성할 수 있습니다.");
	location.href="${ pageContext.request.contextPath }/member/login";
}

function countBtn_click() {
	   alert("로그인이 필요한 기능입니다.");
	   location.href="${ pageContext.request.contextPath }/member/login";
}

</script>

<style>
	#storeandmap{
		width:1000px; margin: 0 auto; background: rgba(0,0,0,0,2);
	}
	#storeInfo{
		width:520px;
		height:100%;
		margin:30px;
		float: left;
	}
	#mapDiv{
		margin: 50px;
		padding-top: 70px;
	}
	#simpleReview{
		width:1030px; margin: 0 auto; background: rgba(0,0,0,0,2);
		clear: both;
	}
	 .score{
      text-align: center;
   }
   #button{
         float: right;
   }
   #member{
         margin-left: 45px;
   }
	
</style>
</head>
<body>

<jsp:include page="/indexHeader.jsp"/>

<div id="storeandmap">
<div id="storeInfo">

<table class="table table-striped">
	<caption><h3>${selectOneRestaurant.restaurant_name}</h3></caption>
	<tr>
		<th>${selectOneRestaurant.restaurant_name}</th>
		<th colspan="2">
			<c:if test="${ selectOneRestaurant.sum_score eq 0}" var = "test" >
			<h4 style="color:orange">
				0.0
			</h4>
			</c:if>
			<c:if test = "${not test }">
			<h4 style="color:orange">
			<fmt:formatNumber value="${selectOneRestaurant.sum_score / selectOneRestaurant.allcount}" pattern="0.0"/>	
			</h4>
			</c:if>
		</th>
		<th>
		<c:if test="${empty loginmember}" var="result">
			<button type="button" onclick="writeReviewBtn_click();" class="btn btn-outline-light">간단 리뷰 작성</button> <!-- 로그인 하지 않으면 사용할 수 없음 alert 창 -->
		</c:if>
		<c:if test="${not result}">
			<button type="button" 
				onclick="location.href='${ pageContext.request.contextPath }/allRestaurantList/${restaurant_id}/writeSimpleReview'"
				class="btn btn-outline-light">간단 리뷰 작성</button>
			
		</c:if>
		</th>
	</tr>
	<tr>
		<th>주소 </th>
		<td colspan="3">${selectOneRestaurant.address_city} ${selectOneRestaurant.address_gu} ${selectOneRestaurant.address_dong} ${selectOneRestaurant.address_detail}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td colspan="3">${selectOneRestaurant.restaurant_tel}</td>
	</tr>
	<tr>
		<th>음식종류</th>
		<td colspan="3">${selectOneRestaurant.menu_type}</td>
	</tr>
	<tr>
		<th>영업시간</th>
		<td>${selectOneRestaurant.restaurant_businesstime}</td>
		<th>Break Time</th>
		<td>${selectOneRestaurant.restaurant_breaktime}</td>
	</tr>
	<tr>
		<th>영업시작일</th>
		<td colspan="3">${selectOneRestaurant.restaurant_opendate}</td>
	</tr>
	<tr>
		<th>가게소개</th>
		<td colspan="3">${selectOneRestaurant.restaurant_description}</td>
	</tr>
	<tr>
		<th>대표사진</th>
		<td colspan="3">
			<img src="${pageContext.request.contextPath}/resources/${selectOneRestaurant.restaurant_mainimage}" width="200px" height="200px" >
		</td>
	</tr>
	<tr>
		<th> 메뉴 </th>
		<td colspan="3">
		<c:forEach var="menuList" items="${menuList}">
			<p>${menuList.menu_title}&nbsp;/${menuList.menu_price }&nbsp;원</p>
		</c:forEach>
		</td>
	</tr>
	<tr>
		<th> 할인정보 </th>
		<td colspan="3">
			<c:if test="${selectOneRestaurant.discount_coupon}" var="result1">
				&nbsp;쿠폰사용&nbsp;
			</c:if>
			<c:if test="${not result1}">
				<s>&nbsp;쿠폰사용&nbsp;</s>
			</c:if>
			
			<c:if test="${selectOneRestaurant.discount_mobile}" var="result2">
				&nbsp;통신사할인&nbsp;
			</c:if>
			<c:if test="${not result2}">
				<s>&nbsp;통신사할인&nbsp;</s>
			</c:if>
			
			<c:if test="${selectOneRestaurant.discount_savemoney}" var="result3">
				&nbsp;적립금사용&nbsp;
			</c:if>
			<c:if test="${not result3}">
				<s>&nbsp;적립금사용&nbsp;</s>
			</c:if>
		</td>
	</tr>
	
	<tr>
		<th> 편의시설 </th>
		<td colspan="3">
			<c:if test="${selectOneRestaurant.service_kidszon}" var="result4">
				&nbsp;키즈존&nbsp;
			</c:if>
			<c:if test="${not result4 }">
				<s>&nbsp;키즈존&nbsp;</s>
			</c:if>
			
			<c:if test="${selectOneRestaurant.service_pet}" var="result5">
				애완동물출입
			</c:if>
			<c:if test="${not result5 }">
				<s>&nbsp;애완동물출입&nbsp;</s>
			</c:if>
			
			<c:if test="${selectOneRestaurant.service_wipi}" var="result6">
				와이파이
			</c:if>
			<c:if test="${not result6 }">
				<s>&nbsp;와이파이&nbsp;</s>
			</c:if>
			
			<c:if test="${selectOneRestaurant.service_reservation}" var="result7">
				예약
			</c:if>
			<c:if test="${not result7 }">
				<s>&nbsp;예약&nbsp;</s>
			</c:if>
			
			<c:if test="${selectOneRestaurant.service_takeout}" var="result8">
				TakeOut
			</c:if>
			<c:if test="${not result8 }">
				<s>&nbsp;TakeOut&nbsp;</s>
			</c:if>
			
			<c:if test="${selectOneRestaurant.service_parking}" var="result9">
				주차가능
			</c:if>
			<c:if test="${not result9 }">
				<s>&nbsp;주차가능&nbsp;</s>
			</c:if>
			
			<c:if test="${selectOneRestaurant.service_toilet}" var="result10">
				남녀화장실구분
			</c:if>
			<c:if test="${not result10 }">
				<s>&nbsp;남녀화장실구분&nbsp;</s>
			</c:if>
			
			<c:if test="${selectOneRestaurant.service_delivery}" var="result11">
				배달가능
			</c:if>
			<c:if test="${not result11 }">
				<s>&nbsp;배달가능&nbsp;</s>
			</c:if>
		</td>
	</tr>
</table>
</div>



<!-- 상세위치 - 정적지도에 표시하기 -->
<div id="mapDiv">
<div id="staticMap" style="width:350px;height:350px;"></div>  

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d0a9c08b9476a9a60e5027f02a4d3fc"></script>
<script>
// 이미지 지도에서 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(${mapCoordinate.map_coordinate_lat}, ${mapCoordinate.map_coordinate_long}); 

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커는 Object 형태입니다
var marker = {
    position: markerPosition
};

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new daum.maps.LatLng(${mapCoordinate.map_coordinate_lat}, ${mapCoordinate.map_coordinate_long}), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: marker // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
</script>

</div>
</div>




<!-- 간단 리뷰 리스트 불러오기 -->
<div id="simpleReview">
<hr>
   <h3>간단 리뷰</h3>
   <c:if test="${empty SimpleReviewList }">
      <p>작성된 리뷰가 없습니다.</p>
   </c:if>
   
   <c:forEach var="reviewList" items="${ SimpleReviewList }">
   
   <div id="button">
      <c:if test="${ loginmember.member_id eq reviewList.member_id }">
         <button type="button" 
         	onclick="location.href='${ pageContext.request.contextPath }/allRestaurantList/${ reviewList.restaurant_id }/update/${reviewList.simple_review_id}'"
         	class="btn btn-outline-light">수정</button>
         <button type="button" 
         	onclick="location.href='${ pageContext.request.contextPath }/allRestaurantList/${ reviewList.restaurant_id }/delete/${reviewList.simple_review_id}'"
         	class="btn btn-outline-light">삭제</button>
      </c:if>   
   </div>
   
   <table class="table table-striped">
   
   	<tbody id ="tbody">
   
      <tr>
         <td width="200px">${ reviewList.member_nickname }</td>
         <td colspan="2">${ reviewList.simple_review_registdate }</td>
      </tr>
      <tr>
         <td>
         	<img id="member" src="${ pageContext.request.contextPath }/resources/upload/memberImage/${ reviewList.member_photo }" class="img-circle" width="100px" height="100px">
         </td>
         <td colspan="2">${ reviewList.simple_review_contents_text }</td>
      </tr>
      
      <tr>
         <td rowspan="5">
         
         <!-- 로그인 여부 검사 -->
            <c:if test="${ empty loginmember }" var="result">
               <button type="button" onclick="countBtn_click();" class="btn btn-link">
                  <img src="${ pageContext.request.contextPath }/resources/img/like.png" width="40px" height="40px">
               </button>
               <span>${ reviewList.simple_review_like_count }</span>
               
               <button type="button" onclick="countBtn_click();" class="btn btn-link">
                  <img src="${ pageContext.request.contextPath }/resources/img/bad.png" width="40px" height="40px">
               </button>
                <span>${ reviewList.simple_review_notify_count }</span>
            </c:if>
   
         
         	<c:if test="${ not result }">
            <button id="likeBtn" type="button" name="${ reviewList.simple_review_id }" class="btn btn-link">
            <img src="${ pageContext.request.contextPath }/resources/img/like.png" width="40px" height="40px">
            </button>
               <span id="likeCount">${ reviewList.simple_review_like_count }</span>
            <button id="badBtn" type="button" name="${ reviewList.simple_review_id }" class="btn btn-link">
            <img src="${ pageContext.request.contextPath }/resources/img/bad.png" width="40px" height="40px">
            </button>
               <span id="badCount">${ reviewList.simple_review_notify_count }</span>
              </c:if>
         </td>
         
         <td colspan="2">
            <c:forTokens var="fileName" items="${ reviewList.file_name }" delims=",">
               <img src="${ pageContext.request.contextPath }/resources/upload/simpleReview/${ fileName }" width="200px" height="200px">
            </c:forTokens>
         </td>
      </tr>
      
      <tr>
            <td class="score" width="60px">맛</td>
            <td> 
            <c:forEach begin="1" end="${ reviewList.score_flavor }">
               <img src="${ pageContext.request.contextPath }/resources/img/star.png" width="20px" height="20px">
            </c:forEach>
            </td>
      </tr>
      <tr>
         <td class="score">양</td>
         <td>
            <c:forEach begin="1" end="${ reviewList.score_volume }">
               <img src="${ pageContext.request.contextPath }/resources/img/star.png" width="20px" height="20px">
            </c:forEach>
         </td>
      </tr>
      <tr>
         <td class="score">서비스</td>
            <td> 
            <c:forEach begin="1" end="${ reviewList.score_service }">
               <img src="${ pageContext.request.contextPath }/resources/img/star.png" width="20px" height="20px">
            </c:forEach>
            </td>
      </tr>
      <tr>
         <td class="score">총점</td>
         <td>
            <c:forEach begin="1" end="${ reviewList.total_score }">
               <img src="${ pageContext.request.contextPath }/resources/img/star.png" width="20px" height="20px">
            </c:forEach>
         </td>
      </tr>
      
      </tbody>
      
   </table>
   <br>
   </c:forEach>
</div>

<!-- 더보기 처리 ajax 시도
<button onclick="add_list()">더보기</button>

<script type="text/javascript">

	var startIdx = 2; //초기값 2로 지정 (0,2) 다음 (2,2) 이기 때문에
	
	function add_list(){
		
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/add/board',
			data: {startIdx, startIdx},
			success: function(result){
				if(result.length != 0){
					$('#tbody').append(result);
					
					startIdx += 2;
				}else{
					alert("더이상 게시글이 없습니다.");
					return false;
				}
			}, 
			error: function(){
				alert("ajax 통신 에러");
			}
		});
	}
	

</script>
-->


<!-- 페이징 처리 -->
<div id="pasing" style="text-align: center">
   <ul class="pagination pagination-sm">
   <c:if test="${ page != 1 && page != 0}">      
      <li><a href="${pageContext.request.contextPath}/allRestaurantList/${selectOneRestaurant.restaurant_id}">처음</a></li>
   </c:if>
   
   <c:if test="${ startPage != 1 && page != 0}">   
      <li><a href="${pageContext.request.contextPath}/allRestaurantList/${selectOneRestaurant.restaurant_id}?page=${startPage-1}">이전</a></li>
   </c:if>
   
   <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
   <c:if test="${ i == page }" var="result">   
         <c:if test="${ i != 0 }">
            <li><a href="${pageContext.request.contextPath}/allRestaurantList/${selectOneRestaurant.restaurant_id}?page=${i}"><b>${ i }</b></a></li>
         </c:if>
   </c:if>         
   <c:if test="${ not result }">
      <li><a href="${pageContext.request.contextPath}/allRestaurantList/${selectOneRestaurant.restaurant_id}?page=${i}">${ i }</a></li>
   </c:if>         
   </c:forEach>
   
   <c:if test="${ endPage != totalPage }">   
      <li><a href="${pageContext.request.contextPath}/allRestaurantList/${selectOneRestaurant.restaurant_id}?page=${endPage+1}">다음</a></li>
   </c:if>

   <c:if test="${ page != totalPage && page != 0}">   
      <li><a href="${pageContext.request.contextPath}/allRestaurantList/${selectOneRestaurant.restaurant_id}?page=${totalPage}">끝</a></li>
   </c:if>
   </ul> 
</div>


<script type="text/javascript">

$("#likeBtn").click(function () {
   var simple_review_id = $(this).attr("name");
   
      $.ajax({
         type:"POST",
         url:"${ pageContext.request.contextPath }/likeCount/" + simple_review_id,
         dataType:"json",
         success:function(result){
            $("#likeCount").text(result.value);
         },
         error:function(){
            alert("에러입니다.");
         }
      });  
});



$("#badBtn").click(function () {
   
   var simple_review_id = $(this).attr("name");
      
      $.ajax({
         type:"POST",
         url:"${ pageContext.request.contextPath }/badCount/" + simple_review_id,
         dataType:"json",
         success:function(result){
            $("#badCount").text(result.value);
         },
         error:function(){
            alert("에러입니다.");
         }
      });
});

   
</script>

<div style="width:100%; height:100px; text-align:center; color: gray;">
	<hr>
	<h4>이 식당의 블로그 리뷰가 궁금하신가요?</h4>
	<a href="https://search.naver.com/search.naver?where=post&sm=tab_jum&query=${selectOneRestaurant.restaurant_name}" target="_blank">
		<span class="badge" style="margin-top:15px;">블로그 검색하기</span>
	</a>
</div>

<jsp:include page="/indexFooter.jsp"/>

</body>
</html>