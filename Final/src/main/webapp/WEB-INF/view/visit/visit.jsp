<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문기록</title>
<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script> 
<script type = "text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"> </script>
</head>
<body>
<hr>
<h4>최근 본 맛집</h4>

<table class="table table-striped">
<c:forEach var="log" items="${visitLog}">
<c:if test="${empty visitLog}">
	방문기록이 없습니다.
</c:if>
<tr>
	<td rowspan="2">
	<img src="${pageContext.request.contextPath}/resources/${log.restaurant_mainimage}" width="70px" height="70px" >
	</td>
	<td>
		<a href="${pageContext.request.contextPath}/allRestaurantList/${log.restaurant_id}" target="_parent">${log.restaurant_name}</a>
	</td>
</tr>
<tr>
	<td> ${log.address_dong}-${log.menu_type}</td>
</tr>
</c:forEach>
</table>


</body>
</html>