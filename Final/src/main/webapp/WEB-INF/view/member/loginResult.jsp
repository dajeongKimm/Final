<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>

<c:if test="${ loginmember eq null}">
	<script>
		alert('로그인 실패');
		location.href="${pageContext.request.contextPath}/member/login";
	</script>
</c:if>
<c:if test="${not empty loginmember }">
	<script>
		
	
		alert("로그인 성공 \n${loginmember.member_name} 님 환영합니다.");
		
		location.href="${pageContext.request.contextPath}";
	</script>
</c:if>
</body>
</html>