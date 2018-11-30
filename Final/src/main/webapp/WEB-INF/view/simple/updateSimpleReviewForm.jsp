<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , inital-scale=1.0">
<meta name="author" content="tje" , inital-scale=1.0">
<meta name="description" content="더조은 미슐랭: 테마별 맛집 추천 어플리케이션">
<meta name="keywords" content="맛집, 맛집 추천">
<meta name="robots" content="all">
<title>리뷰 수정</title>

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

<style type="text/css">
   #review{
      margin-left: 800px;
   }
</style>

</head>
<body>

<jsp:include page="/indexHeader.jsp"/>
	
	<div id="review">
	<h1>간단 리뷰</h1>
	솔직한 리뷰를 써주세요.<br>
	
	<p>
	
	<form action="${ pageContext.request.contextPath }/allRestaurantList/${ restaurant_id }/update/${ simple_review_id }" method="post" enctype="multipart/form-data">
	<input type="hidden" name="simpleReviewScore.member_id" value="${ loginmember.member_id }">
	
		<label for="simpleReviewScore.score_flavor">맛</label><br>
			<input type="radio" name="simpleReviewScore.score_flavor" value="1">1점
			<input type="radio" name="simpleReviewScore.score_flavor" value="2">2점
			<input type="radio" name="simpleReviewScore.score_flavor" value="3">3점
			<input type="radio" name="simpleReviewScore.score_flavor" value="4">4점
			<input type="radio" name="simpleReviewScore.score_flavor" value="5">5점
		
		<p>
		
		<label for="simpleReviewScore.score_volume">양</label><br>
			<input type="radio" name="simpleReviewScore.score_volume" value="1">1점
			<input type="radio" name="simpleReviewScore.score_volume" value="2">2점
			<input type="radio" name="simpleReviewScore.score_volume" value="3">3점
			<input type="radio" name="simpleReviewScore.score_volume" value="4">4점
			<input type="radio" name="simpleReviewScore.score_volume" value="5">5점
		
		<p>
		
		<label for="simpleReviewScore.score_service">서비스</label><br>
			<input type="radio" name="simpleReviewScore.score_service" value="1">1점
			<input type="radio" name="simpleReviewScore.score_service" value="2">2점
			<input type="radio" name="simpleReviewScore.score_service" value="3">3점
			<input type="radio" name="simpleReviewScore.score_service" value="4">4점
			<input type="radio" name="simpleReviewScore.score_service" value="5">5점
		
		<p>
		
		<label for="simpleReviewScore.score_totalScore">종합 평가</label><br>
			<input type="radio" name="simpleReviewScore.total_score" value="1" required>1점
			<input type="radio" name="simpleReviewScore.total_score" value="2">2점
			<input type="radio" name="simpleReviewScore.total_score" value="3">3점
			<input type="radio" name="simpleReviewScore.total_score" value="4">4점
			<input type="radio" name="simpleReviewScore.total_score" value="5">5점
			
			
		<p>
		
		<textarea rows="10" cols="50" name="simple_review_contents_text" placeholder="글자수는 500자로 제한됩니다." required>${ selectReview.simple_review_contents_text }</textarea>
		
		<p>
		
		<input type="file" name="simple_review_photo" multiple required>
		
		<p>
		
		<input type="reset" value="취소">
		<input type="submit" value="완료">
	</form>
	</div>
	
	<jsp:include page="/indexFooter.jsp"/>
	
</body>
</html>