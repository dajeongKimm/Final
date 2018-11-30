<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>리뷰 삭제</title>
</head>
<body>
	<c:if test="${ deleteReview eq 0 }">
		<script type="text/javascript">
			alert("리뷰를 삭제하지 못하였습니다.");
			location.href="${ pageContext.request.contextPath }/allRestaurantList/${ restaurant_id }";
		</script>
	</c:if>
	
	<c:if test="${ deleteReview eq 1 }">
		<script type="text/javascript">
			alert("리뷰를 삭제하였습니다.");
			location.href="${ pageContext.request.contextPath }/allRestaurantList/${ restaurant_id }";
		</script>
	</c:if>
</body>
</html>