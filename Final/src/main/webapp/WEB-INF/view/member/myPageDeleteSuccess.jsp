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
<c:if test="${ result eq 1}" >

	<script>
		alert('회원탈퇴 성공');
		location.href="${pageContext.request.contextPath}/";
	</script>
</c:if>
<c:if test="${result ne 1 }">
<script>
		alert('회원탈퇴 실패\n회원정보 불일치');
		location.href="${pageContext.request.contextPath}/member/myPageDelete";
	</script>
</c:if>
</body>
</html>