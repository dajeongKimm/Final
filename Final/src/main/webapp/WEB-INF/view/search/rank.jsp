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

<h5>급상승 검색어 </h5> 

<table class="table table-striped">
<c:forEach var="rank" items="${searchRank}" varStatus="status">
<c:if test="${empty rank}">
	검색기록이 없습니다.
</c:if>
<tr>
	<td>
		${status.count}위
	</td>
	<td>
		${rank.keyword}
	</td>
</tr>
</c:forEach>
</table>


</body>
</html>