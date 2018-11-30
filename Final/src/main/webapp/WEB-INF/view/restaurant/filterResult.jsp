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
<title>Filter 검색창</title>
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
<style>
	#list{
		margin:50px;
		width: 800px;
		height: 100%;
		float: left;
	}
	#footer{
		clear: both;
	}
	#map{
		margin-top:30px;
	}
	#listandmap{
		width:1500px; margin: 0 auto; background: rgba(0,0,0,0,2);
	}
	#pasing{
		clear: both;
	}
	
</style>

</head>
<body>

<jsp:include page="/indexHeader.jsp"/>

<div id="listandmap">
	<div id="list">
	<table class="table table-hover">
		<c:if test="${empty filterResult }">
			검색결과가 없습니다.
		</c:if>
		<c:forEach var="filter" items="${filterResult}">
			<tr onmouseover="mouseOver('${filter.restaurant_name}', ${filter.map_coordinate_lat}, ${filter.map_coordinate_long})" 
				onmouseout="mouseOut()">
				<td rowspan="2" width="10px">${filter.restaurant_id}</td>
				<td rowspan="2" width="150px;">
					<img src="${pageContext.request.contextPath}/resources/${filter.restaurant_mainimage}" width="100px" height="100px" />
				</td>
				<td colspan="2">
					<a href="${pageContext.request.contextPath}/allRestaurantList/${filter.restaurant_id}">
						<h4>${filter.restaurant_name}</h4>
					</a>
				</td>
				<td style="text-align: right;" colspan="3">
					<c:if test="${ filter.sum_score eq 0}" var = "test" >
						<h4 style="color:orange">
							0.0
						</h4>
					</c:if>
					<c:if test = "${not test }">
					<h4 style="color:orange">
						<fmt:formatNumber value="${filter.sum_score / filter.allcount}"  pattern="0.0"/>	
					</h4>	
					</c:if>
				</td>
				<td style="text-align: right;">
					<img src="${pageContext.request.contextPath}/resources/img/eye.png" width="13px" height="13px">&nbsp;&nbsp;${filter.read_count}
				</td>
			</tr>
			<tr>
				<td colspan="7">${filter.restaurant_description}</td> 
			</tr>
		</c:forEach>
	</table>
	</div>

	<!-- 지도 -->
	<jsp:include page="/WEB-INF/view/map/typeMap.jsp"/>
</div>
	
	
	<jsp:include page="/indexFooter.jsp"/>

</body>
</html>