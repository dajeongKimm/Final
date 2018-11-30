<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result eq 1}" var="result">
	회원가입 성공
	<a href="main">[메인페이지이동]</a>
</c:if>
<c:if test="${not result}">
	회원가입 실패
</c:if>

</body>
</html>