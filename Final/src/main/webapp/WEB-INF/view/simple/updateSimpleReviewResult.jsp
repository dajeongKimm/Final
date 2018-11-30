<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>리뷰 수정</title>
</head>
<body>
	<c:if test="${ updateReview eq 0 }">
		<script type="text/javascript">
			alert("리뷰 수정에 실패하였습니다.");
			location.href="${ pageContext.request.contextPath }/allRestaurantList/${ restaurant_id }";
		</script>
	</c:if>
	
	<c:if test="${ updateReview eq 1 }">
		<script type="text/javascript">
			alert("리뷰가 수정되었습니다.");
			location.href="${ pageContext.request.contextPath }/allRestaurantList/${ restaurant_id }";
		</script>
	</c:if>
</body>
</html>