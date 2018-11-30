<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과</title>
</head>
<body>
<c:if test="${result eq 1}" var="result">

	<script>
		alert('회원가입 성공');
		location.href="${pageContext.request.contextPath}/";
	</script>
</c:if>
<c:if test="${not result}">
<script>
		alert('회원가입 실패');
		location.href="${pageContext.request.contextPath}/member/myPageDelete";
	</script>
</c:if>
</body>
</html>